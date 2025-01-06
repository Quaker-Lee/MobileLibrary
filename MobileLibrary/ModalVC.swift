//
//  ModalVC.swift
//  MobileLibrary
//
//  Created by 이재건 on 1/6/25.
//

import UIKit
import SnapKit
import Then

import UIKit

class ModalVC: UIViewController {
    
    private let label = UILabel().then {
        $0.text = "상세 정보"
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 24)
        $0.textColor = .black
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
    
    private func configureUI() {
        view.addSubview(label)
        label.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}
