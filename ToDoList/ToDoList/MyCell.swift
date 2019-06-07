//
//  MyCell.swift
//  ToDoList
//
//  Created by Grisha Okin on 07/06/2019.
//  Copyright © 2019 Grisha Okin. All rights reserved.
//

import UIKit
import M13Checkbox

protocol MyCellTableViewControllerDelegate{
	func cellButtonTapped(cell: MyCell)
}

class MyCell: UITableViewCell{

	@IBOutlet weak var todoText: UILabel!
	@IBOutlet weak var checkBox: M13Checkbox!
	var indexPath: IndexPath!
	var delegate: MyCellTableViewControllerDelegate!
	
	@IBAction func buttonTapped(sender: AnyObject) {
		delegate?.cellButtonTapped(cell: self)
	}
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		//checkBox.boxType = M13Checkbox.BoxType.square
		//checkBox.secondaryTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
		//checkBox.stateChangeAnimation = M13Checkbox.Animation.bounce(.fill)
		
    }
	
	override func didMoveToSuperview() {
		super.didMoveToSuperview()
		checkBox.boxType = M13Checkbox.BoxType.square
		checkBox.secondaryTintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
		checkBox.stateChangeAnimation = M13Checkbox.Animation.bounce(.fill)
	}
	
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
		
        // Configure the view for the selected state
    }


}


