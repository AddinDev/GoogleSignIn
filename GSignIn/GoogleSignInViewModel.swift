//
//  GoogleSignInViewModel.swift
//  GSignIn
//
//  Created by Addin Satria on 16/11/21.
//

import Foundation
import Firebase
import GoogleSignIn
import SwiftUI

class GoogleSignInViewModel: ObservableObject {
  
  @Published var user: UserModel = .empty
  @AppStorage("log_status") var logStatus = false
  
  //  init() { }
  
  func handleLogin() {
    guard let clientID = FirebaseApp.app()?.options.clientID else { return }
    
    // Create Google Sign In configuration object.
    let config = GIDConfiguration(clientID: clientID)
    
    GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController()) { user, error in
      if let error = error {
        print("ERROR: \(error.localizedDescription)")
        return
      }
      
      guard
        let authentication = user?.authentication,
        let idToken = authentication.idToken
      else {
        return
      }
      
      let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                     accessToken: authentication.accessToken)
      
      Auth.auth().signIn(with: credential) { result, error in
        if let error = error {
          print("ERROR: \(error.localizedDescription)")
          return
        }
        
        guard let authUser = result?.user else {
          return
        }
        
        self.user = UserMapper.responseToModel(authUser)
        
        self.logStatus = true
        
        print("signed in: \(self.user.username)")
      }
      
    }
  }
  
  func handleLogout() {
    GIDSignIn.sharedInstance.signOut()
    try? Auth.auth().signOut()
    self.user = .empty
    self.logStatus = false
  }
  
}

extension GoogleSignInViewModel {
  func getRootViewController() -> UIViewController {
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
      return .init()
    }
    
    guard let root = screen.windows.first?.rootViewController else {
      return .init()
    }
    
    return root
  }
}
