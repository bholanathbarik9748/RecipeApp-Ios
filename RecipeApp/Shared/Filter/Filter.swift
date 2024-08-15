//
//  Filter.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 15/08/24.
//

import SwiftUI

struct Filter: View {
    @Binding var selected : String;
    
    var body: some View {
        Text(selected.prefix(1).capitalized + selected.dropFirst())
            .font(.subheadline)
            .foregroundColor(.white)
            .padding(.horizontal,10)
            .padding(.vertical,5)
            .background(Color("PrimaryOrange"))
            .cornerRadius(5)
            .padding(.vertical, 10)
    }
}

#Preview {
    Filter(selected: .constant("indian"))
}
