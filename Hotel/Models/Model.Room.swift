//
//  Model.Room.swift
//  Hotel
//
//  Created by Marina Chekmareva on 24.12.2023.
//

import Foundation
import SwiftUI

extension RoomsView{
    
    class Model:ObservableObject{
        let source = RemoteData(
            url:  URL(string: "https://run.mocky.io/v3/8b532701-709e-4194-a41c-1a903af00195")!,
            type: Item.self
        )

        @Published var data:Item?
        
        @MainActor
        func prepareData()async{
            do{
                let item = try await source.contents;
                data = item
            }catch{
                print(error.localizedDescription)
                data = nil
            }
        }        
    }
}

extension RoomsView.Model{
    
    struct Item:Codable{
        let rooms:[Room]
        struct Room:Codable,Identifiable{
            let id:Int
            let name:String
            let price:Double
            let price_per:String
            let peculiarities:[String]
            let image_urls:[URL]
        }
    }
}

