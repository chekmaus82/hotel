//
//  PaymentView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 27.12.2023.
//

import SwiftUI

struct PaymentView: View {
    
    let data:ReservationView.Model.Item
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    VStack(alignment: .leading, spacing: 16){
                        Text("Тур")
                        Text("Топливный сбор")
                        Text("Сервисный сбор")
                        Text("К оплате")
                    }
                    .font(.system(size: 16))
                    .foregroundColor(Color(hex: 0x828796))
                    Spacer()
                    VStack(alignment: .trailing, spacing: 16){
                        Text(Helper.currencyFormatter.string(from: data.tour_price as NSNumber) ?? "")
                        Text(Helper.currencyFormatter.string(from: data.fuel_charge as NSNumber) ?? "")
                        Text(Helper.currencyFormatter.string(from: data.service_charge as NSNumber) ?? "")
                        Text(Helper.currencyFormatter.string(from: data.tour_price + data.fuel_charge + data.service_charge as NSNumber) ?? "")
                            .foregroundColor(Color(hex: 0x0D72FF))
                    }
                    .font(.system(size: 16))
                }
            }
            .padding(16)
        }
        .background(.white)
        .cornerRadius(12)
    }
}
