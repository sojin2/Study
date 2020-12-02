//
//  UIViewController+Alert.swift
//  SjMemo
//
//  Created by 김소진 on 2020/11/24.
//

import UIKit

//경고창을 만드는 메소드
extension UIViewController { //UIViewController를 상속하는 모든 클래스에서 우리가 구현한 메소드를 상속할 수 있도록 extension으로 선언
    func alert(title: String = "알림", message: String) {
        let alert  = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil) // 버튼 생성
        alert.addAction(okAction) // 생성한 버큰을 alertcontroller에 추가
        present(alert, animated: true, completion: nil) //경고창을 화면에 표시
        
    }
}


