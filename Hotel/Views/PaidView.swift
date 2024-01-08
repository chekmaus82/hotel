//
//  PaidView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 25.12.2023.
//

import SwiftUI

struct PaidView: View {
    @EnvironmentObject var navigationCoordinator: NavigationCoordinator

    var body: some View {
        VStack(alignment: .center){
            Image("PartyPopper")
                .padding(.bottom,32)
            Text("Ваш заказ принят в работу")
                .font(.system(size: 22, weight: .semibold))
                .padding(.bottom,20)
            Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                .font(.system(size: 16))
                .foregroundColor(Color(hex: 0x828796))
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.top, 122)
        .padding([.leading,.trailing],23)
        .navigationTitle("Заказ оплачен")
        Button {
            navigationCoordinator.popToRoot()
        } label: {
            HStack{
                Text("Супер!")
                    .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment:.center)
            .frame(height:48)
            .background(Color(hex: 0x0D72FF))
            .cornerRadius(15)
            .padding([.leading,.trailing],16)
        }
    }
}

#Preview {
    PaidView()
}
