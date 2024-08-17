//
//  RecipeDetails.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 17/08/24.
//

import Foundation

class RecipeDetailsViewModel {
    func fetchRecipesDetails(for recipeId: String) async throws -> SingleMealsModel {
        // Assume RecipeServices is handling the actual API call
        return try await RecipeServices().getRecipeDetails(recipeId);
    }
}
