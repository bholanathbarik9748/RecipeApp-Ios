import SwiftUI
import CoreData

struct SavedRecipe: View {
    @StateObject private var viewModel = SavedViewModel()
    @Environment(\.managedObjectContext) private var context;
    @State var isLoading : Bool = false;
    
    var body: some View {
        NavigationView {
            VStack {
                // Display a message if no recipes are available
                if viewModel.savedRecipes.isEmpty {
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
                        ForEach(viewModel.savedRecipes, id: \.idMeal) { recipe in
                            NavigationLink(destination: RecipeDescription(recipeId : recipe.idMeal ?? "")){
                                RecipeCard(mealId: recipe.idMeal ?? " ",
                                           mealName: recipe.strMeal ?? " ",
                                           mealImageUrl: recipe.strMealThumb ?? " ")
                            }
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Text("Saved Recipes 🍛")
                        .font(.custom("Roboto-Bold", size: 25))
                        .fontWeight(.semibold)
                        .foregroundColor(Color("PrimaryOrange"))
                }
            }
            .scrollIndicators(.hidden)
            .navigationViewStyle(StackNavigationViewStyle())
        }
        .onAppear {
            viewModel.getAllRecords(context: context)
        }
    }
}

#Preview {
    SavedRecipe()
}
