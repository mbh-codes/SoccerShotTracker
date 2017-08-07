//
//  ShotLocationViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ShotLocationViewController: UIViewController {
    var shouldSetupConstraints = true
    var tapped = false
    var shotLandedLocation = CGPoint()
    //let arrayForX: [Double] = [0.1,0.3,0.5,0.7,0.9]
    //let arrayForY: [Double] = [0.125,0.375,0.625,0.875]
    let arrayForViewX: [Double] = [0.0,1/8,2/8,3/8,4/8,5/8,6/8,7/8]
    let arrayForViewY: [Double] = [0.0,0.25,0.5,0.75]
    var arrayOfViews: [UIView] = []
    var amountOfViewsCreated = 0
    var tappedViewTag = 0
    var tappedViewQuadrant = 0
    var posts: [String:Any] = [String: AnyObject]()
    //var shots: [String: Any] = [String: AnyObject]()
 //   let screenSize = UIScreen.main.bounds
    
    
    
    
    
    @IBOutlet weak var continueButton: UIButton!
    @IBOutlet weak var shotLocation: UIView!
    @IBOutlet weak var shotLocationMarker: UIView!
    @IBOutlet weak var goalPostBox: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //shotLocation.frame.width = screenSize.width
        goalPostBox.frame.size.width = shotLocation.frame.width - 2 * (shotLocation.frame.size.width)/8
        goalPostBox.frame.size.height = shotLocation.frame.height - (shotLocation.frame.size.height)/4
        goalPostBox.frame.origin = CGPoint(x: CGFloat(Double(shotLocation.frame.size.width) * 1/8), y: CGFloat(Double(shotLocation.frame.size.height) * 1/4))
        
        goalPostBox.layer.borderWidth = 5
        goalPostBox.layer.borderColor = UIColor.white.cgColor
        shotLocation.layer.borderWidth = 2
        shotLocation.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.shotLocationMarker.layer.cornerRadius = self.shotLocationMarker.frame.size.height / 2
        self.shotLocationMarker.clipsToBounds = true
        for indexOfViewA in arrayForViewX {
            for indexOfViewB in arrayForViewY {
                if(amountOfViewsCreated < 32){
                let DynamicView = UIView(frame: CGRect(origin: CGPoint(x: CGFloat(Double(shotLocation.frame.size.width) * indexOfViewA), y: CGFloat(Double(shotLocation.frame.size.height) * indexOfViewB)), size: CGSize(width: shotLocation.frame.width / 8, height: shotLocation.frame.height / 4)))
                //    print("dynamic view origin is \(DynamicView.bounds.origin)")
                    DynamicView.layer.borderWidth = 1
                    DynamicView.tag = amountOfViewsCreated
                    print("views tag is dynamic view tag \(DynamicView.tag)")
                    tappedViewTag = DynamicView.tag
                
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
            for indexOfViewInArray in arrayOfViews{
                if (hitView === indexOfViewInArray){
                tapped = true
                print("dynamic view tapped is \(indexOfViewInArray.tag)")
                tappedViewQuadrant = indexOfViewInArray.tag
                self.edgesForExtendedLayout = []
                shotLocationMarker.center = shotLandedLocation
                
                } else {
               
            }
            }
        }
    }
    @IBAction func continueButtonSelected(_ sender: UIButton){
        if(tapped){
            
            let shotQuadrant = String(tappedViewQuadrant)
            
//            let newPosts: Dictionary<String, String> = [
//                "shotQuadrant": shotQuadrant
//            ]
//            ref.childByAppendingPath(User.current.uid).childByAppendingPath("Posts".childByAutoId().setValue(newPosts))
//            ref.childByAppendingPath(User.current.uid).observeEventType(.ChildAdded, withBlock : { snapshot in
//                print(snapshot.value)
//                var posts = [NSDictionary]()
//                for item in snapshot.children {
//                    let child = item as! FDataSnapshot
//                    let dict = child.value as! NSDictionary
//                    posts.append(dict)
//                }
//                self.TextLabel.text = snapsshot
//             })
            
            
            let currentUser = User.current
            let dictionaryOfViewTags = ["shotsLandedQuadrants": shotQuadrant]
            let ref = Database.database().reference().child("posts").child(currentUser.uid).childByAutoId()
            ref.updateChildValues(dictionaryOfViewTags)
            
            print("tapped view is \(tappedViewTag)")
            print("shot quadrant is \(shotQuadrant)")
            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
        } else {
            continueButton.setTitle("Tap in the Goal Box First", for: .normal)
            print("Has not yet tapped inside")
        }
    }
}


    
    


