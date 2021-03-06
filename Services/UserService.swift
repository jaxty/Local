//
//  UserService.swift
//  Local
//
//  Created by Jack Chen on 3/6/19.
//  Copyright © 2019 Jack Chen. All rights reserved.
//

import Foundation
import Firebase

class UserService {
    static var currentUserProfile:UserProfile?
    
    static func observeUserProfile(_ uid:String, completion: @escaping ((_ userProfile:UserProfile?)->())) {
        let userRef = Database.database().reference().child("users/profile/\(uid)")
        
        userRef.observe(.value, with: { snapshot in
            var userProfile:UserProfile?
            if let dict = snapshot.value as? NSDictionary,
                let username = dict["username"] as? String {
                userProfile = UserProfile(uid: snapshot.key, username: username)
            }
            completion(userProfile)
        })
    }
}
