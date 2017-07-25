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
           print(shotDistanceLocation.x)
            print(shotDistanceLocation.y)
            
            print(shotDistanceMarker.center)
          //  print("\(location)")
            if hitView === shotDistance {
                self.edgesForExtendedLayout = []
                let shotDistancePoint = CGPoint(x: shotDistanceLocation.x + 25 , y: shotDistanceLocation.y + 190 )
  //              shotDistancePoint.x = shotDistanceLocation.x + 100;
//                shotDistancePoint.y = shotDistanceLocation.y + 25;
         //       var shotDistanceMarker = firstTouch.location
                shotDistanceMarker.center = shotDistancePoint
 

            }
        } else {
            print("touch is outside")
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
