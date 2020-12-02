//
//  ViewController.swift
//  PickerView
//
//  Created by 김소진 on 2020/11/27.
//

import UIKit

// 델리게이트 메서드를 사용하려면 UIPickerViewDelegate, UIPickerViewDataSource 클래스들을 상속 받아야합니다,
class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    let MAX_ARRAY_NUM = 10 //이미지 파일명을 저장할 배열의 최대 크기를 지정
    let PICKER_VIEW_COLUMN = 1 //피커 뷰의 열의 개수를 지정
    let PICKER_VIEW_HEIGHT:CGFloat = 80 //피커 뷰의 높이 지정
    var imageArray = [UIImage?]()
    var imageFileName = [ "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg","6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg" ] //이미지 파일명을 저장할 배열
    

    @IBOutlet var pickerImage: UIPickerView!
    @IBOutlet var lblImageFileName: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // i 값을 0에서 MAX_ARRAY_NUM보다 작을 때까지 반복
        for i in 0 ..< MAX_ARRAY_NUM { //0 부터 9까지 루프 실행
            //각 파일명에 해당하는 이미지를 생성
            let image = UIImage(named: imageFileName[i]) // imageFileName[i]에 있는 파일명을 사용하여 UIImage 타입의 이미지를 생성한 후 image에 할당
            // 생성된 이미지를 imageArray에 추가
            imageArray.append(image) // 생성된 배열에 추가
        }
        
        lblImageFileName.text = imageFileName[0] //뷰가 로드되었을 때 첫 번째 파일명 출력
        imageView.image = imageArray[0] //뷰가 로드되었을 때 첫번째 이미지 출력
    }
    
    //MARK:-피커 뷰의 컴포넌트 수 설정
    //피커뷰에게 컴포넌츠의 수를 정수 값으로 넘겨주는 델리게이트 메서드. 피커뷰의 컴포넌트는 피커뷰에 표시되는 열의 개수
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    //MARK:-피커 뷰의 높이 설정
    //피커뷰에게 컴포넌트의 높이를 정수 값으로 넘겨주는 델리게이트 메서드. 80을 넘겨 받음
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PICKER_VIEW_HEIGHT
    }
    
    //MARK:-피커 뷰의 개수 설정
    //numberOfRowsInComponent 인수를 가지는 델리게이트 메서드.피커 뷰에게 컴포넌트의 열의 개수를 정수 값으로 넘겨준다. (피커뷰의 해당 열에서 선택할 수 있는 행의 개수 = 데이터의 개수)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return imageFileName.count
    }
    //MARK:- 피커 뷰의 각 Row의 타이틀 설정
    //titleForRow 인수를 가지는 델리게이트 메서드. 피커 뷰에게 컴포넌트의 각 열의 타이틀을 문자열 값으로 넘겨준다.
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return imageFileName[row]
//    }
    
    //MARK:- 피커 뷰의 각 Row의 view 설정
    // 피커 뷰에게 컴포넌트의 각 열의 뷰를 UIView 타입의 값으로 넘겨준다. 이미지 뷰에 저장되어있는 이미지를 넘겨줌
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image: imageArray[row])
        imageView.frame = CGRect (x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    //MARK:- 피커뷰가 선택되었을 때 실행
    //row값을 가져와서 해당하는 문자열을 가져 온 후 lblImageFileName.text에 저장한다.
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
    

}
