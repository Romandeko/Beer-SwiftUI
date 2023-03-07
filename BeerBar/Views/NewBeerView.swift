//
//  NewBeerView.swift
//  BeerBar
//
//  Created by Роман Денисенко on 5.02.23.
//

import Foundation
import SwiftUI


struct NewBeerView: View {
    
    @EnvironmentObject var viewModel : MainViewModel
    @ObservedObject private var newBeerViewModel = NewBeerViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            
            TextField("Name",
                      text: $newBeerViewModel.name ,
                      prompt: Text("Name").foregroundColor(.red)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(newBeerViewModel.isValidName ? .black : .red, lineWidth: 2)
            }
            .padding(.horizontal)
            
            TextField("Country",
                      text: $newBeerViewModel.country ,
                      prompt: Text("Country").foregroundColor(.red)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(newBeerViewModel.isValidCountry ? .black : .red, lineWidth: 2)
            }
            .padding(.horizontal)
            
            
            TextField("Count",
                      text: $newBeerViewModel.count ,
                      prompt: Text("Count").foregroundColor(.red)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(newBeerViewModel.isValidCount ? .black : .red, lineWidth: 2)
            }
            .padding(.horizontal)
            
            
            TextField("Price",
                      text: $newBeerViewModel.price ,
                      prompt: Text("Price").foregroundColor(.red)
            )
            .padding(10)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(newBeerViewModel.isValidPrice ? .black : .red, lineWidth: 2)
            }
            .padding(.horizontal)
            
            Button {
                newBeerViewModel.addNewBeer(name: newBeerViewModel.name, country: newBeerViewModel.country, count: newBeerViewModel.count, price: newBeerViewModel.price, viewModel: viewModel)
            } label: {
                Text("ADD")
                    .font(.title2)
                    .bold()
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
            }
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                LinearGradient(colors: [Color(red: 227/255, green: 37/255, blue: 107/255),Color(red: 242/255, green: 178/255, blue: 151/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
            )
            .cornerRadius(20)
            .padding()
            
        }.padding(.horizontal)
        
        
    }
}



struct NewBeerView_Previews: PreviewProvider {
    static var previews: some View {
        NewBeerView().environmentObject(MainViewModel())
    }
}
