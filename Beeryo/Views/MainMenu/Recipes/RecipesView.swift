//
//  RecipesView.swift
//  Beeryo
//
//  Created by Jacek K on 30/08/2021.
//

import SwiftUI


struct RecipesView: View {
  @Environment(\.managedObjectContext) private var viewContext
  @State var isNewRecipeVisible = false
  
  //var fetchRequest = RecipeEntity.fetchRequest1()
  
  @FetchRequest(entity: RecipeEntity.entity(),
                sortDescriptors: [],
                animation: .default)
  
  
  private var items: FetchedResults<RecipeEntity>
  
  var body: some View {
    VStack{
      NavigationLink(
        destination: RecipeEditView(valueee: ""),
        isActive: $isNewRecipeVisible
      ) {
        EmptyView()
      }
      
      List {
        
        ForEach(items){item in
          NavigationLink(item.name!, destination: RecipeEditView(valueee: item.name!))
        }
        //NavigationLink("Recipe 1", destination: RecipeEditView(valueee: "Recipe1"))
        //NavigationLink("Recipe 2", destination: RecipeEditView(valueee: "Recip2"))
      }
      .navigationTitle("My Recipes")
      .navigationViewStyle(DefaultNavigationViewStyle())
      .navigationBarItems(
        trailing: NavigationBarRightButtonView(isNewRecipeVisible: $isNewRecipeVisible))
    }
  }
}

struct NavigationBarRightButtonView: View {
  @Binding var isNewRecipeVisible: Bool
  var body: some View {
    
    Button(action: {
      isNewRecipeVisible = true
    }, label: {
      HStack {
        Image(systemName: "plus.circle")
          .resizable()
          .frame(width: 25, height: 25, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        Text("New Recipe")
          .fontWeight(.semibold)
          .font(.headline)
      }
      // }
    })
  }
}

struct RecipesView_Previews: PreviewProvider {
  static var previews: some View {
    RecipesView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
