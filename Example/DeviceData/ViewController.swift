//
//  ViewController.swift
//  DeviceData
//
//  Created by sahil4cartoondeveloper on 10/01/2021.
//  Copyright (c) 2021 sahil4cartoondeveloper. All rights reserved.
//

import UIKit
import DeviceData

class ViewController: UIViewController {

    @IBOutlet weak var getLocationButton: UIButton!
    
    //Variable
    let deviceData = DeviceDetails()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setUpScreenUI()
//        self.deviceData.getAddress { DeviceData in
//            print("Device Data :- \(DeviceData)")
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func setUpScreenUI() {
//        getLocationButton.titleLabel?.font = UIFont(name: "Get Location", size: 18)
//        deviceData.getAddress()
//    }
    
    @IBAction func getLocationButtonClick(_ sender: UIButton) {
        self.getDeviceData()
    }
    
    private func getDeviceData() {
        
    }

}

