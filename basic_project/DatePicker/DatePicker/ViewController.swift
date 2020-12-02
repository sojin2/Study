//
//  ViewController.swift
//  DatePicker
//
//  Created by 김소진 on 2020/11/27.
//

import UIKit

class ViewController: UIViewController {
    
    // 타이머가 구동되면 실행할 함수
    let timeSelector: Selector = #selector(ViewController.updateTime) //타이머가 구동되면 실행할 함수를 지정
    let interval = 1.0 // 타이머 간격 1.0에 1초
    var count = 0 //타이머가 설정한 간격대로 실행되는지 확인하기 위한 변수

    @IBOutlet var IblCurrentTime: UILabel! // 현재 시간 레이블의 아웃렛 변수
    @IBOutlet var IblPickerTime: UILabel! // 선택 시간 레이블의 아웃렛 변수
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // timeInterval : 타이머 간격 , target : 동작될 view ,selector: 타이머가 구동될 때 실행할 함수, userInfo: 사용자 정보, repeats: 반복 여부
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender // 전달된 인수 저장
        
        let formatter = DateFormatter() //DateFormmatter 클래스 상수 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // formatter의 dateFormat 속성을 설정
        IblPickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
        //데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷대로 string 메서드를 사용하여 문자열(String)로 변환
        
        
    }
    
    
    // 타이머가 구동된 후 정해진 시간이 되었을 때 실행 할 함수
    @objc func updateTime() { //#selector()의 인자로 사용될 메서드를 선언할 때 Object-C와의 호환성을 위하여 함수 앞애 번드시 @objc키워드를 붙여야한다.
        
//        IblCurrentTime.text = String(count) //String으로 변환한 count값을 'IblCurrentTime'레이블의 text 속성에 저장
//        count = count + 1
        
        
        let date = NSDate() // NSDate 함수를 사용하여 현재 시간을 가져옴
        
        let formatter = DateFormatter() // 날짜를 출력하기 위하여 DageFormatter라는 클래스의 상수 formatter를 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE" // 앞에서 선언한 상수 formatter의 dateFormat 속성 설정
        //현재 날짜(date)를 formatter의 dateFormat에서 설정한 포맷대로
        //string 메서드를 사용하여 문자열 (String)로 변환
        //문자열로 변환한 date 값을 "현재시간:"이라는 문자열에 추가
        //그리고 문자열을 IblCurrentTime의 text에 입력
        
        
        IblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date) //피커 뷰에서 선택한 날짜를 위 포맷대로 문자열로 변환 -> text에 추가
        
    }
    
}

