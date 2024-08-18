import SwiftUI

struct RecipeCard: View {
    var mealId: String
    var mealName: String
    var mealImageUrl: String
    
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject var ViewModel = SavedViewModel()
    @State var isAlert: Bool = false
    @State var isAlertMeg: String = ""
    @State var isAlertHead: String = ""
    @State var isSave: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            // Meal Image with gradient overlay
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: URL(string: mealImageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 330, height: 150)
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
                Button(action: handlerSaveToggle) {
                    HStack {
                        Image(systemName: isSave ? "bookmark.fill" : "bookmark")
                            .foregroundColor(.white)
                        
                        Text(isSave ? "Un-Save" : "Save")
                            .font(.custom("Roboto-Bold", size: 16))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(isSave ? Color.gray.opacity(0.5) : Color("PrimaryOrange"))
                    .cornerRadius(5)
                }
            }
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 5)
        .padding(.horizontal)
        .alert(isPresented: $isAlert) {
            Alert(
                title: Text(isAlertHead),
                message: Text(isAlertMeg),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear {
            isSave = ViewModel.isRecordsSaved(context: viewContext, idMeal: mealId)
        }
    }
    
    private func handlerSaveToggle()  {
        if isSave {
            let response = ViewModel.deleteRecord(context: viewContext, idMeal: mealId)
            isAlert = true;
            if response["status"] as? String == "success" {
                isSave = false
                isAlertMeg = response["message"] as! String
                isAlertHead = "Success"
            } else {
                isSave = false
                isAlertMeg = response["message"] as! String
                isAlertHead = "Error"
            }
        } else {
            let response = ViewModel.createRecord(
                context: viewContext,
                idMeal: mealId,
                strMeal: mealName,
                strMealThumb: mealImageUrl
            )
            isAlert = true
            if response["status"] as? String == "success" {
                isSave = true
                isAlertMeg = response["message"] as! String
                isAlertHead = "Success"
            } else {
                isSave = true
                isAlertMeg = response["message"] as! String
                isAlertHead = "Error"
            }
        }
    }
}

#Preview {
    RecipeCard(
        mealId: "1",
        mealName: "Spaghetti Bolognese",
        mealImageUrl: "https://www.themealdb.com/images/media/meals/sutysw1468247559.jpg"
    )
}
