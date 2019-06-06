//
//  AddTodoController.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import UIKit

class AddTodoController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	
	var data:[Category]?
	
	@IBOutlet weak var text: UITextField!
	@IBOutlet weak var addButton: UIBarButtonItem!
	@IBOutlet weak var cancelButtom: UIBarButtonItem!
	@IBOutlet weak var categorys: UIPickerView!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if case segue.identifier = "cancel"{
			let distVC: TodosController = segue.destination as! TodosController
			distVC.data = data!;
		}
		if case segue.identifier = "create"{
			let distVC: TodosController = segue.destination as! TodosController
			distVC.data = data!;
		}
	}
	
	
	@IBAction func cancel(_ sender: UIBarButtonItem) {
		performSegue(withIdentifier: "cancel", sender: self)
	}
	
	@IBAction func add(_ sender: UIBarButtonItem) {
		guard let text = text.text else { return  }
		
		data![categorys.selectedRow(inComponent: 0)].todos!.append(Todo(text: text, projectId: data![categorys.selectedRow(inComponent: 0)].id))
		performSegue(withIdentifier: "create", sender: self)
	}
	
	override func didReceiveMemoryWarning(){
		super.didReceiveMemoryWarning()
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return data!.count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return data![row].title
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.categorys.delegate = self
		self.categorys.dataSource = self
	}

	

}
