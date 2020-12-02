//
//  ViewController.swift
//  MyDatePicker
//
//  Created by 김소진 on 2020/11/01.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var dateLabel: UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        
        formatter.dateFormat = "yyyy/MM/dd hh:mm:ss" // 원하는방식으로 지정
        //formatter.dateStyle = .medium
        //formatter.timeStyle = .medium
        return formatter
    }()
    
    @IBAction func didDatePickerValueChanged(_sender: UIDatePicker) {
        print("value change")
        
        let date: Date = self.datePicker.date //sender.date // sender = 메서드를 호출한 datePicker
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.datePicker.addTarget(self, action:#selector(self.didDatePickerValueChanged(_sender:)), for: UIControl.Event.valueChanged)
    }


}

