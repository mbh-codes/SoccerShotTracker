//
//  DistanceViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

class DistanceViewController: UIViewController {
    
    /* Variables */
 //   var shots = [Shot]()
    
//    @IBOutlet weak var shotDistancePoint: UIImageView!
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotDistance: UIView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            let location = firstTouch.location(in: shotDistance)
            print("space")
            print("\(location)")
            if(location == location){}
            if hitView === shotDistance {
                print("touch is inside")
                
                
            } else {
                print("touch is outside")
            }
        }
    }
    
    
    
    @IBAction func continueButtonTapped(_ sender: UIButton) {
//        print("\(shotDistancePoint.center)")
        print("\(continueButton.intrinsicContentSize)")
   //     func hitTest(_ point: CGPont, with shotDistancePoint:UIEvent?) -> UIView?
            
            self.performSegue(withIdentifier: "distanceToShotLocationVC", sender: self)
//            print("\(insidepoint)")
//            return true
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        //Disposes of any memory that can be recreated
    }
    
    



}
