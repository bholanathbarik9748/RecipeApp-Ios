import SwiftUI

struct RecipeCard: View {
    var mealName: String
    var mealCategory: String
    var mealImageUrl: String
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    // Meal Image with gradient overlay
                    ZStack(alignment: .bottomLeading) {
                        AsyncImage(url: URL(string: mealImageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 330,
                                       height: 150)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                                .frame(width: geometry.size.width, height: 100)
                        }
                        
                        // Gradient overlay for better text visibility
                        LinearGradient(
                            gradient: Gradient(colors: [.clear, .black.opacity(0.7)]),
                            startPoint: .center,
                            endPoint: .bottom
                        )
                        .frame(height: 60)
                    }
                    .cornerRadius(10)
                    
                    // Meal Name
                    Text(mealName)
                        .font(.headline)
                        .foregroundColor(.primary)
                        .lineLimit(1)
                    
                    // Meal Category
                    Text(mealCategory)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(10)
                .shadow(radius: 5)
            }
        }
        .padding()
    }
}

#Preview {
    RecipeCard(
        mealName: "Spaghetti Bolognese",
        mealCategory: "Pasta",
        mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg"
    )
}