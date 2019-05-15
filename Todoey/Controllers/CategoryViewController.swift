//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Jan Biernacki on 14/05/2019.
//  Copyright © 2019 Jan Biernacki. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {
    
    let realm = try! Realm()
    
    var categoryArray: Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    //MARK: - Data manipulation Methods
    func saveCategories(category: Category){
        do{
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving \(error)")
        }
        tableView.reloadData()
    }
    
    func loadCategories(){
        categoryArray = realm.objects(Category.self)
        tableView.reloadData()
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let category = categoryArray?[indexPath.row]
        
        cell.textLabel?.text = category?.name ?? "No categories added"
        
        return cell
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ToDoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray?[indexPath.row]
        }
    }
    
    
    //MARK: - Add New Categories
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            //what will happen when clicked add
            let newCategory = Category()
            newCategory.name = textField.text!
            self.saveCategories(category: newCategory)
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new category "
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
}
