//
//  ShotService.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/26/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct ShotService {
    static let ref = Database.database().reference().child("posts")
    static func getShots(for user:User, with completion:@escaping ([Int]) -> Void) {
        let postRef = ref.child(user.uid)
        postRef.observeSingleEvent(of: .value, with: { (snapshot) in
            var shotCounts = [Int].init(repeating: 0, count: 32)
            for shotSnap in snapshot.children.allObjects as! [DataSnapshot] {
                let dict = shotSnap.value as! [String:Any]
                if let shotQuadrant = dict["shotsLandedQuadrants"] as? Int {
                    shotCounts[shotQuadrant] += 1
                } else if let shotQuadrantString = dict["shotsLandedQuadrants"] as? String {
                    let shotQuadrant = Int(shotQuadrantString)
                    shotCounts[shotQuadrant!] += 1
                }
            }
            completion(shotCounts)
        })
    }
}
