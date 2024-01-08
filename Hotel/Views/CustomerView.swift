//
//  CustomerView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 26.12.2023.
//

import SwiftUI

struct CustomerView: View {
    
    @State var phoneNumber:String
    @State var email:String
    @FocusState private var isFocused: Bool
    @State var emailError:Bool = false;
    
    var body: some View {
        VStack{
            VStack(alignment: .leading){
                Text("Информация о покупателе")
                        .font(.system(size: 22, weight: .semibold))
                VStack(alignment: .leading, spacing: 0){
                    Text("Номер телефон")
                        .foregroundColor(Color(hex: 0xA9ABB7))
                        .font(.system(size: 12))
                    TextField("", text: $phoneNumber)
                        .foregroundColor(Color(hex: 0x14142B))
                        .font(.system(size: 16))
                        .keyboardType (.numberPad)
                        .onChange (of: phoneNumber) {_ in
                            phoneNumber = phoneNumber.formatPhoneNumber()
                        }
                }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: 0xF6F6F9))
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 0){
                    Text("Почта")
                        .foregroundColor(Color(hex: 0xA9ABB7))
                        .font(.system(size: 12))
                    EmailInputView(placeHolder: "email@gmail.com", txt: $email)
                        .foregroundColor(Color(hex: 0x14142B))
                        .font(.system(size: 16))
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .focused($isFocused)
                        .onChange(of: isFocused) { isFocused in
                            if isFocused {
                                emailError = false
                            }else{
                                if !email.isEmpty && textFieldValidatorEmail(email) {
                                    emailError = false
                                }else{
                                    emailError = true
                                }
                            }
                        }
                }
                    .padding([.leading,.trailing],16)
                    .frame(height:52)
                    .background(Color(hex: emailError ? 0xEB5757 : 0xF6F6F9, alpha: emailError ?  0.15 : 1))
                    .cornerRadius(10)
                Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                        .font(.system(size: 14))
                        .foregroundColor(Color(hex: 0x828796))
            }
                .padding(16)
        }
                .background(.white)
                .cornerRadius(12)
                .padding(0)
    }

    private func textFieldValidatorEmail(_ string: String) -> Bool {
        if string.count > 100 {
            return false
        }
        let emailFormat = "(?:[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[\\p{L}0-9!#$%\\&'*+/=?\\^_`{|}" + "~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\" + "x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[\\p{L}0-9](?:[a-" + "z0-9-]*[\\p{L}0-9])?\\.)+[\\p{L}0-9](?:[\\p{L}0-9-]*[\\p{L}0-9])?|\\[(?:(?:25[0-5" + "]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-" + "9][0-9]?|[\\p{L}0-9-]*[\\p{L}0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21" + "-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        //let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: string)
    }
}
