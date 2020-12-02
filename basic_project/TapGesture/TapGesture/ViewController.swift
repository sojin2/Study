//
//  ViewController.swift
//  TapGesture
//
//  Created by 김소진 on 2020/11/01.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate { //delegate 이용

    @IBAction func tapView(_sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //코드 이용
//        let tapGesture: UITapGestureRecognizer =
//            UITapGestureRecognizer(target: self, action: #selector(self.tapView(_sender:)))
//
//        self.view.addGestureRecognizer(tapGesture)
        
        
        //delegate 이용
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    
    }
    
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        
        self.view.endEditing(true)
        return true
    }


}

