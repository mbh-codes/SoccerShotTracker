//
//  ShotLocationViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

class ShotLocationViewController: UIViewController {
    var shouldSetupConstraints = true
    var tapped = false
    var landedShots = Shot()
    var shotLandedLocation = CGPoint()
    let arrayForX: [Double] = [0.1,0.3,0.5,0.7,0.9]
    let arrayForY: [Double] = [0.125,0.375,0.625,0.875]
    let arrayForViewX: [Double] = [0.0,0.2, 0.4,0.6,0.8]
    let arrayForViewY: [Double] = [0.0,0.25,0.5,0.75]
    var arrayOfViews: [UIView] = []
    var amountOfViewsCreated = 0
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotLocation: UIView!
    @IBOutlet weak var shotLocationMarker: UIView!
    @IBOutlet weak var goalPostBox: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        goalPostBox.layer.borderWidth = 2
        goalPostBox.layer.borderColor = UIColor.black.cgColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.shotLocationMarker.layer.cornerRadius = self.shotLocationMarker.frame.size.height / 2
        self.shotLocationMarker.clipsToBounds = true
        for indexOfViewA in arrayForViewX {
            for indexOfViewB in arrayForViewY {
                if(amountOfViewsCreated < 20){
                let DynamicView = UIView(frame: CGRect(origin: CGPoint(x: CGFloat(Double(shotLocation.frame.size.width) * indexOfViewA), y: CGFloat(Double(shotLocation.frame.size.height) * indexOfViewB)), size: CGSize(width: shotLocation.frame.width / 5, height: shotLocation.frame.height / 4)))
                //    print("dynamic view origin is \(DynamicView.bounds.origin)")
                    DynamicView.layer.borderWidth = 2
                    DynamicView.tag = amountOfViewsCreated
                    print("views tag is dynamic view tag \(DynamicView.tag)")
                
                    self.shotLocation.addSubview(DynamicView)
                    arrayOfViews.append(DynamicView)
                }
                    amountOfViewsCreated = amountOfViewsCreated + 1
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Disposes of any resources that can be recreated.
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.view.hitTest(firstTouch.location(in: self.view), with: event)
            shotLandedLocation = firstTouch.location(in: shotLocation)
            //print("shot location origin is \(shotLocation.bounds.origin)")
            for indexOfViewInArray in arrayOfViews{
                if (hitView === indexOfViewInArray){
                tapped = true
                    print("dynamic view tapped is \(indexOfViewInArray.tag)")
             //   print("start")
              //  print("Shot Landed location is \(shotLandedLocation)")
                self.edgesForExtendedLayout = []
                shotLocationMarker.center = shotLandedLocation
                //    print("shot location marker center \(shotLocationMarker.center)")
                //    print("end")
                } else {
               // print("Tap is outside")
            }
            }
        }
    }
    @IBAction func continueButtonSelected(_ sender: UIButton){
        if(tapped){
            
//            var shortestDistance = Float(100)
//            
//
//            for indexA in arrayForX {
//                for indexB in arrayForY {
//                    let referenceCGPoint = CGPoint(x: (CGFloat(Double(shotLocation.frame.size.width) * indexA)) , y: CGFloat(Double(shotLocation.frame.size.height) * indexB))
//                    let distance = hypotf(Float(referenceCGPoint.x - shotLocation.center.x), Float(referenceCGPoint.y - shotLocation.center.y))
//                    
//                    if(distance < shortestDistance ){
//                        let closestReferenceCGPoint = referenceCGPoint
//                        shortestDistance = distance
//                    }
//                }
//            }
//            print(shortestDistance)
            
            //let currentUser = User.current
            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
        } else {
            continueButton.setTitle("Tap in the Goal Box First", for: .normal)
            print("Has not yet tapped inside")
        }
    }
}


    
    


