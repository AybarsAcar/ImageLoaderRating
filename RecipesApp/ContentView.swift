//
//  ContentView.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/21.
//

import SwiftUI


struct ContentView: View {
  
  private var groceryCategories = GroceryCategory.all
  
  @ObservedObject var viewModel: SettingsViewModel = SettingsViewModel()
  
  @State private var searchText: String = ""
  
  @State private var rating: Int?
  
  
  var body: some View {
    
    VStack {
      SearchBar(text: $searchText)
      
      Toggle(isOn: $viewModel.isOn) {
        Text("")
      }
      .fixedSize()
      
      List(Constants.posters, id: \.self) { poster in
        
        URLImage(url: poster)
          .scaledToFit()
      }
      
      
      VStack {
        RatingView(rating: $rating)
        if rating != nil {
          Text("Rate: \(rating!)")
        }
      }
      .padding()
      
      List (
        groceryCategories.filter { searchText.isEmpty ? true : $0.title.localizedCaseInsensitiveContains(searchText) },
        id: \.title
      ) { groceryCategory in
        
        Section(header: Text(groceryCategory.title).font(.title3)) {
          
          ForEach(groceryCategory.groceryItems, id:\.title) { item in
            Text(item.title)
          }
          
        }
        
      }
      .listStyle(.grouped)
    }
    .background(viewModel.isOn ? Color.gray : Color.white)
  }
}



struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
