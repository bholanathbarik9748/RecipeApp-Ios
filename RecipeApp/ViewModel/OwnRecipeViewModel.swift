//
//  OwnRecipeViewModel.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 22/08/24.
//

import Foundation
import CoreData

class OwnRecipeViewModel: ObservableObject {
    @Published var ownRecipe: [OwnRecipes] = [];
    
    // Save Records
    func saveContext(context: NSManagedObjectContext) -> Bool {
        if context.hasChanges {
            do {
                try context.save()
                return true
            } catch {
                let nsError = error as NSError
                print("Save error: \(nsError), \(nsError.userInfo)")
                return false
            }
        }
        return false
    }
    
    // Add Own Recipe in Save Record
    func createRecord(context: NSManagedObjectContext, id: UUID, country: String, instruction: String,name: String,type : String, videoLink: String) -> [String: Any] {
        let ownRecipe = RecipeApp.OwnRecipes(context: context)
        ownRecipe.id = id;
        ownRecipe.country = country;
        ownRecipe.instruction = instruction
        ownRecipe.name = name
        ownRecipe.type = type
        ownRecipe.videoLink = videoLink
        
        
        if saveContext(context: context) {
            return ["status": "success", "message": "Record created successfully."]
        } else {
            return ["status": "failure", "message": "Failed to create the record."]
        }
    }
    
    // Delete Recipe in Save Record
    func deleteRecord(context: NSManagedObjectContext, id: UUID) -> [String: Any] {
        let fetchRequest: NSFetchRequest<OwnRecipes> = RecipeApp.OwnRecipes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        fetchRequest.fetchLimit = 1
        
        do {
            if let recipeToDelete = try context.fetch(fetchRequest).first {
                context.delete(recipeToDelete)
                if saveContext(context: context) {
                    return ["status": "success", "message": "Record deleted successfully."]
                } else {
                    return ["status": "failure", "message": "Failed to delete the record."]
                }
            } else {
                return ["status": "failure", "message": "No recipe found with id \(id)."]
            }
        } catch {
            return ["status": "failure", "message": "Fetch failed: \(error.localizedDescription)"]
        }
    }
    
    //     Function to fetch all records from Core Data
    func getAllRecords(context: NSManagedObjectContext) -> [OwnRecipes] {
        let fetchRequest: NSFetchRequest<OwnRecipes> = OwnRecipes.fetchRequest();
        do {
            // Fetch records from Core Data
            let results = try context.fetch(fetchRequest)
            return results
        } catch {
            // Print error message if fetching fails
            print("Failed to fetch all records: \(error.localizedDescription)")
            return []
        }
    }
}
