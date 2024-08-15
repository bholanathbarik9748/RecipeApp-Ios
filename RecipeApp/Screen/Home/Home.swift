import SwiftUI

struct Home: View {
    init() {
        // Create a UITabBarAppearance instance
        let tabBarAppearance = UITabBarAppearance()

        // Customize the background color of the tab bar
        tabBarAppearance.backgroundColor = UIColor.systemBackground

        // Customize the shadow effect
        tabBarAppearance.shadowColor = UIColor.black.withAlphaComponent(0.1) // Shadow color
        tabBarAppearance.shadowImage = UIImage() // Remove default shadow image

        // Configure tab bar items' appearance
        let itemAppearance = UITabBarItemAppearance()
        itemAppearance.normal.iconColor = UIColor.gray // Set icon color for normal state
        itemAppearance.selected.iconColor = UIColor.orange // Set icon color for selected state
        
        // Apply the item appearance to the tab bar appearance
        tabBarAppearance.stackedLayoutAppearance = itemAppearance

        // Apply the customized appearance to the tab bar
        UITabBar.appearance().standardAppearance = tabBarAppearance
        UITabBar.appearance().scrollEdgeAppearance = tabBarAppearance
    }
    
    var body: some View {
        VStack {
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
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
                    .padding(.horizontal)
                    .padding(.top)
            )
            .padding(.bottom, 0) // Remove bottom padding
        }
    }
}

#Preview {
    Home()
}
