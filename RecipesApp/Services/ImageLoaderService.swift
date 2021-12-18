//
//  ImageLoaderService.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/21.
//

import Foundation


class ImageLoaderService: ObservableObject {
  
  @Published var downloadedData: Data?
  
  
  func downloadImage(url: String) {
    
    guard let imageUrl = URL(string: url) else { return }
    
    URLSession.shared.dataTask(with: imageUrl) { data, _, error in
      
      // unwrap the data
      guard let data = data, error == nil else {
        return
      }
      
      DispatchQueue.main.async {
        self .downloadedData = data
      }
      
    }.resume()
    
  }
  
}
