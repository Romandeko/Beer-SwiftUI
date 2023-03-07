//
//  NewBeerViewModel.swift
//  BeerBar
//
//  Created by Роман Денисенко on 5.02.23.
//

import Foundation
import Combine

class NewBeerViewModel : ObservableObject{
    
    @Published var name = ""
    @Published var country = ""
    @Published var count = ""
    @Published var price = ""
    @Published var isValidName = false
    @Published var isValidCountry = false
    @Published var isValidPrice = false
    @Published var isValidCount = false
    
    private var cancellableSet : Set<AnyCancellable> = []
    
    init(){
        
        $name.receive(on: RunLoop.main)
            .map{ input in
                return input != ""
                
        }.assign(to:\.isValidName,on: self)
        .store(in: &cancellableSet)
        
        $country.receive(on: RunLoop.main)
            .map{ input in
                return input != ""
        }.assign(to: \.isValidCountry,on: self)
        .store(in: &cancellableSet)
        
        $count.receive(on: RunLoop.main)
            .map{ input in
                guard let beerCount = Int(input),beerCount > 0 else { return false}
                return true
        }.assign(to: \.isValidCount,on: self)
        .store(in: &cancellableSet)
        
        $price.receive(on: RunLoop.main)
            .map{ input in
                guard let beerPrice = Double(input),beerPrice > 0 else { return false}
                return true
        }.assign(to: \.isValidPrice,on: self)
        .store(in: &cancellableSet)
            
    }
    func addNewBeer(name:String,country : String,count: String,price : String,viewModel : MainViewModel){
        guard isValidName,isValidCount,isValidCountry,isValidPrice  else { return }
        viewModel.beers.append(Beer(name: name, country: country, price: Double(price) ?? 0, count: Int(count) ?? 0))
    }
}
