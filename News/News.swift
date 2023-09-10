//
//  News.swift
//  News
//
//  Created by Alex Paul on 9/1/23.
//

import Foundation



struct News: Codable {
    let articles: [Articles]
}

struct Articles: Codable {
    let title: String?
    let description: String?
 }

