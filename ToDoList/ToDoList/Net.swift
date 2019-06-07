//
//  Net.swift
//  ToDoList
//
//  Created by Grisha Okin on 06/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Alamofire_SwiftyJSON

class Net {
	
	static func loadData(callback: @escaping (JSON?)->Void){
		let url = "https://ancient-bayou-98389.herokuapp.com/projects.json"
		guard let URL = URL(string: url) else { return  print("URL error") }
		
		Alamofire.request(URL, method:.get).responseSwiftyJSON(completionHandler: {response in
			switch response.result{
			case .success(let data):
				let json = JSON(data)
				callback(json)
//				print(json)
			case .failure(_):
				if let data = response.data {
					print("Server Error: " + String(data: data, encoding: String.Encoding.utf8)!)
				}
				callback(nil)
			}
		})
	}
	
	static func addData(param: Parameters){
		let url = "https://ancient-bayou-98389.herokuapp.com/todos"
		guard let URL = URL(string: url) else { return  print("URL error") }
		Alamofire.request(URL, method: .post, parameters: param)
	}
	
	static func updateData(param: [String : Int]){

		guard let id = param["id"] else { return }
		let url = "https://ancient-bayou-98389.herokuapp.com/todos/" + String(id)
		guard let URL = URL(string: url) else { return print("URL error") }
		Alamofire.request(URL, method: .put, parameters: ["id": id])
		
	}
	
}
