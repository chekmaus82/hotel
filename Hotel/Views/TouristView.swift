//
//  TouristView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 27.12.2023.
//

import SwiftUI

struct TouristView: View {
    
    @ObservedObject var card:TouristCard;
    
    init(card: TouristCard) {
        self.card = card
    }
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                HStack{
                    Text("\(card.number) турист")
                        .font(.system(size: 22, weight: .semibold))
                    Spacer()
                    Button(action: {
                        card.isCompact = !card.isCompact
                    }, label: {
                        if card.isCompact {
                            Image(systemName: "chevron.down.square.fill")
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(.blue)
                                .font(.system(size: 30))
                        }else{
                            Image(systemName: "chevron.up.square.fill")
                                .symbolRenderingMode(.hierarchical)
                                .foregroundStyle(.blue)
                                .font(.system(size: 30))
                        }
                    })
                }
                if !card.isCompact {
                    VStack(alignment: .leading, spacing: 0){
                        Text("Имя")
                            .foregroundColor(Color(hex: 0xA9ABB7))
                            .font(.system(size: 12))
                            .textContentType(.givenName)
                        TextField("", text: $card.name)
                            .foregroundColor(Color(hex: 0x14142B))
                            .font(.system(size: 16))
                    }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: card.showError && card.name.isEmpty ? 0xEB5757 : 0xF6F6F9, alpha: card.showError && card.name.isEmpty ?  0.15 : 1))
                    .cornerRadius(10)
                    VStack(alignment: .leading, spacing: 0){
                        Text("Фамилия")
                            .foregroundColor(Color(hex: 0xA9ABB7))
                            .font(.system(size: 12))
                        TextField("", text: $card.lastName)
                            .foregroundColor(Color(hex: 0x14142B))
                            .font(.system(size: 16))
                            .textContentType(.familyName)
                    }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: card.showError && card.lastName.isEmpty ? 0xEB5757 : 0xF6F6F9, alpha: card.showError && card.lastName.isEmpty ?  0.15 : 1))
                    .cornerRadius(10)
                    VStack(alignment: .leading){
                        TextField("Дата рождения", text: $card.birthday)
                            .foregroundColor(Color(hex: 0x14142B))
                            .font(.system(size: 17))
                            .textContentType(.birthdate)
                    }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: card.showError && card.birthday.isEmpty ? 0xEB5757 : 0xF6F6F9, alpha: card.showError && card.birthday.isEmpty ?  0.15 : 1))
                    .cornerRadius(10)
                    VStack(alignment: .leading){
                        TextField("Гражданство", text: $card.citizenship)
                            .foregroundColor(Color(hex: 0x14142B))
                            .font(.system(size: 17))
                            .textContentType(.countryName)
                    }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: card.showError && card.citizenship.isEmpty ? 0xEB5757 : 0xF6F6F9, alpha: card.showError && card.citizenship.isEmpty ?  0.15 : 1))
                    .cornerRadius(10)
                    VStack(alignment: .leading){
                        TextField("Номер загранпаспорта", text: $card.passportNumber)
                            .foregroundColor(Color(hex: 0x14142B))
                            .font(.system(size: 17))
                            .textContentType(.flightNumber)
                    }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: card.showError && card.passportNumber.isEmpty ? 0xEB5757 : 0xF6F6F9, alpha: card.showError && card.passportNumber.isEmpty ?  0.15 : 1))
                    .cornerRadius(10)
                    VStack(alignment: .leading){
                        TextField("Срок действия загранпаспорта", text: $card.validity)
                            .foregroundColor(Color(hex: 0x14142B))
                            .font(.system(size: 17))
                    }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: card.showError && card.validity.isEmpty ? 0xEB5757 : 0xF6F6F9, alpha: card.showError && card.validity.isEmpty ?  0.15 : 1))
                    .cornerRadius(10)
                }
            }
                .padding(16)
        }
                .background(.white)
                .cornerRadius(12)
                .padding(0)
    }

}
