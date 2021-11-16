//
//  HomeView.swift
//  GSignIn
//
//  Created by Addin Satria on 16/11/21.
//

import SwiftUI

struct HomeView: View {
  @ObservedObject var vm = GoogleSignInViewModel()
  var body: some View {
    VStack {
      Text("Signed In As: \(vm.user.username)")
      Button(action: {
        vm.handleLogout()
      }) {
        Text("Logout")
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    HomeView()
  }
}
