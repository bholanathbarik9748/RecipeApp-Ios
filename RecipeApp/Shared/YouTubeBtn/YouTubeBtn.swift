import SwiftUI

struct YouTubeBtn: View {
    let url: String
    @State private var isError : Bool = false;
    private var youtubeURL: URL? {
        URL(string: url)
    }
    
    var body: some View {
        VStack {
            Button(action: {
                openYouTubeLink()
            }) {
                Text("Video Tutorial")
                    .font(.custom("Roboto-Regular", size: 16))
                    .foregroundColor(.white)
                    .padding(.horizontal,10)
                    .padding(.vertical,5)
                    .background(Color("PrimaryRed"))
                    .cornerRadius(5)
                    .padding(.vertical, 10)
                
            }
        }
        .alert(isPresented: $isError, content: {
            Alert(
                title: Text("Error"),
                message: Text("We encountered an issue. Please try again later."),
                dismissButton: .default(Text("OK"))
            )
        })
    }
    
    private func openYouTubeLink() {
        // Ensure the URL is valid
        guard let youtubeURL = youtubeURL else {
            isError = true;
            print("Invalid URL")
            return
        }
        
        // Use the YouTube URL scheme to check if the YouTube app can open the URL
        let youtubeAppURL = URL(string: "youtube://\(youtubeURL.absoluteString)")
        
        if let youtubeAppURL = youtubeAppURL,
           UIApplication.shared.canOpenURL(youtubeAppURL) {
            // Open the link in YouTube app
            UIApplication.shared.open(youtubeAppURL, options: [:], completionHandler: nil)
        } else {
            // Open the link in the default browser
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
}

#Preview {
    YouTubeBtn(url: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")
}
