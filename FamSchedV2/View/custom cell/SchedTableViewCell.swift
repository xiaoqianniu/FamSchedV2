//
//  SchedTableViewCell.swift
//  FamSchedV2
//
//  Created by Hongbo Niu on 2018-04-26.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class SchedTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var things: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    
    
    func ScheduleCellInit(famName:String,dates:String,whatThing:String){
        name.text = famName
        date.text = dates
        things.text = whatThing
        
    }
    
}
