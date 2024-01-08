//
//  ContentView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 20.12.2023.
//

import SwiftUI

class NavigationCoordinator: ObservableObject {
    @Published var path = NavigationPath()

    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct ContentView: View {
    
    @StateObject var navigationCoordinator = NavigationCoordinator()
    @ObservedObject var model:Model

    var body: some View {
        NavigationStack(path: $navigationCoordinator.path){
            VStack{
                ScrollView{
                    VStack(alignment: .leading){
                        if let data = model.data {
                            AboutView(
                                imageUrls:data.image_urls,
                                rating: data.rating,
                                ratingName: data.rating_name,
                                name: data.name,
                                adress: data.adress,
                                minimalPrice: data.minimal_price,
                                priceForIt: data.price_for_it
                            )
                            InfoView(about: data.about_the_hotel)
                        }
                    }
                    .padding(.bottom,10)
                    .background(Color(hex: 0xF6F6F9))
                }
                NavigationLink(value: DataObject.init(name: "Room")){
                    HStack{
                        Text("К выбору номера")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment:.center)
                    .frame(height:48)
                    .background(Color(hex: 0x0D72FF))
                    .cornerRadius(15)
                    .padding([.leading,.trailing],16)
                }
                .navigationDestination(for: DataObject.self) { course in
                    switch course.name {
                    case "Room":
                        RoomsView(hotel: model.data)
                    case "Paid":
                        PaidView()
                    default:
                        EmptyView()
                    }
                }
            }
            .padding(0)
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
            .task {
                await model.prepareData()
            }
        }
        .accentColor(.black)
        .environmentObject(navigationCoordinator)
    }

    init(){
        model = Model()
    }
}

#Preview {
    ContentView()
}
