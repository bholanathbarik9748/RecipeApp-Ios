import SwiftUI

struct UserRecipe: View {
    @State private var isLoading: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {                
                // Recipe List View
                CreateRecipeList()
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text("All Recipes 🫕")
                            .font(.custom("Roboto-Bold", size: 25))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("PrimaryOrange"))
                        
                        Spacer() // This will push the CreateNewRecipeView to the right end
                        
                        CreateNewRecipeView() // Move this here to align it to the right
                    }
                }
            }
            .scrollIndicators(.hidden)
            .onAppear {
                // Any initialization logic if needed
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

#Preview {
    UserRecipe()
}

struct CreateNewRecipeView: View {
    var body: some View {
        NavigationLink(destination: CreateRecipeForm()) {
            HStack {
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.white)
            }
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .background(Color("PrimaryOrange"))
            .cornerRadius(5)
            .padding(.vertical, 10)
        }
    }
}
