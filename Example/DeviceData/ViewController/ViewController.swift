//
//  ViewController.swift
//  DeviceData
//
//  Created by sahil4cartoondeveloper on 10/01/2021.
//  Copyright (c) 2021 sahil4cartoondeveloper. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func oneButtonClick(_ sender: UIButton) {
        let apiCallVC = storyboard?.instantiateViewController(withIdentifier: "APICallViewController") as? APICallViewController
        apiCallVC?.apiCallType = .one
        self.navigationController?.pushViewController(apiCallVC!, animated: true)
    }
    
    @IBAction func twoButtonClick(_ sender: UIButton) {
        let apiCallVC = storyboard?.instantiateViewController(withIdentifier: "APICallViewController") as? APICallViewController
        apiCallVC?.apiCallType = .two
        self.navigationController?.pushViewController(apiCallVC!, animated: true)
    }
    
    @IBAction func threeButtonClick(_ sender: UIButton) {
        let apiCallVC = storyboard?.instantiateViewController(withIdentifier: "APICallViewController") as? APICallViewController
        apiCallVC?.apiCallType = .three
        self.navigationController?.pushViewController(apiCallVC!, animated: true)
    }
    
    @IBAction func fourButtonClick(_ sender: UIButton) {
        let apiCallVC = storyboard?.instantiateViewController(withIdentifier: "APICallViewController") as? APICallViewController
        apiCallVC?.apiCallType = .four
        self.navigationController?.pushViewController(apiCallVC!, animated: true)
    }
    
    @IBAction func fiveButtonClick(_ sender: UIButton) {
        let apiCallVC = storyboard?.instantiateViewController(withIdentifier: "APICallViewController") as? APICallViewController
        apiCallVC?.apiCallType = .five
        self.navigationController?.pushViewController(apiCallVC!, animated: true)
    }
    
    @IBAction func sixButtonClick(_ sender: UIButton) {
        let apiCallVC = storyboard?.instantiateViewController(withIdentifier: "APICallViewController") as? APICallViewController
        apiCallVC?.apiCallType = .six
        self.navigationController?.pushViewController(apiCallVC!, animated: true)
    }
}

