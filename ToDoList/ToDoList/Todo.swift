//
//  Todo.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import Foundation

struct Todo {
	
	var id: Int?
	var text: String
	var isCompleted: Bool
	var projectId:Int
	
	var description: String{
		get{
			return "id: \(String(describing: id)) text: \(text) project id: \(projectId)"
		}
	}
	
	init(text: String, projectId:Int) {
		self.text = text
		self.projectId = projectId
		isCompleted = false
	}
	
	init(id: Int, text: String, status:Bool,  projectId: Int) {
		self.id = id
		self.text = text
		self.projectId = projectId
		self.isCompleted = status
	}
	
}
