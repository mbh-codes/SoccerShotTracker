//
//  User.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/20/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot


class User: NSObject {

    // Properties
    let uid: String
    let username: String
    
    
    //Init
    init(uid: String, username: String){
        self.uid = uid
        self.username = username
    }
    
    init? (snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
                else { return nil }
        self.uid = snapshot.key
        self.username = username
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefualts.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefualts.username) as? String
            else { return  nil }
        self.uid = uid
        self.username = username
        super.init()
    }
    
    
    
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            UserDefaults.standard.set(data, forKey: Constants.UserDefualts.currentUser)
        }
        _current = user
    }


    private static var _current: User?
    
    static var current: User {
        guard let currentUser = _current else {
            fatalError("Error: current user does not exist")
        }
        return currentUser
    }
    static func setCurrent(_ user: User) {
        _current = user
    }
}


extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefualts.uid)
        aCoder.encode(uid, forKey: Constants.UserDefualts.username)
    }
}
//extension User: NSCoding {
//    func encode(with aCoder: NSCoder){
//        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
//        aCoder.encode(username, forKey: Constants.UserDefaults.username)
//    }
//}
