//
//  RecipeDescription.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 17/08/24.
//

import SwiftUI

struct RecipeDescription: View {
    let recipeId: String
    var recipeViewModel = RecipeDetailsViewModel()
    @State private var Ingredient: [String: String] = [:]
    @State private var isLoading: Bool = false
    @State private var viewModel = SingleMealsModel(meals: [])
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading recipes...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .padding()
            } else {
                ScrollView {
                    VStack(spacing: 16) {
                        if let meal = viewModel.meals.first {
                            AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(height: 250)
                                    .clipped()
                            } placeholder: {
                                ProgressView()
                                    .frame(height: 250)
                            }
                            
                            Text(meal.strMeal)
                                .font(.title2.bold())
                                .foregroundColor(Color("PrimaryOrange"))
                            
                            TagView(
                                strCategory: meal.strCategory,
                                strArea: meal.strArea,
                                strTags: meal.strTags ?? ""
                            )
                            
                            IngredientsList(ingredients: Ingredient)
                            
                            VStack(alignment: .leading, spacing: 12) {
                                Text("Instructions")
                                    .font(.title3.bold())
                                    .padding(.bottom, 4)
                                
                                Text(meal.strInstructions)
                                    .font(.body)
                                    .foregroundColor(.primary)
                                    .lineSpacing(6) // Adjust line spacing for better readability
                                    .padding()
                                    .background(Color.gray.opacity(0.1))
                                    .cornerRadius(8)
                            }
                            .padding()
                        } else {
                            NoRecipesView()
                        }
                    }
                    .padding()
                    .edgesIgnoringSafeArea(.top)
                }
                .scrollIndicators(.hidden)
            }
        }
        .onAppear {
            fetchRecipeDetails(for: recipeId)
        }
    }
    
    private func fetchRecipeDetails(for recipeId: String) {
        Task {
            withAnimation {
                isLoading = true
            }
            do {
                let fetchedRecipes = try await recipeViewModel.fetchRecipesDetails(for: recipeId)
                DispatchQueue.main.async {
                    if let meal = fetchedRecipes.meals.first {
                        if let ingredient1 = meal.strIngredient1, !ingredient1.isEmpty {
                            Ingredient[ingredient1] = meal.strMeasure1;
                        }
                        if let ingredient2 = meal.strIngredient2, !ingredient2.isEmpty {
                            Ingredient[ingredient2] = meal.strMeasure2;
                        }
                        if let ingredient3 = meal.strIngredient3, !ingredient3.isEmpty {
                            Ingredient[ingredient3] = meal.strMeasure3;
                        }
                        if let ingredient4 = meal.strIngredient4, !ingredient4.isEmpty {
                            Ingredient[ingredient4] = meal.strMeasure4;
                        }
                        if let ingredient5 = meal.strIngredient5, !ingredient5.isEmpty {
                            Ingredient[ingredient5] = meal.strMeasure5;
                        }
                        if let ingredient6 = meal.strIngredient6, !ingredient6.isEmpty {
                            Ingredient[ingredient6] = meal.strMeasure6;
                        }
                        if let ingredient7 = meal.strIngredient7, !ingredient7.isEmpty {
                            Ingredient[ingredient7] = meal.strMeasure7;
                        }
                        if let ingredient8 = meal.strIngredient8, !ingredient8.isEmpty {
                            Ingredient[ingredient8] = meal.strMeasure8;
                        }
                        if let ingredient9 = meal.strIngredient9, !ingredient9.isEmpty {
                            Ingredient[ingredient9] = meal.strMeasure9;
                        }
                        if let ingredient10 = meal.strIngredient10, !ingredient10.isEmpty {
                            Ingredient[ingredient10] = meal.strMeasure10;
                        }
                        if let ingredient11 = meal.strIngredient11, !ingredient11.isEmpty {
                            Ingredient[ingredient11] = meal.strMeasure11;
                        }
                        if let ingredient12 = meal.strIngredient12, !ingredient12.isEmpty {
                            Ingredient[ingredient12] = meal.strMeasure12;
                        }
                        if let ingredient13 = meal.strIngredient13, !ingredient13.isEmpty {
                            Ingredient[ingredient13] = meal.strMeasure13;
                        }
                        if let ingredient14 = meal.strIngredient14, !ingredient14.isEmpty {
                            Ingredient[ingredient14] = meal.strMeasure14;
                        }
                        if let ingredient15 = meal.strIngredient15, !ingredient15.isEmpty {
                            Ingredient[ingredient15] = meal.strMeasure15;
                        }
                        if let ingredient16 = meal.strIngredient16, !ingredient16.isEmpty {
                            Ingredient[ingredient16] = meal.strMeasure16;
                        }
                        if let ingredient17 = meal.strIngredient17, !ingredient17.isEmpty {
                            Ingredient[ingredient17] = meal.strMeasure17;
                        }
                        if let ingredient18 = meal.strIngredient18, !ingredient18.isEmpty {
                            Ingredient[ingredient18] = meal.strMeasure18;
                        }
                        if let ingredient19 = meal.strIngredient19, !ingredient19.isEmpty {
                            Ingredient[ingredient19] = meal.strMeasure19;
                        }
                        if let ingredient20 = meal.strIngredient20, !ingredient20.isEmpty {
                            Ingredient[ingredient20] = meal.strMeasure20;
                        }
                    }
                    viewModel = fetchedRecipes
                }
            } catch {
                print("Error fetching recipes for \(recipeId): \(error)")
            }
            withAnimation {
                isLoading = false
            }
        }
    }
}

struct IngredientsList: View {
    let ingredients: [String: String]
    
    var body: some View {
        VStack {
            HStack {
                Text("Ingredient")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Quantity")
                    .fontWeight(.bold)
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(Color.gray.opacity(0.2))
            .cornerRadius(8)
            
            ForEach(Array(ingredients.sorted(by: <).enumerated()), id: \.element.key) { index, pair in
                HStack {
                    Text(pair.key)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(pair.value)
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(index % 2 == 0 ? Color.white : Color.gray.opacity(0.05))
                .cornerRadius(8)
            }
        }
        .padding()
    }
}

struct NoRecipesView: View {
    var body: some View {
        VStack {
            Image(systemName: "tray")
                .font(.system(size: 50))
                .foregroundColor(.gray)
                .padding(.bottom, 10)
            
            Text("No recipes available")
                .foregroundColor(.gray)
                .font(.body)
                .padding()
        }
        .transition(.opacity)
    }
}

struct TagView: View {
    let strCategory: String
    let strArea: String
    let strTags: String
    
    var body: some View {
        HStack(spacing: 8) {
            Tag(text: strCategory, color: Color.orange.opacity(0.2))
            Tag(text: strArea, color: Color.red.opacity(0.2))
            if !strTags.isEmpty {
                Tag(text: strTags, color: Color.red.opacity(0.2))
            }
        }
        .padding(.vertical, 5)
    }
    
    private struct Tag: View {
        let text: String
        let color: Color
        
        var body: some View {
            Text(text)
                .font(.subheadline.bold())
                .padding(5)
                .background(color)
                .cornerRadius(5)
        }
    }
}

#Preview {
    RecipeDescription(recipeId: "52965")
}
