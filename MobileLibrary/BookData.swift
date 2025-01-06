//
//  BookData.swift
//  MobileLibrary
//
//  Created by 이재건 on 1/6/25.
//

import Foundation

struct BookData: Codable {
    let name: [SearchBookName]
    let Total: [TotalInfo]
}

struct SearchBookName: Codable {
    let title: String
}

struct TotalInfo: Codable {
    let title: String
    let authors: String
    let contents: String
    let thumbnail: String
}
