//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [Item]()
    
//    let defaults = UserDefaults.standard
    
    // UserDefaults 대신 own plist file를 만든다. in dataFilePath
    // DocumentDirectory에 Documents folder 파일경로 만들고 + add a path component
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Item.plist")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(dataFilePath)
        
        // 하드코드로 쓰여진 아이템은 이미 Item.plist에 저장되었기 때문에 계속 초기화할 필요 없으므로 지워도 됨
//        let newItem1 = Item()
//        newItem1.title = "Find Mike"
//        itemArray.append(newItem1)
//
//        let newItem2 = Item()
//        newItem2.title = "Buy Eggos"
//        itemArray.append(newItem2)
//
//        let newItem3 = Item()
//        newItem3.title = "Destroy Demogorgon"
//        itemArray.append(newItem3)
        
        // UserDefaults에 저장된 값을 불러오기
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
        
        // Item.plist 불러오기
        loadItems()
        
    }
    
    // MARK - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // tableview가 처음 load 될때 cellForRowAt를 call
        
        print("cellForRowAt called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // 셀 우측에 체크마크 - 체크 or 해제
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    
    }
    
    // MARK - TableView Deletegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
//        tableView.reloadData() // cellForRowAt를 다시 call
        
        // 선택 후 셀 하이라이트 사라지게
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    //MARK - Add New Item

    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // alert 창의 Add Item 버튼을 눌렀을 때
        
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            // UserDefaults 파일에 value 저장 (plist에 저장), key는 값을 불러올 때 필요!
//            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    // MARK - Model Manupulation Methods
    
    func saveItems() {
        // encoder가 itemArray(데이터)를 property list로 encode
        // encode와 write는 오류를 던지는 메서드
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        
        self.tableView.reloadData()
    }
    
    func loadItems() {
        // Data(contentsOf: )는 오류를 던지는 메소드
        // 메소드의 결과가 옵셔널이니까 안전하게 unwrap하기 위해 옵셔널 바인딩
        if let data = try? Data(contentsOf: dataFilePath!) {
            let decoder = PropertyListDecoder()
            // decode될 것의 데이터 타입이 무엇인지 명시해주어야 한다 - Swift가 확실히 추론을 못하기 때문
            do {
                itemArray = try decoder.decode([Item].self, from: data)
            } catch {
                print("Error decoding item array, \(error)")
            }
        }
    }
}

