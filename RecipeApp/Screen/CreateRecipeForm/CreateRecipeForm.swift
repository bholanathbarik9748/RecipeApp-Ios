//
//  CreateRecipeForm.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 19/08/24.
//

import SwiftUI

struct CreateRecipeForm: View {
    @State private var recipe: OwnRecipe = OwnRecipe()
    
    var body: some View {
        VStack(alignment: .leading) {
            TextField("Please Enter Recipe name", text: $recipe.title)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            HStack {
                RadioButton(selected: $recipe.type, option: .veg, title: "Veg")
                RadioButton(selected: $recipe.type, option: .nonVeg, title: "Non-Veg")
            }
            
            TextField("Please Enter Recipe Country", text: $recipe.country)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            IngredientsCreateTable(ingredients: $recipe.ingredients)
            
            TextField("Please Enter Instruction", text: $recipe.instruction)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextField("Please Enter YouTube Link", text: $recipe.videoLink)
                .textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding()
    }
}

struct IngredientsCreateTable: View {
    @Binding var ingredients: [Ingredient]
    
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
            
            ForEach($ingredients) { $ingredient in
                HStack {
                    TextField("Enter Ingredient", text: $ingredient.name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TextField("Enter Quantity", text: $ingredient.quantity)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        self.deleteIngredient(ingredient.id)
                    }) {
                        Text("Delete")
                            .foregroundColor(.red)
                    }
                    .padding(.horizontal, 5)
                }
            }
            Button(action: {
                addNewIngredient()
            }, label: {
                Text("Add New Ingredient")
            })
        }
    }
    
    private func deleteIngredient(_ id: UUID) {
        ingredients.removeAll { $0.id == id }
    }
    
    private func addNewIngredient() {
        ingredients.append(Ingredient(name: "", quantity: ""))
    }
}

struct RadioButton: View {
    @Binding var selected: RecipeType?
    let option: RecipeType
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: selected == option ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.blue)
            Text(title)
                .font(.body)
        }
        .onTapGesture {
            selected = option
        }
    }
}



#Preview {
    CreateRecipeForm()
}
