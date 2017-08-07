//
//  DataViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase


class DataViewController: UIViewController {
    
    var posts = [Post]()
    
    let arrayForViewX: [Double] = [0.0,0.2,0.4,0.6,0.8]
    let arrayForViewY: [Double] = [0.0,0.25,0.5,0.75]
    let arrayForTextFieldsX: [Double] = [0.1, 0.3, 0.5, 0.7, 0.9]
    let arrayForTextFieldsY: [Double] = [0.125, 0.375, 0.625, 0.875]
    var amountOfViewsCreated = 0
    var amountOfLabelsCreated = 0
    var tappedViewTag = 0
    var arrayOfViews: [UIView] = []
    
    
    @IBOutlet weak var dataChart: UIView!
    @IBOutlet weak var goalBox: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
            print(posts)
            print("these are the posts \(posts)")
        }
        
//        randomLabel.text = String(describing: Database.database().reference().child(User.current.uid).child("post").child(Post.init(snapshot: DataSnapshot)),
        dataChart.layer.borderWidth = 2
        dataChart.layer.borderColor = UIColor.white.cgColor
        goalBox.layer.borderWidth = 0.5
        goalBox.layer.borderColor = UIColor.white.cgColor
        
        
        
      //  postsRef.observesSingleEventOfType(.Value, withBlock) { snapshot in
        //    for child in snapshot.children {
          //      if let shotLandedQuadrants = child.value.["title"] as? String {
            //        print("shot lannded qudrant is \(shotLandedQuadrant)")
              //  }
      //      }
    //}
    }
    

    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for indexOfViewA in arrayForViewX {
            for indexOfViewB in arrayForViewY {
                if(amountOfViewsCreated < 20) {
                    let DynamicView = UIView(frame: CGRect(origin: CGPoint(x: CGFloat(Double(dataChart.frame.size.width) * indexOfViewA), y: CGFloat(Double(dataChart.frame.size.height) * indexOfViewB)),size: CGSize(width: dataChart.frame.width / 5, height: dataChart.frame.height / 4)))
                    DynamicView.layer.borderWidth = 2
                    DynamicView.tag = amountOfViewsCreated
                    
                    tappedViewTag = amountOfViewsCreated
                    self.dataChart.addSubview(DynamicView)
                    arrayOfViews.append(DynamicView)
                    
                }
                amountOfViewsCreated = amountOfViewsCreated + 1
            }
        }
        for indexOfTextFieldsA in arrayForViewX {
            for indexOfTextFieldsB in arrayForViewY {
                if (amountOfLabelsCreated < 20) {
                    let textFiled = UILabel(frame: CGRect(origin: CGPoint (x: CGFloat(Double(dataChart.frame.size.width) * indexOfTextFieldsA), y: CGFloat(Double(dataChart.frame.size.height) * indexOfTextFieldsB)), size: CGSize(width: dataChart.frame.width / 5, height: dataChart.frame.height / 4 )))
                    textFiled.layer.borderWidth = 2
//                  textFiled.layer.borderColor = UIColor.black as! CGColor
                    textFiled.text = "2"
                    self.dataChart.addSubview(textFiled)
                
                }
                amountOfLabelsCreated = amountOfLabelsCreated + 1
            }
        }
        }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

