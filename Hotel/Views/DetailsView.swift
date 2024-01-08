//
//  DetailsView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 25.12.2023.
//

import SwiftUI

struct DetailsView: View {
    
    let data:ReservationView.Model.Item
    let start:String
    let finish:String
    
    init(data:ReservationView.Model.Item){
        self.data = data
        let df = DateFormatter()
        df.timeStyle = .none
        df.dateStyle = .short
        df.locale = .current;
        start = df.string(from: data.tour_date_start)
        finish = df.string(from: data.tour_date_stop)
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Grid(alignment:.topLeading,
                     horizontalSpacing: 39,
                     verticalSpacing: 16){
                    GridRow {
                        Text("Вылет из")
                            .foregroundColor(Color(hex: 0x828796))
                        Text(data.departure)
                    }
                    GridRow {
                        Text("Страна, город")
                            .foregroundColor(Color(hex: 0x828796))
                        Text(data.arrival_country)
                    }
                    GridRow {
                        Text("Даты")
                            .foregroundColor(Color(hex: 0x828796))
                        Text("\(start) - \(finish)")
                    }
                    GridRow {
                        Text("Кол-во ночей")
                            .foregroundColor(Color(hex: 0x828796))
                        Text("\(data.number_of_nights)")
                    }
                    GridRow {
                        Text("Отель")
                            .foregroundColor(Color(hex: 0x828796))
                        Text(data.hotel_name)
                    }
                    GridRow {
                        Text("Номер")
                            .foregroundColor(Color(hex: 0x828796))
                        Text(data.room)
                    }
                    GridRow {
                        Text("Питание")
                            .foregroundColor(Color(hex: 0x828796))
                        Text(data.nutrition)
                        Spacer()
                    }
                }
            }
            .font(.system(size: 16))
            .padding(16)
        }
            .background(.white)
            .cornerRadius(12)
    }
}
