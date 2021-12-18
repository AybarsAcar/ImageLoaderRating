//
//  SearchBar.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/21.
//

import Foundation
import SwiftUI


struct SearchBar: UIViewRepresentable {
  
  @Binding var text: String
  
  class Coordinator: NSObject, UISearchBarDelegate {
    
    @Binding var text: String
    
    init(text: Binding<String>) {
      _text = text
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      text = searchText
    }
  }
  
  
  func makeCoordinator() -> Coordinator {
    return Coordinator(text: $text)
  }
  
  
  func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> some UISearchBar {
    
    let searchBar = UISearchBar(frame: .zero)
    
    searchBar.delegate = context.coordinator
    
    return searchBar
  }
  
  
  func updateUIView(_ uiView: UIViewType, context: Context) {
    uiView.text = text
  }
}
