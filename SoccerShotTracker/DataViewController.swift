//
//  DataViewController.swift
//  SoccerShotTracker
//
//  Created by Miguel Barba on 7/17/17.
//  Copyright © 2017 MBH. All rights reserved.
//

import UIKit


class DataViewController: UIViewController {
    
    @IBOutlet weak var dataChart: UIView!
    @IBOutlet weak var randomLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 //       UserService.distanceShots(for User.current) { (distanceShots) in
 //           self.distanceShots = distanceShots
 //       }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let firstTouch = touches.first {
            let hitView = self.dataChart.hitTest(firstTouch.location(in: self.dataChart), with: event)
            
            if hitView === dataChart {
                print("touch is inside")
            } else {
                print("touch is outside")
            }
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}







//
//    @IBOutlet weak var leftTopCornerOutsideData: UIButton!
//    @IBOutlet weak var topLeftOutsideData: UIButton!
//    @IBOutlet weak var middleTopOutsideData: UIButton!
//    @IBOutlet weak var topRightOutsideData: UIButton!
//    @IBOutlet weak var rightTopCornerOutsideData: UIButton!
//    @IBOutlet weak var leftTopOutsideData: UIButton!
//    @IBOutlet weak var leftTopInsideData: UIButton!
//    @IBOutlet weak var middleTopInsideData: UIButton!
//    @IBOutlet weak var rightTopInsideData: UIButton!
//    @IBOutlet weak var rightTopOutsideData: UIButton!
//    @IBOutlet weak var leftBottonOutsideData: UIButton!
//    @IBOutlet weak var leftBottomInsideData: UIButton!
//    @IBOutlet weak var middleBottomInsideData: UIButton!
//    @IBOutlet weak var rightBottomInsideData: UIButton!
//    @IBOutlet weak var rightBottonOutsideData: UIButton!
//
//
//
//
//    @IBAction func leftTopCornerOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func topLeftOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func middleTopOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func topRightOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func rightTopCornerOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func leftTopOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func leftTopInsideData(_ sender: UIButton) {
//    }
//    @IBAction func middleTopInsideData(_ sender: UIButton) {
//    }
//    @IBAction func rightTopInsideData(_ sender: UIButton) {
//    }
//    @IBAction func righTopOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func leftBottomOutsideData(_ sender: UIButton) {
//    }
//    @IBAction func leftBottomInsideData(_ sender: UIButton) {
//    }
//    @IBAction func middleBottomInsideData(_ sender: UIButton) {
//    }
//    @IBAction func rightBottomInsideData(_ sender: UIButton) {
//    }
//    @IBAction func rightBottomOutsideData(_ sender: UIButton) {
//    }
