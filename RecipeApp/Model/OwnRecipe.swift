//
//  OwnRecipe.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 19/08/24.
//

import Foundation

struct OwnRecipeModel : Identifiable {
    var id : UUID
    var title: String = ""
    var instruction: String = ""
    var type: RecipeType? = nil
    var country: String = ""
    var videoLink: String = ""
}

enum RecipeType : String {
    case veg =  "Veg";
    case nonVeg = "Non-Veg";
}
