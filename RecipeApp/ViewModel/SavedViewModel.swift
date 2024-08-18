//
//  SavedViewModel.swift
//  RecipeApp
//
//  Created by Bholanath Barik on 18/08/24.
//

import Foundation
import CoreData

class SavedViewModel: ObservableObject {
    @Published var savedRecipes: [SavedRecipes] = [];
    
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
    
    // Add New Recipe in Save Record
    func createRecord(context: NSManagedObjectContext, idMeal: String, strMeal: String, strMealThumb: String) -> [String: Any] {
        let newRecipe = RecipeApp.SavedRecipes(context: context)
        newRecipe.idMeal = idMeal
        newRecipe.strMeal = strMeal
        newRecipe.strMealThumb = strMealThumb
        
        if saveContext(context: context) {
            return ["status": "success", "message": "Record created successfully."]
        } else {
            return ["status": "failure", "message": "Failed to create the record."]
        }
    }
    
    // Delete Recipe in Save Record
    func deleteRecord(context: NSManagedObjectContext, idMeal: String) -> [String: Any] {
        let fetchRequest: NSFetchRequest<SavedRecipes> = RecipeApp.SavedRecipes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idMeal == %@", idMeal)
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
                return ["status": "failure", "message": "No recipe found with id \(idMeal)."]
            }
        } catch {
            return ["status": "failure", "message": "Fetch failed: \(error.localizedDescription)"]
        }
    }
    
    // Get all Records
    func getAllRecords(context: NSManagedObjectContext) -> [SavedRecipes] {
        let fetchRequest: NSFetchRequest<SavedRecipes> = RecipeApp.SavedRecipes.fetchRequest()
        do {
            savedRecipes = try context.fetch(fetchRequest)
            return savedRecipes
        } catch {
            print("Failed to fetch all records: \(error.localizedDescription)")
            return []
        }
    }
    
    func isRecordsSaved(context: NSManagedObjectContext, idMeal: String) -> Bool {
        let fetchRequest: NSFetchRequest<SavedRecipes> = RecipeApp.SavedRecipes.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "idMeal == %@", idMeal)
        fetchRequest.fetchLimit = 1
        
        do {
            return try context.fetch(fetchRequest).first != nil
        } catch {
            print("Failed to fetch the record: \(error.localizedDescription)")
            return false
        }
    }
}
