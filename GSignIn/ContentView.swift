//
//  ContentView.swift
//  GSignIn
//
//  Created by Addin Satria on 16/11/21.
//

import SwiftUI

struct ContentView: View {
  
  @AppStorage("log_status") var logStatus = false
  let gvm = GoogleSignInViewModel()
  
  var body: some View {
    if logStatus {
      HomeView(vm: gvm)
    } else {
      LoginView(vm: gvm)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
