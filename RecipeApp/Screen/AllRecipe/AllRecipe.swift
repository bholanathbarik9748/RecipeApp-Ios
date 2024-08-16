import SwiftUI


struct AllRecipe: View {
    @State private var viewModel = MealViewModel(meals: [])
    @State private var isLoading : Bool = false;
    @State private var selectedCountryCode: String = "Indian"
    @State private var selected: [String] = ["Indian", "Italian", "Chinese", "Mexican","American", "French",
                                             "Japanese", "Spanish", "Greek", "Thai", "Turkish", "Vietnamese"]
    var recipeServices = RecipeServices()
    
    var body: some View {
        NavigationView {
            VStack {
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
                    VStack {
                        Spacer()
                        if isLoading {
                            ProgressView("Loading recipes...")
                                .progressViewStyle(CircularProgressViewStyle())
                                .padding()
                        } else {
                            VStack {
                                Image(systemName: "tray")
                                    .font(.system(size: 50))
                                    .foregroundColor(.gray)
                                    .padding(.bottom, 10)
                                
                                Text("No recipes available")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 18, weight: .medium))
                                    .padding()
                            }
                            .transition(.opacity)
                        }
                        Spacer()
                    }
                } else {
                    ScrollView {
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
            withAnimation {
                isLoading = true
            }
            do {
                let fetchedRecipes = try await recipeServices.getAllRecipes(countryCode)
                // Debugging: Print fetched recipes
                DispatchQueue.main.async {
                    viewModel = fetchedRecipes
                }
            } catch {
                // Debugging: Print error
                print("Error fetching recipes for \(countryCode): \(error)")
            }
            withAnimation {
                isLoading = false
            }
        }
    }
}

#Preview {
    AllRecipe()
}
