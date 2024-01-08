//
//  AboutView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 22.12.2023.
//

import SwiftUI

struct AboutView: View {
    let imageUrls:[URL]
    let rating:Int
    let ratingName:String
    let name:String
    let adress:String
    let minimalPrice:Double
    let priceForIt:String
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                CoverImageView(urls:imageUrls)
                    .cornerRadius(15)
                    .frame(height: 257)
                    .padding(.bottom,5)
                HStack(alignment:.center, spacing: 3){
                    Image(systemName: "star.fill")
                        .padding(.leading,10)
                    Text("\(rating)")
                    Text(ratingName)
                        .padding(.trailing,10)
                }
                .foregroundColor(Color(hex: 0xFFA800))
                .font(.system(size: 16, weight: .semibold))
                .padding(5)
                .background(Color(hex: 0xFFC700, alpha: 0.2))
                .cornerRadius(5)
                Text(name)
                    .font(.system(size: 22, weight: .semibold))
                Button {

                } label: {
                    Text(adress)
                        .font(.system(size: 14, weight: .semibold))
                        .padding([.top,.bottom],1)
                        .foregroundColor(Color(hex: 0x0D72FF))
                }
                HStack(alignment:.firstTextBaseline, spacing: 8){
                    Text("от")
                        .font(.system(size: 30, weight: .bold))
                    Text(Helper.currencyFormatter.string(from: minimalPrice as NSNumber) ?? "")
                        .font(.system(size: 30, weight: .bold))
                    Text(priceForIt)
                        .foregroundColor(Color(hex: 0x828796))
                        .font(.system(size: 16))
                }
            }
                .padding(16)
        }
            .background(.white)
            .roundedCorner(12, corners: [.bottomLeft, .bottomRight])
    }
}


