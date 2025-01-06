//
//  ViewController.swift
//  MobileLibrary
//
//  Created by 이재건 on 12/27/24.
//

//
//  ViewController.swift
//  MobileLibrary
//
//  Created by 이재건 on 12/27/24.
//

import UIKit
import SnapKit
import Then
import Alamofire

class SearchVC: UIViewController, UISearchBarDelegate {
    
    //MARK: UI 요소 정의
    private let searchBar = UISearchBar().then {
        $0.placeholder = "검색어를 입력하세요"
        $0.searchBarStyle = .minimal
    }
    
    private let searchResultLabel = UILabel().then {
        $0.text = "검색 결과"
        $0.textAlignment = .left
        $0.font = UIFont.boldSystemFont(ofSize: 30)
        $0.textColor = .black
    }
    
    private let tableView = UITableView().then {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    //TableView 테스트를 위한 Moc데이터
    private let testData: [String] = [
        "이상한 책 1",
        "이상한 책 2",
        "이상한 책 3",
        "이상한 책 4",
        "이상한 책 5",
        "이상한 책 6",
        "이상한 책 7",
        "이상한 책 8",
        "이상한 책 9",
        "이상한 책 10",
        "이상한 책 11",
        "이상한 책 12",
        "이상한 책 13",
        "이상한 책 14",
        "이상한 책 15",
        "이상한 책 16",
        "이상한 책 17",
        "이상한 책 18",
        "이상한 책 19",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    //MARK: UI 설정
    private func configureUI() {
        view.backgroundColor = .white
        
        //MARK: Search Bar
        //Search Bar UI 설정
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        // SearchBar Delegate 설정
        searchBar.delegate = self
        
        //MARK: 검색 결과 Label
        view.addSubview(searchResultLabel)
        searchResultLabel.snp.makeConstraints {
            $0.top.equalTo(searchBar).offset(70)
            $0.leading.trailing.equalToSuperview().offset(30)
        }
        
        //MARK: TableView
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(searchResultLabel.snp.bottom).offset(20)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        tableView.delegate = self
        tableView.dataSource = self
        
        //테이블뷰 하단 사이즈 조절
        if let tabBarHeight = tabBarController?.tabBar.frame.height {
            tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: tabBarHeight, right: 0)
        }
    }
    
    //MARK: 키보드 설정
    //다른 공간 터치시 키보드 사라짐
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    //UISearchBarDelegate 메서드. 리턴 키 누르면 키보드 사라짐
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}

//MARK: UITableView
extension SearchVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let modalVC = ModalVC()
        present(modalVC, animated: true, completion: nil)
    }
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = testData[indexPath.row]
        return cell
    }
}

