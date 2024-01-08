//
//  EmailView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 27.12.2023.
//

import SwiftUI
import Combine

struct EmailInputView: View {
    var placeHolder: String = ""
    @Binding var txt: String
    
    var body: some View {
        TextField(placeHolder, text: $txt)
            .keyboardType(.emailAddress)
            .onReceive(Just(txt)) { newValue in
                let validString = newValue.filter { "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ._-+$!~&=#[]@".contains($0) }
                if validString != newValue {
                    self.txt = validString
                }
        }
    }
}

