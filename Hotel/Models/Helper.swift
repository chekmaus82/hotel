//
//  Helper.swift
//  Hotel
//
//  Created by Marina Chekmareva on 25.12.2023.
//

import Foundation
import SwiftUI

enum HotelError:Error{
    case badURL
}

struct Helper{
    
    static var currencyFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "RUR"
        formatter.currencySymbol = "₽"
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 0
        formatter.groupingSeparator = "."
        formatter.usesGroupingSeparator = true
        return formatter
    }

}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
}

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
    
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }

}

// First, a URLSession instance that never uses caches
extension URLSession {
    static let noCacheSession: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalAndRemoteCacheData
        return URLSession(configuration: config)
    }()
}

// Now our struct that will fetch and decode a URL every
// time we read its `contents` property

struct RemoteData<T: Decodable> {
    let url: URL
    let type: T.Type

    init(url: URL, type: T.Type) {
        self.url = url
        self.type = type
    }
    
    init(urlString:String, type: T.Type)throws{
        guard let url = URL(string: urlString) else{
            throw HotelError.badURL
        }
        self.url = url
        self.type = type
    }
    
    var contents: T {
        get async throws {
            let (data, _) = try await URLSession.noCacheSession.data(from: url)
            let df:DateFormatter = .init()
            df.timeStyle = .none;
            df.dateStyle = .short
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .formatted(df)
            return try decoder.decode(T.self, from: data)
        }
    }
}

struct DataObject: Identifiable, Hashable {
    let id = UUID()
    let name: String
}
