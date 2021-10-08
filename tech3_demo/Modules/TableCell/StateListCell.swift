//
//  StateListCell.swift
//  tech3_demo
//
//  Created by Clorida on 08/10/21.
//

import UIKit

class StateListCell: UITableViewCell {
    @IBOutlet weak var tableInside: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
