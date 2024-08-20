import SwiftUI

struct CreateRecipeForm: View {
    @State private var recipe: OwnRecipe = OwnRecipe()
    @State private var isAlert : Bool = false;
    @State private var isAlertMessage : String = "";
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe Name
                TextField("Recipe Name", text: $recipe.title)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // Recipe Type
                HStack(spacing: 20) {
                    RadioButton(selected: $recipe.type, option: .veg, title: "Veg")
                    RadioButton(selected: $recipe.type, option: .nonVeg, title: "Non Veg")
                }
                .padding(.horizontal)
                
                // Recipe Country
                TextField("Recipe Country", text: $recipe.country)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // Ingredients Table
                IngredientsCreateTable(ingredients: $recipe.ingredients)
                    .padding(.horizontal)
                
                // Instruction
                TextField("Instruction", text: $recipe.instruction, axis: .vertical)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // YouTube Link
                TextField("YouTube Link", text: $recipe.videoLink)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // Save Button
                Button(action: {
                    // Action to save the recipe
                    let isValidForm = CreateRecipeValidation().validate(recipe);
                    switch isValidForm {
                    case .success:
                        print("Sussess");
                    case .failure(let message) :
                        isAlertMessage = message;
                        isAlert = true;
                    }
                }) {
                    Text("Save Recipe")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
            }
            .padding(.bottom, 20)
            .alert(isPresented: $isAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(isAlertMessage),
                      dismissButton: .default(Text("Ok")))
            })
        }
        .background(Color(UIColor.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
    }
}

struct IngredientsCreateTable: View {
    @Binding var ingredients: [Ingredient]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Ingredient")
                    .font(.subheadline)
                    .padding(.horizontal)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Quantity")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.vertical, 8)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            ForEach($ingredients) { $ingredient in
                HStack {
                    TextField("Enter Ingredient", text: $ingredient.name)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    
                    TextField("Enter Quantity", text: $ingredient.quantity)
                        .padding(10)
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(10)
                    
                    Button(action: {
                        self.deleteIngredient(ingredient.id)
                    }) {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                    }
                    .padding(.leading, 10)
                }
                .padding(.vertical, 5)
            }
            
            Button(action: {
                addNewIngredient()
            }, label: {
                Text("Add New Ingredient")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            })
            .padding(.top, 10)
        }
        .padding(.top, 20)
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
                .foregroundColor(.orange)
            Text(title)
                .font(.body)
                .foregroundColor(selected == option ? .orange : .primary)
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
        .onTapGesture {
            selected = option
        }
    }
}

#Preview {
    CreateRecipeForm()
}
