//
//  ContentView.swift
//  BeerBar
//
//  Created by Роман Денисенко on 3.02.23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                NavigationLink(destination: NewBeerView()){
                    Image(systemName: "plus").foregroundColor(.black)
                }.frame(width: 370,alignment: .trailing)
                
                Text("Total price: \(viewModel.allPrice.withoutZeros)$")
                
                Button {
                    viewModel.buyAllBeer()
                } label: {
                    Text("Buy")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                }
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(
                    LinearGradient(colors: [Color(red: 128/255, green: 138/255, blue: 200/255),Color(red: 255/255, green: 129/255, blue: 157/255),Color(red: 234/255, green: 194/255, blue: 58/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .cornerRadius(15)
                .padding()
                
                List (viewModel.beers, id: \.self){beer in
                    NavigationLink( destination: BeerView(index: viewModel.beers.firstIndex(where: {$0.name == beer.name}) ?? 0)){
                        Text("\(beer.name)\(beer.country)").contentShape(Rectangle())
                    }
                }
            }
        }.environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


