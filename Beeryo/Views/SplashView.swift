//
//  SplashView.swift
//  Beeryo
//
//  Created by Jacek K on 30/08/2021.
//

import SwiftUI

struct SplashView: View {
  @State var isMainMenuActive:Bool = false
  
  var body: some View {
    VStack {
      if self.isMainMenuActive {
        MainMenuView()
      } else {
        SplashViewContents()
      }
    }
    .onAppear {
      DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
        withAnimation {
          self.isMainMenuActive = true
        }
      }
    }
  }
}

struct SplashViewContents : View {
  var version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
  let paddingOnBottomHStack: CGFloat = 20
  let imageSize: CGFloat = 130
  
  var body: some View {
    VStack{
      Spacer()
      Image("beerSplashScreenLogo")
        .resizable()
        .frame(width: imageSize, height: imageSize)
      Text("Beeryo")
        .font(Font.largeTitle)
        .bold()
      Spacer()
      HStack{
        Text("It's a brew time!")
          .font(.footnote)
          .fontWeight(.bold)
          .padding(.bottom, paddingOnBottomHStack)
          .padding(.leading, paddingOnBottomHStack)
        Spacer()
        Text("Ver. " + version!)
          .font(.footnote)
          .fontWeight(.bold)
          .padding(.bottom, paddingOnBottomHStack)
          .padding(.trailing, paddingOnBottomHStack)
      }
      .padding(10)
      
    }
  }
}

struct SplashView_Previews: PreviewProvider {
  static var previews: some View {
    SplashView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
  }
}
