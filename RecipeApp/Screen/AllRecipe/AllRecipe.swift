import SwiftUI


struct AllRecipe: View {
    @State private var viewModel = MealViewModel(meals: [])
    @State private var selectedCountryCode: String = "Indian"
    @State private var selected: [String] = ["Indian", "Italian", "Chinese", "Mexican", "American", "French",
                                              "Japanese", "Spanish", "Greek", "Thai", "Turkish", "Vietnamese"]
    var recipeServices = RecipeServices()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(selected, id: \.self) { countryCode in
                                Button(action: {
                                    selectedCountryCode = countryCode
                                    viewModel = MealViewModel(meals: []);
                                    fetchRecipes(for: selectedCountryCode)
                                }) {
                                    Filter(selected: .constant(countryCode))
                                }
                            }
                        }
                    }
                    .padding(.horizontal)
                    
                    // Display a message if no recipes are available
                    if viewModel.meals.isEmpty {
                        Text("No recipes available")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        ForEach(viewModel.meals, id: \.idMeal) { recipe in
                            RecipeCard(mealName: recipe.strMeal, mealImageUrl: recipe.strMealThumb)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("All Recipes 🫕")
                        .font(.custom("Roboto-Bold", size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("PrimaryOrange"))
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                fetchRecipes(for: selectedCountryCode)
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
    
    private func fetchRecipes(for countryCode: String) {
        Task {
            do {
                let fetchedRecipes = try await recipeServices.getAllRecipes(countryCode)
                // Debugging: Print fetched recipes
                print("Fetched recipes for \(countryCode): \(fetchedRecipes)")
                DispatchQueue.main.async {
                    viewModel = fetchedRecipes
                }
            } catch {
                // Debugging: Print error
                print("Error fetching recipes for \(countryCode): \(error)")
            }
        }
    }
}

#Preview {
    AllRecipe()
}
