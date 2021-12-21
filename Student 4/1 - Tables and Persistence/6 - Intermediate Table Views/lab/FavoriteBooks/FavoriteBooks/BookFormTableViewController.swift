//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Luis Madriz on 10/18/21.
//

import UIKit

class BookFormTableViewController: UITableViewController {

    var book: Book?
    
    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var authorTextField: UITextField!
    
    @IBOutlet var genreTextField: UITextField!
    
    @IBOutlet var lengthTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let book = book else {return}
        
        titleTextField.text = book.title
        authorTextField.text = book.author
        genreTextField.text = book.genre
        lengthTextField.text = book.length
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let title = titleTextField.text,
            let author = authorTextField.text,
            let genre = genreTextField.text,
            let length = lengthTextField.text else {return}
        
        book = Book(title: title, author: author, genre: genre, length: length)
        performSegue(withIdentifier: "UnwindToBookTable", sender: self)    }
    
    
    
    
    

   

}
