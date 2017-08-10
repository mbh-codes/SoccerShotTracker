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
    var xInts = [Double]()
    var shotDistanceLocation = CGPoint()
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotDistance: UIView!
    @IBOutlet weak var shotDistanceMarker: UIView!
    @IBOutlet weak var halfFieldCircle: UIView!
    @IBOutlet weak var goalBox: UIView!
    @IBOutlet weak var sixYardBox: UIView!
    @IBOutlet weak var halfwayLine: UIView!
    @IBOutlet weak var goalBoxAway: UIView!
    @IBOutlet weak var secondSixYardBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shotDistance.layer.borderWidth = 2
        self.shotDistance.layer.borderColor = UIColor.white.cgColor
        self.halfFieldCircle.layer.borderColor = UIColor.white.cgColor
        self.halfFieldCircle.layer.borderWidth = 2
        self.goalBox.layer.borderColor = UIColor.white.cgColor
        self.goalBox.layer.borderWidth = 2
        self.sixYardBox.layer.borderColor = UIColor.white.cgColor
        self.sixYardBox.layer.borderWidth = 2
        self.halfwayLine.layer.borderColor = UIColor.white.cgColor
        self.halfwayLine.layer.borderWidth = 2
        self.goalBoxAway.layer.borderWidth = 2
        self.goalBoxAway.layer.borderColor = UIColor.white.cgColor
        self.secondSixYardBox.layer.borderColor = UIColor.white.cgColor
        self.secondSixYardBox.layer.borderWidth = 2
        //Corner Radius
        self.shotDistanceMarker.layer.cornerRadius = self.shotDistanceMarker.frame.size.height / 2
        self.halfFieldCircle.layer.cornerRadius = self.halfFieldCircle.frame.size.height / 2
        self.halfFieldCircle.clipsToBounds = true
        self.shotDistanceMarker.clipsToBounds = true
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            shotDistanceLocation = firstTouch.location(in: shotDistance)
            if hitView === shotDistance || hitView === halfFieldCircle || hitView === goalBox || hitView === sixYardBox || hitView === goalBoxAway || hitView === secondSixYardBox  {
                tapped = true
                self.edgesForExtendedLayout = []
                let shotDistancePoint = CGPoint(x: shotDistanceLocation.x + shotDistance.bounds.origin.x, y: shotDistanceLocation.y + shotDistance.bounds.origin.y / 2 )
                let shotDistancePointConvertedLocation = shotDistance.convert(shotDistancePoint, to: self.view)
                shotDistanceMarker.center = shotDistancePointConvertedLocation
            }
        } else {}
    }
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        continueButton.setTitle("Tap on the field, then press continue" , for: .normal)
        if(tapped) {
            let currentUser = User.current
            let randomDictionary = ["Shot": xInts]
            let ref = Database.database().reference().child("utees").child(currentUser.uid)
            ref.setValue(randomDictionary)
            self.performSegue(withIdentifier: "distanceToShotLocationVC", sender: self)
        } else { }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Disposes of any memory that can be recreated
    }
}
