//
//  Untitled.swift
//  MobileLibrary
//
//  Created by 이재건 on 1/6/25.
//

import UIKit
import SnapKit
import Then

final class TapBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Search 뷰 컨트롤러 생성
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 0)
        
        // AddList 뷰 컨트롤러 생성
        let addListVC = AddListVC()
        addListVC.tabBarItem = UITabBarItem(title: "AddList", image: UIImage(systemName: "book"), tag: 1)
        
        // 탭 바 컨트롤러에 뷰 컨트롤러 배열 추가
        viewControllers = [searchVC, addListVC]
    }
    
}
