//
//  ShotLocationViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

class ShotLocationViewController: UIViewController {
    var tapped = false
    var landedShots = [Shot]()
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotLocation: UIView!
    @IBOutlet weak var shotLocationMarker: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Disposes of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            let shotLandedLocation = firstTouch.location(in: shotLocation)
            if hitView === shotLocation {
                tapped = true
                print("Tap is inside")
                self.edgesForExtendedLayout = []
                let shotLocationPoint = CGPoint(x: shotLandedLocation.x + 45,y: shotLandedLocation.y + 170)
                shotLocationMarker.center = shotLocationPoint
                print(shotLocationMarker.center)
            } else {
                print("Tap is outside")
            }
        }
    }
    @IBAction func continueButtonSelected(_ sender: UIButton){
        if(tapped){
            var shortestDistance = Float(100)
            
            let arrayForX: [Double] = [0.1,0.3,0.5,0.7,0.9]
            let arrayForY: [Double] = [0.125,0.375,0.625,0.875]
            for indexA in arrayForX {
                for indexB in arrayForY {
                    let referenceCGPoint = CGPoint(x: (CGFloat(Double(shotLocation.frame.size.width) * indexA)) , y: CGFloat(Double(shotLocation.frame.size.height) * indexB))
                    let distance = hypotf(Float(referenceCGPoint.x - shotLocation.center.x), Float(referenceCGPoint.y - shotLocation.center.y))
                    print("this is the distance from tapped to references \(distance)")
                    if(distance < shortestDistance ){
                        let closestReferenceCGPoint = referenceCGPoint
                        shortestDistance = distance
                        print("closest ReferenceCGpoint is \(closestReferenceCGPoint)")
                    }
                }
            }
            print(shortestDistance)
            
            //let currentUser = User.current
            
    
            
            
            
            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
        } else {
            continueButton.setTitle("Tap in the Goal Box First", for: .normal)
            print("Has not yet tapped inside")
        }
    }
}


    
    


