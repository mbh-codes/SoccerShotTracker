//
//  Shot.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/21/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit
import FirebaseDatabase.FIRDataSnapshot

class Shot {
    var distancePoint = CGPoint()
    var landedPoint = CGPoint()
}
//    init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String: Any],
//            let distancePoint = dict["distanceShots"] as? CGPoint
//            else { return nil }
//        self.distancePoint = distancePoint
//    }
//    init(distance: CGPoint, shotLanded: CGPoint) {
//        self.distancePoint = distance
//    }
    
    //Properties and Initializers
//    let poster: User
//    var key: String?
//    var distance: CGPoint
//    var shotLanded: CGPoint
//    let creationDate: Date
//   var dictValue: [String: Any] {
//        let createdAgo = creationDate.timeIntervalSince1970
//        let userDict = ["uid" : poster.uid, "username" : poster.username]
//
//        return["distance": distance, "shot_Landed": shotLanded, "created_at": createdAgo, "poster": userDict]
//    }
//
//   init?(snapshot: DataSnapshot) {
//        guard let dict = snapshot.value as? [String: Any],
//            let distance = dict["distance"] as? CGPoint,
//            let shotLanded = dict["shot_Landed"] as? CGPoint,
//           let createdAgo = dict["created_at"] as? TimeInterval,
//            let userDict = dict["poster"] as? [String : Any],
//            let uid = userDict["uid"] as? String,
//            let username = userDict["username"] as? String
//           else { return nil }
//        self.key = snapshot.key
//        self.distance = distance
//        self.shotLanded = shotLanded
//        self.creationDate = Date(timeIntervalSince1970: createdAgo)
//        self.poster = User(uid: uid, username: username)
//    }
//    init(distance: CGPoint, shotLanded: CGPoint) {
//        self.distance = distance
//        self.shotLanded = shotLanded
//        self.creationDate = Date()
//        self.poster = User.current
//
//    }

