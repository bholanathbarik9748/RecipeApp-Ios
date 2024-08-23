//
//  CreateRecipeList.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 22/08/24.
//

import SwiftUI

struct CreateRecipeList: View {
    @StateObject private var viewModel = OwnRecipeViewModel()
    @Environment(\.managedObjectContext) private var context
    @State private var isLoading : Bool = false;
    
    var body: some View {
        VStack {
            if viewModel.ownRecipe.isEmpty {
                VStack {
                    if viewModel.ownRecipe.isEmpty {
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
                }
            } else {
                ScrollView {
                    ForEach(viewModel.ownRecipe, id: \.id) { recipe in
                        OwnRecipeCard(
                            mealName: recipe.name ?? "",
                            mealVideoLink: recipe.videoLink ?? "",
                            mealInstruction: recipe.instruction ?? "",
                            mealCountry: recipe.country ?? "",
                            mealType : recipe.type ?? ""
                        )
                        .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getAllRecords(context: context)
        }
    }
}

struct OwnRecipeCard: View {
    let mealName: String
    let mealVideoLink: String
    let mealInstruction : String
    let mealCountry : String
    let mealType : String
    
    var body: some View {
        NavigationLink(destination:
                        OwnRecipeDescription(
                            country: mealCountry,
                            instruction: mealInstruction,
                            name: mealName,
                            type: mealType,
                            videoLink: mealVideoLink)) {
                                HStack {
                                    Text(mealName)
                                        .font(.headline)
                                        .padding(.bottom, 2)
                                    
                                    Spacer()
                                    
                                    YouTubeBtn(url: mealVideoLink)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(8)
                                .shadow(radius: 5)
                            }
                            .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    CreateRecipeList()
}
