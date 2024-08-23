import SwiftUI

struct CreateRecipeForm: View {
    @State private var recipe: OwnRecipeModel = OwnRecipeModel(id: UUID());
    @State private var isAlert : Bool = false;
    @State private var isAlertMessage : String = "";
    @State private var isSave : Bool = false;
    @State private var isAlertMeg : String = "";
    @State private var isAlertHead : String = "";
    
    @Environment(\.managedObjectContext) private var viewContext;
    @Environment(\.presentationMode) var presentationMode;
    private var ViewModel = OwnRecipeViewModel();
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Recipe Name
                TextField("Recipe Name", text: $recipe.title)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // Recipe Type
                HStack(spacing: 20) {
                    RadioButton(selected: $recipe.type, option: .veg, title: "Veg")
                    RadioButton(selected: $recipe.type, option: .nonVeg, title: "Non Veg")
                }
                .padding(.horizontal)
                
                // Recipe Country
                TextField("Recipe Country", text: $recipe.country)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                
                // Instruction
                TextField("Instruction", text: $recipe.instruction, axis: .vertical)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // YouTube Link
                TextField("YouTube Link", text: $recipe.videoLink)
                    .padding()
                    .background(Color.gray.opacity(0.15))
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.orange, lineWidth: 1)
                    )
                    .padding(.horizontal)
                
                // Save Button
                Button(action: {
                    // Action to save the recipe
                    let isValidForm = CreateRecipeValidation().validate(recipe);
                    switch isValidForm {
                    case .success:
                        let response = ViewModel.createRecord(
                            context: viewContext,
                            id: UUID(),
                            country: recipe.country,
                            instruction: recipe.instruction,
                            name: recipe.title,
                            type: recipe.type?.rawValue ?? " ",
                            videoLink: recipe.videoLink)
                        if response["status"] as? String == "success" {
                            isAlert = true;
                            isAlertMeg = response["message"] as! String
                            isAlertHead = "Success"
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            isAlert = true;
                            isAlertMeg = response["message"] as! String
                            isAlertHead = "Error"
                        }
                    case .failure(let message) :
                        isAlertMessage = message;
                        isAlert = true;
                    }
                }) {
                    Text("Save Recipe")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
                .padding(.top, 20)
            }
            .padding(.bottom, 20)
            .alert(isPresented: $isAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(isAlertMessage),
                      dismissButton: .default(Text("Ok")))
            })
        }
        .background(Color(UIColor.systemGroupedBackground))
        .ignoresSafeArea(edges: .bottom)
        .alert(isPresented: $isAlert, content: {
            Alert(
                title: Text(isAlertHead),
                message: Text(isAlertMeg),
                dismissButton: .default(Text("OK"))
            )
        })
    }
}

struct RadioButton: View {
    @Binding var selected: RecipeType?
    let option: RecipeType
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: selected == option ? "largecircle.fill.circle" : "circle")
                .foregroundColor(.orange)
            Text(title)
                .font(.body)
                .foregroundColor(selected == option ? .orange : .primary)
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
        .onTapGesture {
            selected = option
        }
    }
}

#Preview {
    CreateRecipeForm()
}
