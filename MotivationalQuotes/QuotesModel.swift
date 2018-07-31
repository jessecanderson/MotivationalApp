//
//  QuotesModel.swift
//  MotivationalQuotes
//
//  Created by Jesse Anderson on 7/30/18.
//  Copyright © 2018 Jesse Anderson. All rights reserved.
//

import Foundation

struct QuoteResponse: Codable {
    let success: Success?
    let contents: Contents?

}

struct Success: Codable {
    let total: Int?
}

struct Contents: Codable {
    let quotes: [Quotes]?
    let copyright: String?
}

struct Quotes: Codable {
    let quote: String?
    let length: String?
    let author: String?
    let tags: [String]?
    let category: String?
    let date: String?
    let permalink: String?
    let title: String?
    let background: String?
    let id: String?
}


