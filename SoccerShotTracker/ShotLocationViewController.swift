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
    var landedShots = Shot()
    var shotLandedLocation = CGPoint()
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotLocation: UIView!
    @IBOutlet weak var shotLocationMarker: UIView!
    @IBOutlet weak var goalPostBox: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        goalPostBox.layer.borderWidth = 10
        goalPostBox.layer.borderColor = UIColor.black.cgColor
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.shotLocationMarker.layer.cornerRadius = self.shotLocationMarker.frame.size.height / 2
        self.shotLocationMarker.clipsToBounds = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Disposes of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            shotLandedLocation = firstTouch.location(in: shotLocation)
            if hitView === shotLocation || hitView === goalPostBox  {
                tapped = true
                print("start")
                print("Shot Landed location is \(shotLandedLocation)")
                self.edgesForExtendedLayout = []
                ////let shotLocationPoint = CGPoint(x: shotLandedLocation.x + shotLocation.bounds.origin.x ,y: shotLandedLocation.y + shotLocation.bounds.origin.y / 2)
                //let shotLocationPoint = CGPoint(x: shotLandedLocation.x,y: shotLandedLocation.y)
                ////let shotLocationPointConvertedToLocation = shotLocation.convert(shotLocationPoint, to: self.view)
                    shotLocationMarker.center = shotLandedLocation
                    ///print("shot location point is \(shotLocationPoint)")
                    ///print("shot location point conver to location is \(shotLocationPointConvertedToLocation)")
                    print("shot location marker center \(shotLocationMarker.center)")
                    print("end")
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
                    
                    
                    
//                    print("this is the distance from tapped to references \(distance)")
                    if(distance < shortestDistance ){
                        let closestReferenceCGPoint = referenceCGPoint
                        shortestDistance = distance
//                        print("closest ReferenceCGpoint is \(closestReferenceCGPoint)")
                    }
                }
            }
//            print(shortestDistance)
            
            //let currentUser = User.current
            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
        } else {
            continueButton.setTitle("Tap in the Goal Box First", for: .normal)
            print("Has not yet tapped inside")
        }
    }
}


    
    


