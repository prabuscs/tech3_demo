//
//  CityListCell.swift
//  tech3_demo
//
//  Created by Clorida on 08/10/21.
//

import UIKit

class CityListCell: UITableViewCell {
    @IBOutlet weak var lbl: UILabel?
    var data: Place?{
        didSet{
            setUpData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    /// Method for set data in cell 
    func setUpData() {
        lbl?.text = data?.PlaceName
    }
}
