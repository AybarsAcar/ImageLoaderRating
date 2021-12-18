//
//  RatingView.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/2021.
//

import SwiftUI


struct RatingView: View {
  
  @Binding var rating: Int?
  
  var body: some View {
    
    HStack {
      ForEach(1...5, id: \.self) { index in
        
        Image(systemName: getStarType(index: index))
          .foregroundColor(.orange)
          .onTapGesture {
            rating = index
          }
        
      }
    }
  }
  
  
  private func getStarType(index: Int) -> String {
    
    if let rating = self.rating {
      return index <= rating ? "star.fill" : "star"
    } else {
      return "star"
    }
  }
}



struct RatingView_Previews: PreviewProvider {
  static var previews: some View {
    RatingView(rating: .constant(3))
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
