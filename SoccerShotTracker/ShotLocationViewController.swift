//
//  ShotLocationViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit

class ShotLocationViewController: UIViewController {
    @IBOutlet weak var leftTopCornerOutside: UIButton!
    @IBOutlet weak var topLeftOutside: UIButton!
    @IBOutlet weak var middleTopOutside: UIButton!
    @IBOutlet weak var topRightOutside: UIButton!
    @IBOutlet weak var rightTopCornerOutside: UIButton!
    @IBOutlet weak var leftTopOutside: UIButton!
    @IBOutlet weak var leftTopInside: UIButton!
    @IBOutlet weak var middleTopInside: UIButton!
    @IBOutlet weak var rightTopInside: UIButton!
    @IBOutlet weak var rightTopOutside: UIButton!
    @IBOutlet weak var leftBottomOutside: UIButton!
    @IBOutlet weak var leftBottomInside: UIButton!
    @IBOutlet weak var middleBottomInside: UIButton!
    @IBOutlet weak var rightBottomInside: UIButton!
    @IBOutlet weak var rightBottomOutside: UIButton!
    
    
    
    @IBAction func leftTopCornerOutside(_ sender: UIButton) {
        if(leftTopCornerOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            leftTopCornerOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            leftTopCornerOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func topLeftOutside(_ sender: UIButton) {
        if(topLeftOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            topLeftOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            topLeftOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func middleTopOutside(_ sender: UIButton) {
        if(middleTopOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            middleTopOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            middleTopOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func topRightOutside(_ sender: UIButton) {
        if(topRightOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            topRightOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            topRightOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func rightTopCornerOutside(_ sender: UIButton){
        if(rightTopCornerOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            rightTopCornerOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            rightTopCornerOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func leftTopOutside(_ sender: UIButton){
        if(leftTopOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            leftTopOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            leftTopOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func leftTopInside(_ sender: UIButton) {
        if(leftTopInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            leftTopInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            leftTopInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func middleTopInside(_ sender: UIButton) {
        if(middleTopInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            middleTopInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            middleTopInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func rightTopInside(_ sender: UIButton) {
        if(rightTopInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            rightTopInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            rightTopInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func rightTopOutside(_ sender: UIButton) {
        if(rightTopOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            rightTopOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            rightTopOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func leftBottomOutside(_ sender: UIButton) {
        if(leftBottomOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            leftBottomOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            leftBottomOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func leftBottomInside(_ sender: UIButton) {
        if(leftBottomInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            leftBottomInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            leftBottomInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func middleBottomInside(_ sender: UIButton) {
        if(middleBottomInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            middleBottomInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            middleBottomInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func rightBottomInside(_ sender: UIButton) {
        if(rightBottomInside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            rightBottomInside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            rightBottomInside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }
    @IBAction func rightBottomOutside(_ sender: UIButton){
        if(rightBottomOutside.backgroundColor == UIColor(red:0, green:0, blue:1, alpha:1)){
            rightBottomOutside.backgroundColor = UIColor(red:0.91, green:0.93, blue:1.00, alpha:1)
        } else {
            rightBottomOutside.backgroundColor = UIColor(red:0, green:0, blue:1, alpha:1)
        }
    }

    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Disposes of any resources that can be recreated.
    }
}


    
    
    


