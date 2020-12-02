//
//  ViewController.swift
//  ColorPicker
//
//  Created by 김소진 on 2020/05/07.
//  Copyright © 2020 sojin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- Private Types
    private struct ColorComponent {
        
        typealias SliderTag = Int
        typealias Component = Int
        
        static let count: Int = 4
        
        static let red: Int  = 0
        static let green: Int = 1
        static let blue: Int = 2
        static let alpha: Int = 3
        
        
        //View 의 기본 tag값은 = 0 이므로 tag 값을 0으로 설정하면 다른값이 반환 될 수도 있으므로 0이 아닌 100,101등으로 설정한다.
        
        static func tag(`for`: Component) -> Int {
            return `for` + 100
        }
        
        static func component(from: SliderTag) -> Component {
            return from - 100
        }
    }
    
    
    private struct ViewTag {
        static let sliderRed: Int = 100
        static let sliderGreen: Int = 101
        static let sliderBlue: Int = 102
        static let sliderAlpha: Int = 103
    }
    
    //MARK: - Properties
    //MARK: IBOutlets
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var pickerView: UIPickerView!
    
    //MARK: Privates
      //숫자를 hardcoding하는것을 피하기 위해서
      private let rgbStep: Float = 255.0
      private let numberOfRGBStep: Int = 256
      private let numberOfAlphaStep: Int = 11
      
      
      //MARK:- MEthods
      //MARK: IBActions
    
    
    //sender라는 매개변수로 이벤트를 보냄 , 어떤 control에서 이벤트가 발생해서 누가 이 메서드를 호출한 것인가?
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        
        //sender에 들어온 값이 정상적으로 들어왔나 확인
        guard(ViewTag.sliderRed...ViewTag.sliderAlpha).contains(sender.tag) else {
            print ("wrong slider tag")
            return
        }
        
        
        let component: Int = ColorComponent.component(from: sender.tag)
        let row: Int
        
        //rgb숫자 적용
        if component == ColorComponent.alpha {
            row = Int(sender.value * 10)
        } else {
            row = Int(sender.value)
        }
        
        self.pickerView.selectRow(row,
                                  inComponent: component, animated: false)
        
        //함수 호출
        self.matchViewColorWithCurrentValue()
        
    }
    
     //MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //pickerview의 각 줄이 255로 가도록 설정
        for i in 0..<self.pickerView.numberOfComponents {
            let numberOfRows: Int = self.pickerView.numberOfRows(inComponent: i)
            self.pickerView.selectRow(numberOfRows - 1, inComponent: i, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
        }
        
        // MARK: Privates
        private func matchViewColorWithCurrentValue() {
            
            // Outlet 없이도 View요소를 코드에서 사용 가능 : ViewWithTag 이 메서드는 해당 View (View Controler)의 하위 뷰를 순회 하면서 전달 받은 태그값(ViewTag.sliderRed)을 가진 view 를 찾아서 반환하는 메서드
            // 호출이 빈번한 메서드에 넣기에는 조금 부적절하다 --> @IBOutlet으로 할당하거나 일반 프로퍼티로 할당
            guard let redSlider: UISlider = self.view.viewWithTag(ViewTag.sliderRed) as? UISlider,
                let greenSlider: UISlider = self.view.viewWithTag(ViewTag.sliderGreen) as? UISlider,
                let blueSlider: UISlider = self.view.viewWithTag(ViewTag.sliderBlue) as? UISlider,
                let alphaSlider: UISlider = self.view.viewWithTag(ViewTag.sliderAlpha) as? UISlider
                else {
                    return
            }
            
            //UIColor의 Red, Green, Blue, Alpha 값은 0과 1 사이의 실수 값
            let red: CGFloat = CGFloat(redSlider.value / self.rgbStep)
            let green: CGFloat = CGFloat(greenSlider.value / self.rgbStep)
            let blue: CGFloat = CGFloat(blueSlider.value / self.rgbStep)
            let alpha: CGFloat = CGFloat(alphaSlider.value)
            
            let color: UIColor = UIColor(red: red, green: green, blue: blue, alpha: alpha)
            
            self.colorView.backgroundColor = color
        }

    }

    // UIPickerViewDelegate,UIPickerViewDataSource의 프로토콜 채택
    extension ViewController: UIPickerViewDelegate,UIPickerViewDataSource {
        
        //MARK: - UIPickerViewDataSource
        
        //두 프로토콜의 매서드 추가
        
        //ViewController야 내가 보여줘야할 Components의 갯수를 보여줘 -> ViewController가 int 형식으로 갯수를 보내줌
        //in pickerView를 시용해서 자신의 존재를 알리는 이유는 여러개의 pickerview가 있을 경우 어디 위치인지 알기 위해서임
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return ColorComponent.count
        }
        
        //나 pickerView인데 하나의 component당 몇개의 row를 보여줘야해?
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            if component == ColorComponent.alpha {
                return self.numberOfAlphaStep
            } else {
                return self.numberOfRGBStep
            }
        }
        
        //MARK: - UIPickerViewDelegate
        //UIPickerViewDelegate에 정의된 매서드 중 두개만 구현
        
        //몇번째 component의 몇번 째 row는 이런 문자열을 title로 가지고 있는지 알려주는 함수
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            
            if component == ColorComponent.alpha {
                return String (format: "%1.1lf", Double(row) * 0.1)
            } else {
                return "\(row)"
            }
        }
        
        //반환 값이 없을때는 알아서 처리해라라는 뜻임
        //사용자가 몇번 째 compoonent의 몇 번째 row를 선택했는데 알아서 실행 해 줘 실행되는 함수
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            
            let sliderTag: Int = ColorComponent.tag(for: component)
            
            guard let slider: UISlider = self.view.viewWithTag(sliderTag) as? UISlider else {
                return
            }
            
            if component == ColorComponent.alpha {
                slider.setValue(Float(row) / 10.0 , animated: false)
            } else {
                slider.setValue(Float(row), animated: false)
            }
            
            self.matchViewColorWithCurrentValue()
        }


}

