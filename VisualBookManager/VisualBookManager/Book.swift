//
//  Book.swift
//  BookManager
//
//  Created by yoonjae Cho on 27/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import Foundation

class Book {
    var name = ""
    var genre = ""
    var author = ""

    func printBook() {
        print("Name : \(name)")
        print("Genre : \(genre)")
        print("Author : \(author)")
    }
}
