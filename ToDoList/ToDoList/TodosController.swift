//
//  TodosControllerTableViewController.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import UIKit
import M13Checkbox
import SwiftyJSON


class TodosController: UITableViewController, MyCellTableViewControllerDelegate {
	
	func cellButtonTapped(cell: MyCell) {
//		let section = tableView.indexPath(for: cell)!.section
	
		guard let section = tableView.indexPath(for: cell)?.section else { return }
		guard let row = tableView.indexPath(for: cell)?.row else { return  }
		guard let id  = data![section].todos![row].id else { return }
		Net.updateData(param: ["id": id])
	}
	
	
	
	
	var data: [Category]?
	
	@IBAction func create(_ sender: UIBarButtonItem) {
		performSegue(withIdentifier: "add", sender: self)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if case segue.identifier = "add"{
			let distVC = segue.destination as! UINavigationController
			let slideVC = distVC.topViewController as! AddTodoController
			slideVC.data = data;
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.tableView.delegate = self
		self.tableView.dataSource = self
		Net.loadData(callback: parsing(_:))
    }
	
	func parsing(_ distJson: JSON?){
		guard let json = distJson else { print("empty Json"); return }
		var parsingData: [Category] = []
		let categorys = json.arrayValue
		for category in categorys{
			
			let id = category["id"].intValue
			let title = category["title"].stringValue
			var todos: [Todo] = []
			for todo in category["todos"].arrayValue{
				let id = todo["id"].intValue
				let text = todo["text"].stringValue
				let projectdId = todo["project_id"].intValue
				let status = todo["isCompleted"].boolValue
				todos.append(Todo(id: id, text: text, status: status, projectId: projectdId))
			}
			parsingData.append(Category(id: id, title: title, todos: todos))
		}
		self.data = parsingData
		self.tableView.reloadData()
	}
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let myData = data else {
			print("empty data")
			let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! MyCell
			return cell
		}
		let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath) as! MyCell
		cell.delegate = self
		
		cell.todoText.text = myData[indexPath.section].todos![indexPath.row].text
		let checkState = myData[indexPath.section].todos![indexPath.row].isCompleted ? M13Checkbox.CheckState.checked : .unchecked
		cell.checkBox.setCheckState(checkState, animated: false)
        return cell
    }
	
}
extension TodosController{
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		guard let title = data?[section].title else { return "nill" }
		return title
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 40
	}
	override func numberOfSections(in tableView: UITableView) -> Int {
		guard let myData = data else { return 0 }
		return myData.count
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		guard let myData = data else { return 0 }
		guard let count = myData[section].todos?.count else { return 0 }
		return count
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
}
