//
//  OwnRecipe.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 19/08/24.
//

import Foundation

struct OwnRecipe {
    var title: String = ""
    var instruction: String = ""
    var type: RecipeType? = nil
    var country: String = ""
    var videoLink: String = ""
    var ingredients: [Ingredient] = []
}

enum RecipeType : String {
    case veg =  "Veg";
    case nonVeg = "Non-Veg";
}

struct Ingredient: Identifiable {
    let id = UUID()
    var name: String
    var quantity: String
}
