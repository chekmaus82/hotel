//
//  InfoView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 23.12.2023.
//

import SwiftUI

struct InfoView: View {
       
    typealias Item = ContentView.Model.Item
    
    let about:Item.About
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 16){
                Text("Об отеле")
                    .font(.system(size: 22, weight: .semibold))
                TagCloudView(tags: about.peculiarities)
                Text(about.description)
                    .font(.system(size: 16, weight: .regular))
                VStack{
                    HStack{
                        Image("emoji-happy")
                        VStack(alignment:.leading){
                            Text("Удобства")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(hex: 0x2C3035))
                            Text("Самое необходимое")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: 0x828796))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    Divider().padding(.leading,35)
                    HStack{
                        Image("tick-square")
                        VStack(alignment:.leading){
                            Text("Что включено")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(hex: 0x2C3035))
                            Text("Самое необходимое")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: 0x828796))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    Divider().padding(.leading,35)
                    HStack{
                        Image("close-square")
                        VStack(alignment:.leading){
                            Text("Что не включено")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color(hex: 0x2C3035))
                            Text("Самое необходимое")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(Color(hex: 0x828796))
                        }
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                }
                .padding(15)
                .background(Color(hex: 0xFBFBFC))
                .cornerRadius(15)
            }
            .padding(16)
        }
            .background(.white)
            .cornerRadius(12)
    }
}
