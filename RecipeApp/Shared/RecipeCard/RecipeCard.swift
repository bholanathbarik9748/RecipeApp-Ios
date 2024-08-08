//
//  RecipeCard.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 08/08/24.
//

import SwiftUI

struct RecipeCard: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    AsyncImage(url: URL(string: "https://developer.apple.com/news/images/og/apple-developer-og-twitter.png")) {
                        image in
                        image
                            .resizable()
                            .scaledToFit()
                    } placeholder: {
                        ProgressView()
                        
                    }
                    
                    Text("Recipe Name")
                    
                }
                .padding(10)
                .background(.gray)
                .cornerRadius(10)
            }
        }
    }
}

#Preview {
    RecipeCard()
}
