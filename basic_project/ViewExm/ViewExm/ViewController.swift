//
//  ViewController.swift
//  ViewExm
//
//  Created by 김소진 on 2020/07/19.
//  Copyright © 2020 sojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 서브뷰 생성 (위치 가로 세로/ 크기 가로세로)
        let frame = CGRect(x: 60, y: 100, width: 240, height: 120)
        let subView = UIView(frame: frame)
        
        //서브뷰의 색상
        subView.backgroundColor = UIColor.green //서브뷰의 색상
  
        
        print("서브뷰의 프레임의 CGRect : \(subView.frame)")
        print("서브뷰의 바운드 CGRect : \(subView.bounds)")
        print("서브뷰의 프레임 Origin : \(subView.frame.origin)")
        print("서브뷰의 바운드 Origin : \(subView.bounds.origin)")
        
        
        //서브뷰 추가하기
        view.addSubview(subView)
//
//        //서브뷰 제거하기
//        subView.removeFromSuperview()
    }


}

