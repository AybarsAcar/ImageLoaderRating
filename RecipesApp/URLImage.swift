//
//  URLImage.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/21.
//

import SwiftUI

struct Constants {
  static let posters: [String] = [
    "https://i.pinimg.com/originals/1b/94/51/1b9451b88913528346b9cbd2eefdf999.jpg",
    "https://images-na.ssl-images-amazon.com/images/I/A17sLQDQurL._AC_SL1500_.jpg",
    "https://i1.wp.com/batman-news.com/wp-content/uploads/2017/10/Justice-League-poster-Fandango.jpeg?resize=696%2C1031&quality=80&strip=info&ssl=1"
  ]
}

struct URLImage: View {
  
  let url: String
  let placeholder: String
  
  init(url: String, placeholder: String = "placeholder") {
    self.url = url
    self.placeholder = placeholder
    self.imageLoader.downloadImage(url: self.url)
  }
  
  @ObservedObject var imageLoader = ImageLoaderService()
  
  var body: some View {
    if let data = self.imageLoader.downloadedData {
      return Image(uiImage: UIImage(data: data)!).resizable()
    } else {
      return Image("placeholder").resizable()
    }
  }
}


