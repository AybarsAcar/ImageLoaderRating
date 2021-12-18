//
//  GroceryCategory.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/21.
//

import Foundation


struct GroceryCategory {
  let title: String // name of the grocery store
  let groceryItems: [GroceryItem]
}

struct GroceryItem {
  let title: String
  let price: Double
}


extension GroceryCategory {
  static var all: [GroceryCategory] {
    
    return [
      GroceryCategory(title: "HEB", groceryItems: [
        GroceryItem(title: "Milk", price: 4.5),
        GroceryItem(title: "Cookies", price: 5.0)
      ]),
      
      GroceryCategory(title: "Fiesta", groceryItems: [
        GroceryItem(title: "Fish", price: 10),
        GroceryItem(title: "Juice", price: 3.5)
      ])
    ]
    
  }
}
