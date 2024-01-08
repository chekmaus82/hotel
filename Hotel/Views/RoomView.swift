//
//  RoomView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 24.12.2023.
//

import SwiftUI

struct RoomView: View {
    let data:RoomsView.Model.Item.Room
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                CoverImageView(urls:data.image_urls)
                    .cornerRadius(15)
                    .frame(height: 257)
                    .padding(.bottom,5)
                Text(data.name)
                    .font(.system(size: 22, weight: .semibold))
                TagCloudView(tags: data.peculiarities)
                Button{

                } label: {
                    HStack{
                        Text("Подробнее о номере")
                            .padding(.leading,10)
                        Image(systemName: "chevron.right")
                            .padding(.trailing,5)
                    }
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(Color(hex: 0x0D72FF))
                    .padding(5)
                    .background(Color(hex: 0x0D72FF, alpha: 0.1))
                    .cornerRadius(5)
                }
                HStack(alignment:.firstTextBaseline, spacing: 8){
                    Text(Helper.currencyFormatter.string(from: data.price as NSNumber) ?? "")
                        .font(.system(size: 30, weight: .bold))
                    Text(data.price_per)
                        .foregroundColor(Color(hex: 0x828796))
                        .font(.system(size: 16))
                }
                NavigationLink {
                    ReservationView()
                        .toolbarRole(.editor)
                } label: {
                    HStack{
                        Text("Выбрать номер")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment:.center)
                    .frame(height:48)
                    .background(Color(hex: 0x0D72FF))
                    .cornerRadius(15)
                }
            }
                .padding(16)
        }
            .background(.white)
            .cornerRadius(12)
    }
}
