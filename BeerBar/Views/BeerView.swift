//
//  BeerView.swift
//  BeerBar
//
//  Created by Роман Денисенко on 5.02.23.
//

import SwiftUI

struct BeerView: View {
    
    @EnvironmentObject var viewModel : MainViewModel
    
    var index : Int
    
    var body: some View {
        ScrollView{
            VStack{
                Text("\(viewModel.beers[index].name)\(viewModel.beers[index].country)").font(.system(size: 28)).padding(.top,250)
                Text("Осталось \(viewModel.currentCount) шт.")
                    .padding(.top,50)
                    .font(.system(size: 20))
                Text("\(viewModel.currentPrice.withoutZeros)$").padding(.top,50)
                    .font(.system(size: 30))
                HStack{
                    Button {
                        viewModel.chooseVolume(tag: 0, beer: viewModel.beers[index])
                    }
                label: {
                    Text("0.5")
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .foregroundColor(viewModel.buttonTag == 0 ? Color.white : Color.black)
                        .background(viewModel.buttonTag == 0 ? Color.black : Color.white)
                        .cornerRadius(10)
                }
                .buttonStyle(.plain)
                    
                    Button {
                        viewModel.chooseVolume(tag: 1, beer: viewModel.beers[index])
                    } label: {
                        Text("1.0")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .foregroundColor(viewModel.buttonTag == 1 ? Color.white : Color.black)
                            .background(viewModel.buttonTag == 1 ? Color.black : Color.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                    
                    
                    Button {
                        viewModel.chooseVolume(tag: 2, beer: viewModel.beers[index])
                    } label: {
                        Text("2.0")
                            .padding(.horizontal, 16)
                            .padding(.vertical, 8)
                            .foregroundColor(viewModel.buttonTag == 2 ? Color.white : Color.black)
                            .background(viewModel.buttonTag == 2 ? Color.black : Color.white)
                            .cornerRadius(10)
                    }
                    .buttonStyle(.plain)
                }.padding(.top,50)
                
                Button {
                    viewModel.addBeer()
                           } label: {
                               Text("ADD")
                                   .font(.title2)
                                   .bold()
                                   .frame(maxWidth: .infinity)
                                   .foregroundColor(.white)
                           }
                           .frame(height: 50)
                           .frame(maxWidth: .infinity)
                           .background(
                            LinearGradient(colors: [Color(red: 234/255, green: 98/255, blue: 139/255),Color(red: 244/255, green: 177/255, blue: 245/255),Color(red: 179/255, green: 178/255, blue: 245/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                           )
                          
                           .cornerRadius(20)
                           .padding()

            }.padding(.top,-100)
                .onAppear {
                    viewModel.setUp(index:index)
                }
                .onDisappear{
                   viewModel.closingView(index: index)
                }
        }
    }
}

struct BeerView_Previews: PreviewProvider {
    static var previews: some View {
        BeerView(index: 0).environmentObject(MainViewModel())
    }
}
