//
//  ComposeViewController.swift
//  SjMemo
//
//  Created by 김소진 on 2020/11/23.
//

import UIKit

class ComposeViewController: UIViewController {
    
    var editTarget: Memo? //보기 화면에서 편집버튼을 누르면 전달한 메모가 이 속성에서 저장
    var originalMemoContent: String? //편집 이전의 메모 내용
  
    
    //cancel 버튼을 누르면 close 됨
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
    }
    

    //TextView에 접근하기위한 코드(TextView에 입력되어있는 메모를 가져와야 함)
    @IBOutlet var memoTextView: UITextView!
    
    
    // 메모 저장
    @IBAction func save(_ sender: Any) {
        
        guard let memo = memoTextView.text,
              memo.count > 0 else { //실제 메모를 입력한 경우에만 returen하도록 함
             // 나머지 경우에서는(메모가 없을 경우) 경고창 표시
            alert(message: "메모를 입력하세요")
            return
        }
        
//        let newMemo = Memo(content: memo) //새로운 메모 인스턴스 생성
//        Memo.dummyMemoList.append(newMemo) // 배열에 저장
        
        
        if let target = editTarget {
            target.content = memo
            DataManager.shared.saveContext()
            NotificationCenter.default.post(name: ComposeViewController.memoDidChange, object: nil)
   
        } else {
            DataManager.shared.addNewMemo(memo)
            NotificationCenter.default.post(name: ComposeViewController.newMemoDodInsert, object: nil)
        
            
            //이 코드는 라디오 방송국에서 라디오 방송을 브로드케스팅하는 것과 같다 NotificationCenter은 특정 객체에게 바로 전달되지 않는다.
            // 앱을 구성하는 모든 객체로 전달된다 (=브로드케스트)
        }
        
        
        
        
        dismiss(animated: true, completion: nil) //새 메모 화면을 닫음
        
    }
    
    var willShowToken: NSObjectProtocol?
    var willHideToken: NSObjectProtocol?
    
    deinit {
        if let token = willShowToken {
            NotificationCenter.default.removeObserver(token)
        }
        if let token = willHideToken {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = editTarget {
            navigationItem.title = "메모 편집"
            memoTextView.text = memo.content
            originalMemoContent = memo.content
        } else {
            navigationItem.title = "새 메모"
            memoTextView.text = ""
        }
        
        memoTextView.delegate = self
        
        //키보드가 전달되기 전 notification 처리
        willShowToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in
            
            guard let strongSelf  = self else { return }
            
            if let frame = noti.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
                let height = frame.cgRectValue.height
                
                var inset = strongSelf.memoTextView.contentInset
                inset.bottom = height
                strongSelf.memoTextView.contentInset = inset
                
                inset = strongSelf.memoTextView.scrollIndicatorInsets
                inset.bottom = height
                strongSelf.memoTextView.scrollIndicatorInsets = inset
                
            }
        })
        
        willHideToken = NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: OperationQueue.main, using: { [weak self] (noti) in guard let strongSelf = self else { return }
            
            var inset = strongSelf.memoTextView.contentInset
            inset.bottom = 0
            strongSelf.memoTextView.contentInset = inset
            
            inset = strongSelf.memoTextView.scrollIndicatorInsets
            inset.bottom = 0
            strongSelf.memoTextView.scrollIndicatorInsets = inset
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //키보드 자동 올림
        memoTextView.becomeFirstResponder()
        
        
        //프레젠테이션 컨트롤러 딜리게이트를 따로 설정해야됨
        //편집화면이 실행되기 직전에 delegate실행
        navigationController?.presentationController?.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //화면을 닫기전에 키보드를 내림
        memoTextView.resignFirstResponder()
        //편집화면이 실행되기 직전에 delegate 취소
        navigationController?.presentationController?.delegate = nil
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


//textview에서 편집버튼을 누르면 반복적으로 호출
extension ComposeViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        if let original = originalMemoContent, let edited = textView.text { //original 매모와 편집된 메모를 상수에 저장
            if #available(iOS 13.0, *) { //iOS 13에서 나온 기능이라 이하 버전에서는 사용 불가능
                isModalInPresentation = original != edited //원본 메모와 다른지 비교하고 다르면 isModalInPresentation에 true로 저장
            } else {
            }
        }
    }
}

extension ComposeViewController: UIAdaptivePresentationControllerDelegate {
    //수정하고 pulldown하면 나오늘 매소드
    func presentationControllerDidAttemptToDismiss (_ presentationController: UIPresentationController) {
        let alert = UIAlertController(title: "알람", message: "편집한 내용을 저장할까요?", preferredStyle: .alert)
        
        let okAction = UIAlertAction (title: "확인", style: .default) { [weak self] (action) in self?.save(action)
            
        }
        alert.addAction(okAction)
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel) { [weak self] (action) in self?.close(action)
            
        }
        alert.addAction(cancelAction)
        
        present(alert, animated: true, completion: nil)
    }
}



extension ComposeViewController {
    //Notification = 라디오 방송이라 생각하면 됨 이름으로 구분
    static let newMemoDodInsert = Notification.Name(rawValue:"newMemoDidIn") //Notification 이름 선언
    static let memoDidChange = Notification.Name(rawValue: "memoDidChange")
}
