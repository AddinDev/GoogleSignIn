//
//  LoginView.swift
//  GSignIn
//
//  Created by Addin Satria on 16/11/21.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct LoginView: View {
  
  @ObservedObject var vm = GoogleSignInViewModel()
  
    var body: some View {
      VStack {
        Button(action: {
          vm.handleLogin()
        }) {
          Text("Login")
        }
      }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
