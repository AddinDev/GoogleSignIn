//
//  UserModel.swift
//  GSignIn
//
//  Created by Addin Satria on 16/11/21.
//

import Foundation
import Firebase

struct UserModel {
  var id: String
  var username: String
  var email: String
}

extension UserModel {
  static let empty = UserModel(id: "", username: "empty", email: "empty")
}

class UserMapper {
  
  static func responseToModel(_ user: User) -> UserModel {
    return UserModel(id: user.uid, username: user.displayName ?? "no data", email: user.email ?? "no data")
  }
  
}
