//
//  UserService.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/20/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import Foundation
import FirebaseAuth.FIRUser
import FirebaseDatabase
struct UserService {
    // insert user-related networking code here
    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
        let userAttrs = ["username": username]
        let ref = Database.database().reference().child("users").child(firUser.uid)
        ref.setValue(userAttrs) { (error, ref) in
            if let error = error {
                assertionFailure(error.localizedDescription)
                return completion(nil)
            }
            ref.observeSingleEvent(of: .value, with: { (snapshot) in
                let user = User(snapshot: snapshot)
                completion(user)
            })
        }
    }
    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
        let ref = Database.database().reference().child("users").child(uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
        guard let user = User(snapshot: snapshot) else {
            return completion(nil)
        }
            completion(user)
        })
    }
    //A Service Method that will retrieve all of a user's posts from Firebase. This will be the data that we display in our timeline.
    static func posts(for user: User, completion: @escaping ([Post]) -> Void) {
        let ref = Database.database().reference().child("posts").child(user.uid)
        ref.observeSingleEvent(of: .value, with: { (snapshot) in
            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
                return completion([])
            }
            let posts = snapshot.reversed().flatMap(Post.init)
            completion(posts)
        })
    }
}
//midway
//struct UserService {
//    static func create(_ firUser: FIRUser, username: String, completion: @escaping (User?) -> Void) {
//        let userAttrs = ["username": username]
//        
//        let ref = Database.database().reference().child("users").child(firUser.uid)
//        ref.setValue(userAttrs) { (error, ref) in
//            if let error = error {
//                assertionFailure(error.localizedDescription)
//                return completion(nil)
//            }
//            ref.observeSingleEvent(of: .value, with: { (snapshot) in
//                let user = User(snapshot: snapshot)
//                completion(user)
//                
//            } )
//        }
//    }
//    static func show(forUID uid: String, completion: @escaping (User?) -> Void) {
//        let ref = Database.database().reference().child("shot").child(uid)
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let user = User(snapshot: snapshot) else {
//                    return completion(nil)
//            }
//            completion(user)
//        
//        })
//    }
//    static func shots(for user: User, completion: @escaping([Shot]) -> Void ) {
//        let ref = Database.database().reference().child("shots").child(user.uid)
//        ref.observeSingleEvent(of: .value, with: { (snapshot) in
//            guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else {
//                return completion([])
//            }
//            let posts = snapshot.reversed().flatMap(Shot.init)
//            completion(posts)
//        })
//    }
//}
