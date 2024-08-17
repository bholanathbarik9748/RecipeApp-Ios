//
//  AllRecipeViewModel.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 17/08/24.
//

import Foundation

class AllRecipeViewMode {
    func fetchRecipes(for countryCode: String) async throws -> MealViewModel {
        // Assume RecipeServices is handling the actual API call
        return try await RecipeServices().getAllRecipes(countryCode)
    }
}
