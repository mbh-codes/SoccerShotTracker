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
    var arrayForViewX: [Double] = [0.0,1/8,2/8,3/8,4/8,5/8,6/8,7/8]
    var arrayForViewY: [Double] = [0.0,0.25,0.5,0.75]
    var arrayOfViews: [UIView] = []
    var amountOfViewsCreated = 0
    var tappedViewQuadrant = 0
    
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
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for indexOfViewA in arrayForViewX {
            for indexOfViewB in arrayForViewY{
                if(amountOfViewsCreated < 32){
                    let DynamicView = UIView(frame: CGRect(origin: CGPoint(x: CGFloat(Double(shotDistance.frame.size.width)*indexOfViewA), y: CGFloat(Double(shotDistance.frame.size.height)*indexOfViewB)), size: CGSize(width: shotDistance.frame.width/8, height: shotDistance.frame.height/4)))
                        //DynamicView.layer.borderWidth = 1
                        DynamicView.tag = amountOfViewsCreated
                        self.shotDistance.addSubview(DynamicView)
                        arrayOfViews.append(DynamicView)
                }
                amountOfViewsCreated += 1
            }
        }
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            shotDistanceLocation = firstTouch.location(in: shotDistance)
            for indexOfViewInArray in arrayOfViews {
                if (hitView === indexOfViewInArray) {
                    tapped = true
                    tappedViewQuadrant = indexOfViewInArray.tag
                    self.edgesForExtendedLayout = []
                    let shotDistancePoint = CGPoint(x: shotDistanceLocation.x + shotDistance.bounds.origin.x, y: shotDistanceLocation.y + shotDistance.bounds.origin.y / 2 )
                    let shotDistancePointConvertedLocation = shotDistance.convert(shotDistancePoint, to: self.view)
                    shotDistanceMarker.center = shotDistancePointConvertedLocation
                }
            }
        } else {}
    }
    @IBAction func continueButtonTapped(_ sender: UIButton) {
        if(tapped) {
            let distanceQuadrant = tappedViewQuadrant
            let currentUser = User.current
            let dictionaryOfViewTags = ["shotDistance": distanceQuadrant]
            let ref = Database.database().reference().child("shot").child(currentUser.uid).childByAutoId()
            ref.updateChildValues(dictionaryOfViewTags)
            self.performSegue(withIdentifier: "distanceToShotLocationVC", sender: self)
        } else {
            continueButton.setTitle("Tap on the field, then press here", for: .normal)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Disposes of any memory that can be recreated
    }
}
