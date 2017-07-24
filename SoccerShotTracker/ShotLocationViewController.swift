//
//  ShotLocationViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

class ShotLocationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Disposes of any resources that can be recreated.
    }
    
    @IBAction func continueButtonSelected(_ sender: UIButton){
//        if (counter > 1 || counter < 1){
//            print("More than one location is selected.")
//            print("\(counter)")
//            print("\(counter != 1)")
//        } else {
//            print("\(counter)")
            self.performSegue(withIdentifier: "shotLocationVCToTab", sender: self)
//        }
    }
}

//    @IBOutlet weak var leftTopCornerOutside: UIButton!
//    @IBOutlet weak var topLeftOutside: UIButton!
//    @IBOutlet weak var middleTopOutside: UIButton!
//    @IBOutlet weak var topRightOutside: UIButton!
//    @IBOutlet weak var rightTopCornerOutside: UIButton!
//    @IBOutlet weak var leftTopOutside: UIButton!
//    @IBOutlet weak var leftTopInside: UIButton!
//    @IBOutlet weak var middleTopInside: UIButton!
//    @IBOutlet weak var rightTopInside: UIButton!
//    @IBOutlet weak var rightTopOutside: UIButton!
//    @IBOutlet weak var leftBottomOutside: UIButton!
//    @IBOutlet weak var leftBottomInside: UIButton!
//    @IBOutlet weak var middleBottomInside: UIButton!
//    @IBOutlet weak var rightBottomInside: UIButton!
//    @IBOutlet weak var rightBottomOutside: UIButton!
//
//    var counter = 0
//
//
//    @IBAction func leftTopCornerOutside(_ sender: UIButton) {
//        if(leftTopCornerOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            leftTopCornerOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            leftTopCornerOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func topLeftOutside(_ sender: UIButton) {
//        if(topLeftOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            topLeftOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            topLeftOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func middleTopOutside(_ sender: UIButton) {
//        if(middleTopOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            middleTopOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            middleTopOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func topRightOutside(_ sender: UIButton) {
//        if(topRightOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            topRightOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            topRightOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func rightTopCornerOutside(_ sender: UIButton){
//        if(rightTopCornerOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            rightTopCornerOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            rightTopCornerOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func leftTopOutside(_ sender: UIButton){
//        if(leftTopOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            leftTopOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            leftTopOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func leftTopInside(_ sender: UIButton) {
//        if(leftTopInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            leftTopInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            leftTopInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func middleTopInside(_ sender: UIButton) {
//        if(middleTopInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            middleTopInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            middleTopInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func rightTopInside(_ sender: UIButton) {
//        if(rightTopInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            rightTopInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            rightTopInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func rightTopOutside(_ sender: UIButton) {
//        if(rightTopOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            rightTopOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            rightTopOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func leftBottomOutside(_ sender: UIButton) {
//        if(leftBottomOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            leftBottomOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            leftBottomOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func leftBottomInside(_ sender: UIButton) {
//        if(leftBottomInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            leftBottomInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            leftBottomInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func middleBottomInside(_ sender: UIButton) {
//        if(middleBottomInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            middleBottomInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            middleBottomInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func rightBottomInside(_ sender: UIButton) {
//        if(rightBottomInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            rightBottomInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            rightBottomInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }
//    @IBAction func rightBottomOutside(_ sender: UIButton){
//        if(rightBottomOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
//            counter = counter - 1
//            rightBottomOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
//        } else {
//            counter = counter + 1
//            rightBottomOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
//        }
//    }


    
    


