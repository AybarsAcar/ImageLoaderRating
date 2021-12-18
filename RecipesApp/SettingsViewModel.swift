//
//  SettingsViewModel.swift
//  RecipesApp
//
//  Created by Aybars Acar on 18/12/21.
//

import Foundation


///
/// layer that interacts with our User Defaults for our application
///
class SettingsViewModel: ObservableObject {
  
  @Published var isOn: Bool = UserDefaults.standard.bool(forKey: "isOn") {
    didSet {
      UserDefaults.standard.set(self.isOn, forKey: "isOn")
    }
  }
  
}
