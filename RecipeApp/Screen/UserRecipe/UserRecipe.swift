//
//  UserRecipe.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 15/08/24.
//

import SwiftUI

struct UserRecipe: View {
    var body: some View {
        NavigationView {
            CreateNewRecipeView()
        }
        .navigationTitle("Your Recipes")
    }
}

#Preview {
    UserRecipe()
}

struct CreateNewRecipeView: View {
    var body: some View {
        NavigationLink(destination: CreateRecipeForm()) { // Use NavigationLink correctly
            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                
                Text("Create Your Recipe")
                    .font(.custom("Roboto-Regular", size: 20))
                    .foregroundColor(.white)
                    .padding(.vertical, 4)
                    .padding(.leading, 8)
            }
            .padding()
            .background(Color("PrimaryOrange"))
            .cornerRadius(8)
            .shadow(radius: 4)
        }
    }
}
