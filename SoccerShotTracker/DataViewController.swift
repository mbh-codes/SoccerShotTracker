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
    let arrayForViewX: [Double] = [0.0,1/8,2/8,3/8,4/8,5/8,6/8,7/8]
    let arrayForViewY: [Double] = [0.0,0.25,0.5,0.75]
    var amountOfViewsCreated = 0
    var amountOfLabelsCreated = 0
    var tappedViewTag = 0
    var arrayOfViews: [UIView] = []
    var index = 0

    @IBOutlet weak var dataChart: UIView!
    @IBOutlet weak var goalBox: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserService.posts(for: User.current) { (posts) in
            self.posts = posts
        }
        dataChart.layer.borderWidth = 2
        dataChart.layer.borderColor = UIColor.gray.cgColor
        goalBox.layer.borderWidth = 5
        goalBox.layer.borderColor = UIColor.white.cgColor
        goalBox.frame.size.width = dataChart.frame.width - 2 * (dataChart.frame.size.width)/8
        goalBox.frame.size.height = dataChart.frame.height - (dataChart.frame.size.height)/4
        goalBox.frame.origin = CGPoint(x: CGFloat(Double(dataChart.frame.size.width) * 1/8), y: CGFloat(Double(dataChart.frame.size.height) * 1/4))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        for indexOfViewA in arrayForViewX {
            for indexOfViewB in arrayForViewY {
                if(amountOfViewsCreated < 32) {
                    let DynamicView = UIView(frame: CGRect(origin: CGPoint(x: CGFloat(Double(dataChart.frame.size.width) * indexOfViewA), y: CGFloat(Double(dataChart.frame.size.height) * indexOfViewB)),size: CGSize(width: dataChart.frame.width / 8, height: dataChart.frame.height / 4)))
                    DynamicView.layer.borderWidth = 2
                    DynamicView.tag = amountOfViewsCreated
                    DynamicView.backgroundColor = UIColor(red: 0.312, green: 0.658, blue: 0.169, alpha: 0.4)
                    DynamicView.layer.borderColor = UIColor(red:1,green:1,blue:1,alpha:0.2).cgColor
                    tappedViewTag = amountOfViewsCreated
                    self.dataChart.addSubview(DynamicView)
                    arrayOfViews.append(DynamicView)
                }
                amountOfViewsCreated = amountOfViewsCreated + 1
            }
        }
        for indexOfTextFieldsA in arrayForViewX {
            for indexOfTextFieldsB in arrayForViewY {
                if (amountOfLabelsCreated < 32) {
                    let textFiled = UILabel(frame: CGRect(origin: CGPoint (x: CGFloat(Double(dataChart.frame.size.width) * indexOfTextFieldsA), y: CGFloat(Double(dataChart.frame.size.height) * indexOfTextFieldsB)), size: CGSize(width: dataChart.frame.width / 8, height: dataChart.frame.height / 4 )))
                    textFiled.layer.borderWidth = 2
                    textFiled.backgroundColor = UIColor(red: 0.312, green: 0.658, blue: 0.169, alpha: 0.4)
                    textFiled.layer.borderColor = UIColor(red:1,green: 1, blue: 1, alpha: 0.2).cgColor
                    ShotService.getShots(for: User.current) { (shotsArray) in
                        if (self.index < 32) {
                            textFiled.text = String(shotsArray[self.index])
                            self.index += 1
                        }
                    }
                    textFiled.textAlignment = NSTextAlignment.center
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

