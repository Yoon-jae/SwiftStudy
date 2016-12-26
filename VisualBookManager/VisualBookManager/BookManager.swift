//
//  BookManager.swift
//  BookManager
//
//  Created by yoonjae Cho on 27/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import Foundation

class BookManager {
    var bookList = [Book]()
    
    func addBook(book: Book) {
        bookList += [book]
    }
    
    func getCountBook() -> Int {
        return bookList.count
    }
    
    func showAllBook() -> String {
        var allBookName = ""
        for book in bookList {
            allBookName += "Name : \(book.name)\n"
            allBookName += "Genre : \(book.genre)\n"
            allBookName += "Author : \(book.author)\n"
            allBookName += "--------------------------\n"
        }
        return allBookName
    }
    
    func findBook(_ bookName: String) -> String? {
        var bookInfo = ""
        for book in bookList {
            if book.name == bookName {
                bookInfo += "Name : \(book.name)\n"
                bookInfo += "Genre : \(book.genre)\n"
                bookInfo += "Author : \(book.author)\n"
                return bookInfo
            }
        }
        return nil
    }
    
    func removeBook(_ bookName: String) -> Bool {
        for book in bookList {
            if book.name == bookName {
                let index = (bookList as NSArray).index(of: book)
                bookList.remove(at: index)
                return true
            }
        }
        return false
    }
    
    
}
