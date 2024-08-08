//
//  SplashScreen.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 05/08/24.
//

import SwiftUI

struct SplashScreen: View {
    @State private var logoScale: CGFloat = 1.0
    @State private var logoOpacity: Double = 1.0
    @State private var textOpacity: Double = 0.0
    
    var body: some View {
        GeometryReader { geometry in
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
                        .frame(width: min(geometry.size.width * 0.3, 150),
                               height: min(geometry.size.height * 0.3, 150))
                        .foregroundColor(.white)
                        .scaleEffect(logoScale)
                        .opacity(logoOpacity)
                        .onAppear {
                            withAnimation(
                                Animation.easeIn(duration: 1.0).repeatForever(autoreverses: true)) {
                                    logoScale = 1.2
                                }
                            withAnimation(Animation.easeIn(duration: 1.0).delay(1.0)) {
                                logoOpacity = 1.0
                            }
                        }
                    
                    Text("CookCraft")
                        .font(.system(size: min(geometry.size.width * 0.1, 40),weight: .heavy))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 2,x: 0,y: 2)
                        .opacity(textOpacity)
                        .onAppear {
                            withAnimation(Animation.easeIn(duration: 1.0).delay(1.5)) {
                                textOpacity = 1.0
                            }
                        }
                    
                    Text("Delicious recipes at your fingertips")
                        .font(.subheadline)
                        .foregroundStyle(.white)
                        .padding(.top, 2)
                        .opacity(textOpacity)
                        .onAppear {
                            withAnimation(Animation.easeIn(duration: 1.0).delay(2.0)) {
                                textOpacity = 1.0
                            }
                        }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity) // Center content
            }
        }
    }
}

#Preview {
    SplashScreen()
}
