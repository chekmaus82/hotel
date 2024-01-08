//
//  Model.Reservation.swift
//  Hotel
//
//  Created by Marina Chekmareva on 25.12.2023.
//

import Foundation

extension ReservationView{
    
    class Model:ObservableObject{
        let source = RemoteData(
            url:  URL(string: "https://run.mocky.io/v3/63866c74-d593-432c-af8e-f279d1a8d2ff")!,
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

extension ReservationView.Model{
    
    struct Item:Codable{
        let id:Int
        let hotel_name:String
        let hotel_adress:String
        let horating:Int
        let rating_name:String
        let departure:String
        let arrival_country:String
        let tour_date_start:Date
        let tour_date_stop:Date
        let number_of_nights:Int
        let room:String
        let nutrition:String
        let tour_price:Double
        let fuel_charge:Double
        let service_charge:Double
    }
}
