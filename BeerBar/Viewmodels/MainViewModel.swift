//
//  MenuViewModel.swift
//  BeerBar
//
//  Created by Роман Денисенко on 3.02.23.
//

import Foundation
import Combine
 class MainViewModel : ObservableObject{
    
   @Published var beers : [Beer] = []
   @Published var allPrice : Double = 0
   @Published var currentPrice : Double = 0
   @Published var currentCount : Int = 0
    
   var buttonTag = 1

    init(){
        beers.append(Beer(name: "Балтика", country:  "🇷🇺", price: 100, count: 25))
        beers.append(Beer(name: "Туборг", country:  "🇷🇺", price: 50, count: 11))
    }
    

    func buyAllBeer(){
        allPrice = 0
    }
    
    func addBeer(){
        guard currentCount > 0 else { return }
        allPrice += currentPrice
        currentCount -= 1
    }
    
    func chooseVolume( tag : Int, beer : Beer){
        buttonTag = tag
        if tag == 0 {
            currentPrice = beer.price * 0.5
        } else {
            currentPrice = beer.price * Double(tag)
        }
    }
     
    func setUp(index : Int){
        currentPrice = beers[index].price
        currentCount = beers[index].count
    }
     
     func closingView(index : Int){
         beers[index].count = currentCount
         buttonTag = 1
     }
}

