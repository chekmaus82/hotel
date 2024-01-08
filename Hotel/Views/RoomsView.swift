//
//  RoomsView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 22.12.2023.
//

import SwiftUI

struct RoomsView: View {
    
    @ObservedObject var model:Model
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator

    let hotel:ContentView.Model.Item?
    
    init(hotel:ContentView.Model.Item?){
        model = Model()
        self.hotel = hotel
    }
    
    var body: some View {
        ScrollView{
            VStack{
                if let data = model.data{
                    ForEach(data.rooms) { room in
                        RoomView(data: room)
                    }
                }
            }
                .padding(.top,8)
                .padding(.bottom,10)
                .background(Color(hex: 0xF6F6F9))
        }
        .padding(.init(top: 1, leading: 1, bottom: 1, trailing: 1))
        .navigationTitle(hotel?.name ?? "")
        .task{
            await model.prepareData()
        }
    }
}

