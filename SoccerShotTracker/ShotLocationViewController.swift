//
//  ShotLocationViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

class ShotLocationViewController: UIViewController {
    
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
                self.edgesForExtendedLayout = []
                let shotLocationPoint = CGPoint(x: shotLandedLocation.x + 20,y: shotLandedLocation.y + 160)
                shotLocationMarker.center = shotLocationPoint
            }
        }
    }
    
    @IBAction func continueButtonSelected(_ sender: UIButton){

            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
//        }
    }
}


    
    


