import SwiftUI

struct OwnRecipeDescription: View {
    let country: String
    let instruction: String
    let name: String
    let type: String
    let videoLink: String
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Recipe Name
                Text(name)
                    .font(.largeTitle.bold())
                    .foregroundColor(Color("PrimaryOrange"))
                    .padding(.bottom, 4)
                
                // Tag View (Country and Type)
                TagView(
                    strCategory: type,
                    strArea: country,
                    strTags: ""
                )
                .padding(.bottom, 16)
                
                // Instruction Section
                VStack(alignment: .leading, spacing: 12) {
                    Text("Instructions")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                        .padding(.bottom, 4)
                    
                    Text(instruction)
                        .font(.body)
                        .foregroundColor(.primary)
                        .lineSpacing(8) // Adjust line spacing for better readability
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                }
                .padding(.bottom, 16)
                
                // Video Link Button
                YouTubeBtn(url: videoLink)
                    .padding(.top, 16)
            }
            .padding()
        }
        .background(Color(.systemBackground))
        .navigationTitle("Recipe Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    OwnRecipeDescription(
        country: "Italian",
        instruction: "Boil pasta and mix with sauce.",
        name: "Spaghetti",
        type: "Main Course",
        videoLink: "http://example.com/video"
    )
}
