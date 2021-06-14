//
//  TableDataViewCell.swift
//  CRUDApplicationCoreData
//
//  Created by LARHCHIM ISMAIL on 6/13/21.
//  Copyright © 2021 LARHCHIM ISMAIL. All rights reserved.
//

import UIKit

class TableDataViewCell: UITableViewCell {

    @IBOutlet weak var lblnom: UILabel!
    
    
    @IBOutlet weak var lblprenom: UILabel!
    
    
    @IBOutlet weak var lblmodule: UILabel!
    
    
    @IBOutlet weak var lblnote: UILabel!
    
    
    @IBOutlet weak var lblimage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func dataEntry(name:String,prenom:String,module:String,note:Float,image:UIImage){
        
        lblnom.text = name
        lblprenom.text = prenom
        lblmodule.text = module
        lblnote.text = String(note)
        lblimage.image = image
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
