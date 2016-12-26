//
//  ViewController.swift
//  VisualBookManager
//
//  Created by yoonjae Cho on 27/12/2016.
//  Copyright © 2016 yoonjae Cho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let bookManager = BookManager()
    
    @IBOutlet var resultTextView:UITextView!
    @IBOutlet var nameTextField:UITextField!
    @IBOutlet var genreTextField:UITextField!
    @IBOutlet var authorTextField:UITextField!
    @IBOutlet var bookCountLabel:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let book1 = Book()
        book1.name = "햄릿"
        book1.genre = "비극"
        book1.author = "셰익스피어"
        
        let book2 = Book()
        book2.name = "누구를 위하여 종을 울리나"
        book2.genre = "전쟁소설"
        book2.author = "헤밍웨이"
        
        let book3 = Book()
        book3.name = "죄와 벌"
        book3.genre = "사실주의"
        book3.author = "톨스토이"
        
        bookManager.addBook(book: book1)
        bookManager.addBook(book: book2)
        bookManager.addBook(book: book3)
        
        bookCountLabel.text = "\(bookManager.getCountBook())"
    }
    
    @IBAction func showAllBookAction(_ sender:AnyObject) {
        if(bookManager.getCountBook() == 0) {
            resultTextView.text = "There is no book in here"
        } else {
            resultTextView.text = bookManager.showAllBook()
        }
    }
    
    @IBAction func addBookAction(_ sender:AnyObject) {
        let newBook = Book()
        newBook.name = nameTextField.text!
        newBook.genre = genreTextField.text!
        newBook.author = authorTextField.text!
        bookManager.addBook(book: newBook)
        resultTextView.text = "\(nameTextField.text!) 책이 등록되었습니다."
        nameTextField.text = ""
        genreTextField.text = ""
        authorTextField.text = ""
        bookCountLabel.text = "\(bookManager.getCountBook())"
    }
    
    @IBAction func findBookAction(_ sender:AnyObject) {
        let resultBook = bookManager.findBook(nameTextField.text!)
        if resultBook != nil {
            resultTextView.text = resultBook
        } else {
            resultTextView.text = "There is no book named \(nameTextField.text!)"
        }
    }
    
    @IBAction func removeBookAction(_ sender:AnyObject) {
        let deletedBook = bookManager.removeBook(nameTextField.text!)
        if deletedBook {
            resultTextView.text = "\(nameTextField.text!) is deleted successfully"
        } else {
            resultTextView.text = "There is no book named \(nameTextField.text!)"
        }
        bookCountLabel.text = "\(bookManager.getCountBook())"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

