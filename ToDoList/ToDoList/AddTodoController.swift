//
//  AddTodoController.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import UIKit

class AddTodoController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {

	// Решил использовать в качестве селектора UIPickerView, а не как сказано в пункте 5, для удобвства.
	
	var data:[Category]?
	
	@IBOutlet weak var text: UITextField!
	@IBOutlet weak var addButton: UIBarButtonItem!
	@IBOutlet weak var cancelButtom: UIBarButtonItem!
	@IBOutlet weak var categorys: UIPickerView!
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if case segue.identifier = "cancel"{
			let distVC = segue.destination as! UINavigationController
			let slideVC = distVC.topViewController as! TodosController
			slideVC.data = data!;
		}
		
		if case segue.identifier = "create"{
			guard let text = text.text else { return }
			guard let id = data?[categorys.selectedRow(inComponent: 0)].id else { return }
			Net.addData(param: ["todo":["text":text,"todo_id": id]])
		}
	}
	
	override func didReceiveMemoryWarning(){
		super.didReceiveMemoryWarning()
	}
	
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		guard let count = data?.count else { return 0 }
		return count
	}
	
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		guard let title = data?[row].title else { return "nil" }
		return title
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.categorys.delegate = self
		self.categorys.dataSource = self
	}

	

}
