//
//  MemoListTableViewController.swift
//  SjMemo
//
//  Created by 김소진 on 2020/11/23.
//

import UIKit

//메모 리스트 화면에서 나타나는 다양한 이벤트를 처리
class MemoListTableViewController: UITableViewController { //UITableViewDataSource 역할을 함
    
    let formatter: DateFormatter = { //원하는 포맷으로 날짜 출력하기위해 설정
        let f = DateFormatter()
        f.dateStyle = .long //날짜 설정
        f.timeStyle = .short //시간 설정
        f.locale = Locale(identifier: "Ko_kr") //날짜와 시간 한글로 설정
        return f
    } ()
    
    //save 버튼을 누르면 호출됨
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) //이름 처럼 뷰컨트롤러가 관리하는 뷰가 화면에 표시되기 직전에 자동으로 호출
        
        
        DataManager.shared.fetchMemo()
        tableView.reloadData()
        
        
        
        //테이블 뷰에게 목록을 업데이트
//        tableView.reloadData() //최신 데이터로 업데이트
//        print(#function)    //제대로 들어갔는지 확인하는 로그
        

        // 위와 같은 구현은 12까지의 구현 방식(pullscreen) = pullscreen으로 사용하면 13에서도 문제 없음
        //iOS 12 이하 : 프로젝트 속성의  기본 값이 pullscreen임
        //iOS 13 : 프로젝트 속성의 기본 값이 시트 이 시트 방식을 사용하면 viewWillAppear메소드가 한 번만 호출됨 그때 노티피케이션을 활용하여 문제 해결
        //새로운 메모가 저장되면 노티피케이션을 하나 전달 -> 목록화면은 노티피케이션이 전달되는 시점에 테이블 뷰를 업데이트 하도록 구현
    }
    
    var token: NSObjectProtocol? //토큰을 저장할 속성 addObserver에서 리턴하는 토큰을 여기에 저장
    
    //소멸자에서 해제
    deinit {
        if let token = token {
            NotificationCenter.default.removeObserver(token)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UITableViewCell, let indexPath = tableView.indexPath(for: cell) {
            if let vc = segue.destination as? DetailViewController {
                vc.memo = DataManager.shared.memoList[indexPath.row]
            }
        }
    }
    

    override func viewDidLoad() { //주로 한번만 실행되는 초기화 코드를 여기에 구현한다.
        super.viewDidLoad()

        
        //ViewDidLoad에서 선언한 Observer은 뷰가 화면에서 사라지기 전에 해제하거나 소멸자에서 해제합니다.
        token = NotificationCenter.default.addObserver(forName: ComposeViewController.newMemoDodInsert, object: nil, queue: OperationQueue.main) {
            [weak self] (noti) in
            self?.tableView.reloadData() //테이블뷰 reload
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    
    // 메모 데이터 수를 return하면 같은 수의 데이터가 표시된다. (데이터를 얼만큼 출력해?)
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return DataManager.shared.memoList.count
    }


    // 가장 중요한 메소드 : 개별셀을 호출할때마다 반복적으로 출력한다. (위의 데이터 수 만큼)
    // cell이라는 상수에 메인 스토리보드에서 선언했던 프로토타입 셀이 생성되어서 저장된다. (데이터를 어떤 디자인으로 출력해?)
    // 몇 번째 cell인지 어떻게 알아? indexPath
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) // 프로토타입 셀 중에서 "cell"이라는 identifier 이름을 가진 셀을 cell에 저장
        
        // 셀이 생성되는 시점에는 비어있다. 그래서 우리가 데이터를 채워 넣어야 함.

        // Configure the cell...
        let target = DataManager.shared.memoList[indexPath.row] //표시할 데이터를 배열에서 가져옴(indexPath.row에 접근하면 몇 번째 셀인지 알 수 있다.)
       
        //실제 데이터를 셀에 추가되어있는 레이블에 표시
        //우리가 사용하는 셀은 subtitle 형식이므로 두 개의 레이블 선언
        cell.textLabel?.text = target.content
        cell.detailTextLabel?.text = formatter.string(for: target.insertDate) //위에 선언한 형식 지정
        
        
        if #available(iOS 11.0, *) {
            cell.detailTextLabel?.textColor = UIColor(named: "MyLabelColor")
        } else {
            cell.detailTextLabel?.textColor = UIColor.lightGray
        }
        

        return cell
    }


    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true //편집기능 활성화
    }

    // 삭제 기능
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let target = DataManager.shared.memoList[indexPath.row] // 몇 번째 배열?
            DataManager.shared.deleteMemo(target)
            //데이터 베이스에서 삭제 후 배열에서도 삭제해야함
            
            DataManager.shared.memoList.remove(at: indexPath.row) // 해당 배열 삭제
            
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
