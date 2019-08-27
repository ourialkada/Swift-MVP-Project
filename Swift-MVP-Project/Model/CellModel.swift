//
//  TableViewTableViewCell.swift
//
//
//  Created by Ouri -Live Care on 4/23/19.
//

import Foundation
import UIKit

class CellModel: UITableViewCell {
 
    
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var Description: UILabel!
    
    var id:String = ""
    var type:String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCell (list: TableList)
    {
    title.text = list.title
    Description.text = list.description
    image2.image = list.image
    }
}
