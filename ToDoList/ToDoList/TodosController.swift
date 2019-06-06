//
//  TodosControllerTableViewController.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import UIKit
import M13Checkbox


class TodosController: UITableViewController {
	
	
	
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
	
	
	
	var data = [Category(id: 1, title: "Home", todos: [Todo(id: 1, text: "Попить чаю",status: true, projectId: 1), Todo(id: 3, text: "Помыть посуду",status: false, projectId: 1)]),Category(id: 2, title: "Работа", todos: [Todo(id: 2, text: "Поработать",status: false, projectId: 2)])]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 40
	}
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return data.count
    }
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return data[section].todos!.count
	}
	// обработчик нажатий
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "todo", for: indexPath)
		let label = UILabel(frame: CGRect(x: 45, y:0.0, width: 300, height: 40))
		label.text = data[indexPath.section].todos![indexPath.row].text
		let checkbox = M13Checkbox(frame: CGRect(x: 8, y: 8, width: 24, height: 24))
		checkbox.boxType = M13Checkbox.BoxType.square
		if data[indexPath.section].todos![indexPath.row].isCompleted {
			checkbox.setCheckState(.checked, animated: true)
		}
		checkbox.secondaryTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
		checkbox.stateChangeAnimation = M13Checkbox.Animation.bounce(.fill)
		cell.addSubview(label)
		cell.addSubview(checkbox)
        return cell
		
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
