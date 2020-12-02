//
//  ViewController.swift
//  UpDown
//
//  Created by 김소진 on 2020/04/23.
//  Copyright © 2020 sojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController { //UIViewController class를 상속받은 ViewController class
    
    //ViewController 클래스 인스턴스 == storybord에 올려져 있는 것들
    //class:
    //instance:
    //object:
    
    //코드와 Outlet연결 방법
    //1. view controller -> 오른쪽 버튼 -> Outlets -> board와 동글뺑이 연결
    //2. board에서 control누른 상태에서 코드로 끌어서 연결
    //3. board에서 control누름 -> 코드 파란 밑줄 생김 -> 변수 이름 정해서 저장 -> 코드 생성
    //만약 outlet 이름을 바꾸고 싶다면! Editor -> Refacter ->Rename 으로 바꿔야 함 (그냥 코드에서 변경하면 오류)
    
    //MARK: - Properties
    //속성 : 특정 클래스, 구조체나 열거형을 값과 연결
    
    //MARK: IBOutlests
    //interface 빌더위에 올려둔 UI instance를 코드의 Properties 할당할 때 사용
    //코드를 이용하여 Properties 변경
    
    @IBOutlet var resultLabel: UILabel! //게임 결과 (updown)
    @IBOutlet var turnCountLabel : UILabel! //몇 번 시도를 했는지(count)
    @IBOutlet weak var inputField: UITextField!//Text랑 연결
    
    //MARK: Stored Properties
    var randomNumber: UInt32 = 0 // random 값이 부호없는 정수값
    
    var turnCount: Int = 0
    
    
    //weak - 참조하는 인스턴스를 강하게 유지 하지 않는 참조이며 다른 인스턴스의 생명주기가 짧을 때 사용
    
    //MARK:-Methods
    
    //IBAction - interface 빌더 위에 올려져있는 특정 타입과 action을 연결해 주고자 할 때 사용
    //특정 이벤트 발생 -> target의 action을 호출
    
    //연결 방법
    //1. 메소드 정의 -> board에 있는 target과 코드를 직접 연결
    //2. 메소드 정의 -> Connection Inspector -> sent events -> action 선택 -> view controller와 연결
    //3. target -> control누르면서 코드와 연결 -> connection이나 이름 설정
    //주의할 점 : action method 수정하거나 삭제하게된다면 Editor -> Refacter ->Rename 으로 바꿔야 함 (그냥 코드에서 변경하면 오류)
    
    
    @IBAction func touchUpSubmitButton(_ sender: UIButton) {
        
        guard let inputText = self.inputField.text, //view text 부분에 inputText에 넣음
            inputText.isEmpty == false else {
                print("입력값 없음")
                return
        }
        
        guard let inputNumber: UInt32 = UInt32(inputText) else {
            print("입력값이 잘못 되었음")
            return
        }
        
        turnCount += 1
        self.turnCountLabel.text = "\(turnCount)"
        
        if inputNumber > randomNumber  {
            self.resultLabel.text = "UP"
        }else if inputNumber < randomNumber {
            self.resultLabel.text = "DOWN"
        }else {
            self.resultLabel.text = "정답입니다!"
        }
    }
    
    
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        self.initializeGame()
    }
    
    
    @IBAction func tabBackground(_ sender: UITapGestureRecognizer) {
        
        //self.view.endEditing(true)
        //self.inputField.resignFirstResponder()
        //self.inputField.endEditing(true)
        
        self.inputField.endEditing(true)
        
    }
    
    
    func initializeGame() {
        
        self.randomNumber = arc4random() % 25 //arc4random - random값 2^32 - 1 % 25 = 0~24
        self.turnCount = 0
        self.resultLabel.text = "Start!"
        self.turnCountLabel.text = "(turnCount)"
        self.inputField.text = nil
        
        print("임의의 숫자 \(self.randomNumber)")
    }
    
    
    
    //Target - Action Programming Design Pattern
    //Target-Action 디자인 패턴에서 객체는 이벤트가 발생할 때 다른 객체에 메시지를 보내는 데 필요한 정보를 포함
    //액션은 특정 이벤트가 발생했을 때 호출할 메서드를 의미
    //타겟은 액션이 호출될 객체를 의미
    //이벤트 발생 시 전송된 메시지를 액션 메시지라고 하고, 타겟은 프레임워크 객체를 포함한 모든 객체가 될 수 있으나, 보통 컨트롤러가 되는 경우가 일반적
    //https://www.edwith.org/boostcourse-ios/lecture/16854/
    
    
    
    //ViewPrograming 가이드 UITextField Class Reference

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.initializeGame()
    }


}

