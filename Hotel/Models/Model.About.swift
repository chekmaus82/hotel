//
//  Model.swift
//  Hotel
//
//  Created by Marina Chekmareva on 20.12.2023.
//

import Foundation
import SwiftUI

extension ContentView{
    
    class Model:ObservableObject{
        
        @Published var data:Item?
        let source = RemoteData(
            url:  URL(string: "https://run.mocky.io/v3/d144777c-a67f-4e35-867a-cacc3b827473")!,
            type: Item.self
        )
                
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

extension ContentView.Model{
    
    struct Item:Codable{
        let id:Int
        let name:String
        let adress:String
        let minimal_price:Double
        let price_for_it:String
        let rating:Int
        let rating_name:String
        let image_urls:[URL]
        let about_the_hotel:About
        struct About:Codable{
            let description:String
            let peculiarities:[String]
        }
    }
    
}
