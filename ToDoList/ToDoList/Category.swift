//
//  Category.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import Foundation

struct Category {
	var id: Int
	var title: String
	var todos:[Todo]?
	
	var description: String{
		get{
			return "id: \(id) title: \(title) count Todos: \(String(describing: todos?.count))"
		}
	}
	
	init(id:Int, title: String, todos:[Todo]) {
		self.id = id
		self.title = title
		self.todos = todos
	}
	
}
