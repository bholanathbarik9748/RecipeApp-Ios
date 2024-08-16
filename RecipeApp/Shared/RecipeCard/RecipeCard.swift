import SwiftUI

struct RecipeCard: View {
    var mealName: String
    var mealImageUrl: String
    
    var body: some View {
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
                        .frame(width: 330, height: 150)
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
            
            HStack {
                // Meal Name
                Text(mealName)
                    .font(.custom("Roboto-Bold", size: 16))
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                Spacer()
                
                // Save Btn
                Button (action: {
                    print("hjj");
                }) {
                    HStack{
                        Image(systemName: "bookmark.fill")
                            .foregroundColor(.white)
                        
                        Text("Save")
                            .font(.custom("Roboto-Bold",size: 16))
                            .foregroundColor(.white)
                        
                    }
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .background(Color("PrimaryOrange"))
                    .cornerRadius(5)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}

#Preview {
    RecipeCard(
        mealName: "Spaghetti Bolognese",
        mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg"
    )
}
