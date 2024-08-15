//
//  MealModel.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 05/08/24.
//

import Foundation

struct MealViewModel : Observable, Decodable {
    let meals : [MealData]
}

struct MealData : Observable, Decodable {
    let strMeal : String
    let strMealThumb : String
    let idMeal : String
}
