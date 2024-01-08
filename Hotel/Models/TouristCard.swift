//
//  TouristCard.swift
//  Hotel
//
//  Created by Marina Chekmareva on 28.12.2023.
//

import Foundation
import SwiftUI

class Tourists:ObservableObject{
    @Published var cards:[TouristCard] = [TouristCard(index: 0)]
}

class TouristCard:ObservableObject,Hashable,Identifiable{
    static func == (lhs: TouristCard, rhs: TouristCard) -> Bool {
        lhs.id == rhs.id
    }
    
    static let indexToText:[String] = ["Первый", "Второй", "Третий", "Четвертый", "Пятый", "Шестой", "Седьмой", "Восьмой", "Девятый", "Десятый", "Одиннадцатый", "Двенадцатый", "Тринадцатый", "Четырнадцатый", "Пятнадцатый", "Шестнадцатый", "Семнадцатый", "Восемнадцатый", "Девятнадцатый"]
    
    var id:UUID = .init()
    let index:Int
    @Published var isCompact:Bool = false
    @Published var name:String
    @Published var lastName:String
    @Published var birthday:String
    @Published var citizenship:String
    @Published var passportNumber:String
    @Published var validity:String
    @Published var showError = false

    var number:String {
        return TouristCard.indexToText[index]
    }
        
    init(index:Int, name: String="", lastName: String="", birthday:String="", citizenship: String="", passportNumber: String="", validity: String="") {
        self.index = index
        self.name = name
        self.lastName = lastName
        self.birthday = birthday
        self.citizenship = citizenship
        self.passportNumber = passportNumber
        self.validity = validity
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    func isValid()->Bool{
        return !name.isEmpty && !lastName.isEmpty && !birthday.isEmpty && !citizenship.isEmpty && !passportNumber.isEmpty && !validity.isEmpty
    }
}
