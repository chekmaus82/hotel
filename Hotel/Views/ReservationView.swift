//
//  ReservationView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 24.12.2023.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator

    @ObservedObject var model:Model
    @ObservedObject var tourists:Tourists = .init();
    
    init(){
        model = Model()
    }
    
    var body: some View {
        ScrollView{
            VStack(alignment:.leading){
                if let data = model.data {
                    BriefView(data: data)
                    DetailsView(data: data)
                    CustomerView(phoneNumber:"", email: "")
                    ForEach(tourists.cards){
                        TouristView(card: $0)
                    }
                    PaymentView(data: data)
                }
                Button(action: {
                    let index = tourists.cards.count
                    tourists.cards.append(.init(index: index))
                }, label: {
                    VStack{
                        HStack{
                            Text("Добавить туриста")
                                .font(.system(size: 22, weight: .semibold))
                            Spacer()
                            Image(systemName: "plus.app.fill")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .blue)
                                .font(.system(size: 30))
                        }
                        .padding([.leading,.trailing],16)
                        .frame(height: 58)
                    }
                    .background(.white)
                    .cornerRadius(12)
                })
            }
            .padding(.top,8)
            .padding(.bottom,10)
            .background(Color(hex: 0xF6F6F9))
        }
        .navigationTitle("Бронирование")
        Button(action: {
            let noValid = tourists.cards.contains(where: {!$0.isValid()})
            if !noValid {
                navigationCoordinator.path.append(DataObject(name: "Paid"))
            }else{
                tourists.cards.forEach{
                    $0.showError = true
                }
            }
        }, label: {
            HStack(alignment: .center){
                if let data = model.data{
                    Text("Оплатить")
                    Text(Helper.currencyFormatter.string(from: data.tour_price + data.fuel_charge + data.service_charge as NSNumber) ?? "")
                }
            }                    
            .font(.system(size: 16, weight: .semibold))
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment:.center)
            .frame(height:48)
            .background(Color(hex: 0x0D72FF))
            .cornerRadius(15)
            .padding([.leading,.trailing],16)
        })
        .task {
            await model.prepareData()
        }
    }
}
