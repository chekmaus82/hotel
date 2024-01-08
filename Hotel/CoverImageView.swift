//
//  CoverImageView.swift
//  Hotel
//
//  Created by Marina Chekmareva on 22.12.2023.
//

import Foundation
import SwiftUI

struct CoverImageView: View {

    let urls:[URL]
    
    var body: some View {
        TabView {
            ForEach(urls, id: \.self) { url in
                AsyncImage(url:url){ phase in
                    switch phase{
                    case .empty:
                        Image(systemName: "photo")
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure(_):
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .onAppear {
              setupAppearance()
            }
    }
    func setupAppearance() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .black
        UIPageControl.appearance().pageIndicatorTintColor = UIColor.black.withAlphaComponent(0.2)
      }
}

// MARK: - Preview
struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        let urls =
        [
            "https://www.atorus.ru/sites/default/files/upload/image/News/56149/Club_Priv%C3%A9_by_Belek_Club_House.jpg",
            "https://deluxe.voyage/useruploads/articles/The_Makadi_Spa_Hotel_02.jpg",
            "https://deluxe.voyage/useruploads/articles/article_1eb0a64d00.jpg"
        ]
            .map{
                URL(string: $0)!
            }
        List{
            CoverImageView(urls: urls)
                .frame(height: 257)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
    }
}
