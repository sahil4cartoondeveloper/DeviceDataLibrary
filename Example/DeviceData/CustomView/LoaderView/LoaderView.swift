//
//  LoaderView.swift
//  Medics
//
//  Created by PIYUSH  GHOGHARI on 25/04/20.
//  Copyright © 2020 Omelette.inc. All rights reserved.
//
import UIKit

class LoaderView: UIView {

    // MARK: Shared Instance
    static let shared = LoaderView()
    @IBOutlet var view: LoaderView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        instanceFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func instanceFromNib() {
        view = UINib(nibName: "LoaderView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as? LoaderView
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        addSubview(view)
    }
    
    func show() {
        DispatchQueue.main.async {
            UIApplication.shared.keyWindow?.addSubview(self)
//            self.view.window?.addSubview(self)
        }
    }
    
    func hide() {
        DispatchQueue.main.async {
            self.removeFromSuperview()
        }
    }
}
