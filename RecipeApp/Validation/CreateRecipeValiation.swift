//
//  CreateRecipeValiation.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 20/08/24.
//

import Foundation

enum ValidationResult {
    case success
    case failure(message: String)
}

class CreateRecipeValidation {
    func isValidYouTubeLink(_ link: String) -> Bool {
            let regex = "^(https?://)?(www\\.)?(youtube\\.com|youtu\\.?be)/.+$"
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            return predicate.evaluate(with: link)
        }
    
    func validate(_ formData: OwnRecipeModel) -> ValidationResult {
        if formData.title.isEmpty {
            return .failure(message: "Please enter the recipe title.")
        }
        
        if formData.type == nil {
            return .failure(message: "Please choose a recipe type.")
        }
        
        if formData.country.isEmpty {
            return .failure(message: "Please enter the country name.")
        }
                
        if formData.instruction.isEmpty {
            return .failure(message: "Please enter the instructions.")
        }
        
        if formData.videoLink.isEmpty {
            return .failure(message: "Please enter Youtube Video link");
        }
        
        if !isValidYouTubeLink(formData.videoLink) {
            return .failure(message: "Please enter valid youtube link");
        }
        return .success
    }
}
