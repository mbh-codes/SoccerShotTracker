//
//  DistanceViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit
import Firebase


class DistanceViewController: UIViewController {
    var tapped = false
    var distanceOfShot = [DistanceShot]()
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotDistance: UIView!
    @IBOutlet weak var shotDistanceMarker: UIImageView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            let shotDistanceLocation = firstTouch.location(in: shotDistance)
            if hitView === shotDistance {
                tapped = true
                self.edgesForExtendedLayout = []
                let shotDistancePoint = CGPoint(x: shotDistanceLocation.x + 25 , y: shotDistanceLocation.y + 190 )
                print("shotDistance point is \(shotDistancePoint)")
                shotDistanceMarker.center = shotDistancePoint
            }
        } else {
            print("touch is outside")
        }
    }

    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if(tapped) {
            let distanceOfShot = DistanceShot()
            distanceOfShot.distance = shotDistanceMarker.center
            print("distance of shot = \(distanceOfShot.distance)")
            // 1
       //     let distanceViewController = segue.destination as! DistanceViewController
            // 2
        //    DistanceViewController.distanceOfShot.append(distanceOfShot)
            
            print("CGPoint is: \(shotDistanceMarker.center)")
           // let distance = shotDistanceMarker.center
            

            self.performSegue(withIdentifier: "distanceToShotLocationVC", sender: self)
 
         } else {
            print("Not yet Tapped")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Disposes of any memory that can be recreated
    }
}
