import Foundation
import Combine

class RecipeServices: ObservableObject {
    @Published var mealViewModel: MealViewModel? // Assuming this is for observing changes
    @Published var singleMealsModel : SingleMealsModel?
    
    func getAllRecipes(_ countryCode: String) async throws -> MealViewModel {
        let baseUrl = "https://www.themealdb.com/api/json/v1/1/filter.php?a=\(countryCode)"
        
        guard let url = URL(string: baseUrl) else {
            throw ServiceError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Optional: Check the response status code (e.g., 200 OK)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ServiceError.invalidResponse
        }
        
        do {
            // Assuming the response contains an array of MealViewModel
            let decodedData = try JSONDecoder().decode(MealViewModel.self, from: data)
            return decodedData
        } catch {
            throw ServiceError.decodingError(error)
        }
    }
    
    
    func getRecipeDetails(_ recipeId : String) async throws -> SingleMealsModel {
        let baseUrl = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(recipeId)";
        
        guard let url = URL(string: baseUrl) else {
            throw ServiceError.invalidURL;
        }
        
        let (data, response) = try await URLSession.shared.data(from: url);
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw ServiceError.invalidResponse;
        }
        
        do {
            let decodedData = try JSONDecoder().decode(SingleMealsModel.self, from: data);
            return decodedData;
        }catch {
            throw ServiceError.decodingError(error);
        }
    }
}

enum ServiceError: Error {
    case missingAPIKey
    case invalidURL
    case invalidResponse
    case decodingError(Error)
}
