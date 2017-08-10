//
//  User.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/20/17.
//  Copyright © 2017 MBH. All rights reserved.
//

//import UIKit
//import FirebaseDatabase.FIRDataSnapshot
//import Foundation
//
//
//
//class User: NSObject {
//    // Properties
//    let uid: String
//    let username: String
//    //Init
//
//    init? (snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String : Any],
//            let username = dict["username"] as? String
//                else { return nil }
//        self.uid = snapshot.key
//        self.username = username
//        super.init()
//    }
//    init(uid: String, username: String){
//        self.uid = uid
//        self.username = username
//        super.init()
//    }
//    required init?(coder aDecoder: NSCoder) {
//        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefualts.uid) as? String,
//            let username = aDecoder.decodeObject(forKey: Constants.UserDefualts.username) as? String
//            else { return  nil }
//        self.uid = uid
//        self.username = username
//        super.init()
//    }
//
//    static var _current: User?
//    static var current: User {
//       guard let currentUser = _current else {
//        print("is reaching to this point")
//            fatalError("Error: current user does not exist")
//        }
//        return currentUser
//    }
//    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false){
//        if writeToUserDefaults {
//            let data = NSKeyedArchiver.archivedData(withRootObject: user)
//            UserDefaults.standard.set(data, forKey: Constants.UserDefualts.currentUser)
//        }
//        _current = user
//    }
//}
//
//
//extension User: NSCoding {
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(uid, forKey: Constants.UserDefualts.uid)
//        aCoder.encode(username, forKey: Constants.UserDefualts.username)
//    }
//}



import Foundation
import FirebaseDatabase.FIRDataSnapshot
import UIKit

class User: NSObject {
    //Mark: - Properties
    let uid: String
    let username: String
    //mark: - Init
    init?(snapshot: DataSnapshot) {
        guard let dict = snapshot.value as? [String : Any],
            let username = dict["username"] as? String
            else { return nil }
        self.uid = snapshot.key
        self.username = username
        super.init()
    }
    init(uid: String, username: String) {
        self.uid = uid
        self.username = username
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        guard let uid = aDecoder.decodeObject(forKey: Constants.UserDefaults.uid) as? String,
            let username = aDecoder.decodeObject(forKey: Constants.UserDefaults.username) as? String
            else { return nil }
        self.uid = uid
        self.username = username
        super.init()
    }
    static var _current: User?
    static var current: User {
        guard let currentUser = _current else {
    
            assertionFailure("NotWorking")
            return self.current
            //above code is iffy
        }
        return currentUser
    }
    class func setCurrent(_ user: User, writeToUserDefaults: Bool = false) {
        if writeToUserDefaults {
            let data = NSKeyedArchiver.archivedData(withRootObject: user)
            UserDefaults.standard.set(data, forKey: Constants.UserDefaults.currentUser)
        }
        _current = user
    }
}

extension User: NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(uid, forKey: Constants.UserDefaults.uid)
        aCoder.encode(username, forKey: Constants.UserDefaults.username)
}
}
























