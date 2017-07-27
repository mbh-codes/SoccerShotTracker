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
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotLocation: UIView!
    @IBOutlet weak var shotLocationMarker: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
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
                let shotLocationPoint = CGPoint(x: shotLandedLocation.x + 20,y: shotLandedLocation.y + 160)
                print("shotLocationPoint is \(shotLocationPoint)")
                shotLocationMarker.center = shotLocationPoint
            } else {
                print("Tap is outside")
            }
        }
    }
    
    @IBAction func continueButtonSelected(_ sender: UIButton){
        if(tapped){
            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
        } else {
            print("Has not yet tapped inside")
        }
    }
}


    
    


