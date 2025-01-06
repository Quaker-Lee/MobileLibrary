//
//  ViewController.swift
//  MobileLibrary
//
//  Created by 이재건 on 12/27/24.
//

import UIKit
import SnapKit
import Then

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
    
    private let tableView = UITableView()
    
    
    
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

extension SearchVC: UITableViewDelegate {
    
}

extension SearchVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
}
