//
//  MainPage.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 05/08/24.
//

import SwiftUI

struct MainPage: View {
    @State private var isActiveSplash = true;
    
    var body: some View {
        ZStack{
            if isActiveSplash {
                SplashScreen()
            } else {
                Home()
            }
        }.onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation {
                    self.isActiveSplash = false
                }
            }
        }
    }
}

#Preview {
    MainPage()
}
