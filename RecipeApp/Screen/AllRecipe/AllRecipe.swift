//
//  AllRecipe.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 15/08/24.
//

import SwiftUI

struct AllRecipe: View {
    var body: some View {
        NavigationView{
            VStack{
                ScrollView{
                    RecipeCard(mealName: "Spaghetti Bolognese",
                               mealCategory: "Pasta",
                               mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg")
                    RecipeCard(mealName: "Spaghetti Bolognese",
                               mealCategory: "Pasta",
                               mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg")
                    RecipeCard(mealName: "Spaghetti Bolognese",
                               mealCategory: "Pasta",
                               mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg")
                    RecipeCard(mealName: "Spaghetti Bolognese",
                               mealCategory: "Pasta",
                               mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg")
                    RecipeCard(mealName: "Spaghetti Bolognese",
                               mealCategory: "Pasta",
                               mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("All Recipes")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("PrimaryOrange"))
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    AllRecipe()
}