//
//  SplashScreen.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 05/08/24.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.orange , Color.red],
                startPoint: .topLeading,
                endPoint: .bottomLeading
            )
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
                    .foregroundColor(.white)
                
                Text("CookCraft")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.white)
                    .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2,x: 0,y: 2)
                
                Text("Delicious recipes at your fingertips")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                    .padding(.top, 8)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity) // Center content
        }
    }
}

#Preview {
    SplashScreen()
}
