import SwiftUI

struct Home: View {
    var body: some View {
        ZStack {
            TabView {
                AllRecipe()
                    .tabItem {
                        Label("All Recipes", systemImage: "books.vertical.fill")
                    }
                
                UserRecipe()
                    .tabItem {
                        Label("Your Recipes", systemImage: "square.and.pencil.circle.fill")
                    }
                
                SavedRecipe()
                    .tabItem {
                        Label("Saved Recipes", systemImage: "square.and.arrow.down.on.square.fill")
                    }
            }
            .accentColor(Color("PrimaryOrange"))
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    Home()
}
