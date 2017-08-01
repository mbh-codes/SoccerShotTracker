//
//  DistanceViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

import FirebaseDatabase


class DistanceViewController: UIViewController {
    var tapped = false
    var distanceOfShots = Shot()
    var xInts = [Double]()
    var shotDistanceLocation = CGPoint()
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotDistance: UIView!
    @IBOutlet weak var shotDistanceMarker: UIView!
    @IBOutlet weak var halfFieldCircle: UIView!
    @IBOutlet weak var penaltyMarkCircle: UIView!
    @IBOutlet weak var goalBox: UIView!
    @IBOutlet weak var sixYardBox: UIView!
    @IBOutlet weak var cornerPoint: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shotDistanceMarker.layer.cornerRadius = self.shotDistanceMarker.frame.size.height / 2
        self.halfFieldCircle.layer.cornerRadius = self.halfFieldCircle.frame.size.height / 2
        self.penaltyMarkCircle.layer.cornerRadius = self.penaltyMarkCircle.frame.size.height / 2
        
        
        self.halfFieldCircle.clipsToBounds = true
        self.penaltyMarkCircle.clipsToBounds = true
        self.shotDistanceMarker.clipsToBounds = true
        

        //print("corner point center is \(cornerPoint.center)")

        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            shotDistanceLocation = firstTouch.location(in: shotDistance)
            if hitView === shotDistance || hitView == halfFieldCircle || hitView == penaltyMarkCircle || hitView == goalBox || hitView == sixYardBox  {
                tapped = true
                self.edgesForExtendedLayout = []
                let shotDistancePoint = CGPoint(x: shotDistanceLocation.x + shotDistance.bounds.origin.x, y: shotDistanceLocation.y + shotDistance.bounds.origin.y / 2 )
                let shotDistancePointConvertedLocation = shotDistance.convert(shotDistancePoint, to: self.view)
                
                
                //var buttonCenter = CGPoint(x: button.bounds.origin.x + button.bounds.size.width / 2, y: button.bounds.origin.y + button.bounds.size.height / 2)
                //var p = button.convertPoint(buttonCenter, to: self.view)
                
                
                shotDistanceMarker.center = shotDistancePointConvertedLocation
       //         print("tap is inside")
            }
        } else {
       //     print("touch is outside")
        }
    }


    @IBAction func continueButtonTapped(_ sender: UIButton) {
        continueButton.setTitle("Tap on the field, then press continue" , for: .normal)
        if(tapped) {
         //   print("location tapped is \(shotDistanceLocation)")
         //   print("center of view is \(shotDistanceMarker.center)")
            distanceOfShots.distancePoint = shotDistanceMarker.center
            let currentUser = User.current
            //print("user uid is \(currentUser.uid) and done")
            xInts.append(Double(distanceOfShots.distancePoint.x))
            let randomDictionary = ["Shot": xInts]
            let ref = Database.database().reference().child("utees").child(currentUser.uid)
            ref.setValue(randomDictionary)
            self.performSegue(withIdentifier: "distanceToShotLocationVC", sender: self)
        } else {
          //  print("Not yet Tapped")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Disposes of any memory that can be recreated
    }
}
