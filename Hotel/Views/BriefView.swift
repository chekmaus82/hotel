//
//  BriefView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 25.12.2023.
//

import SwiftUI

struct BriefView: View {
    
    let data:ReservationView.Model.Item
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack(alignment:.center, spacing: 3){
                    Image(systemName: "star.fill")
                        .padding(.leading,10)
                    Text("\(data.horating)")
                    Text(data.rating_name)
                        .padding(.trailing,10)
                }
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color(hex: 0xFFA800))
                .padding(5)
                .background(Color(hex: 0xFFC700, alpha: 0.2))
                .cornerRadius(5)
                Text(data.hotel_name)
                    .font(.system(size: 22, weight: .semibold))
                Button {
                    
                } label: {
                    Text(data.hotel_adress)
                        .font(.system(size: 14, weight: .semibold))
                        .padding([.top,.bottom],1)
                        .foregroundColor(Color(hex: 0x0D72FF))
                    Spacer()
                }
            }
                .padding(16)
        }
            .background(.white)
            .cornerRadius(12)
    }
}
