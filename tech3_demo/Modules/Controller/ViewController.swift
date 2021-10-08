//
//  ViewController.swift
//  tech3_demo
//
//  Created by Clorida on 08/10/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableMain: UITableView!
    var viewModel: ListViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModelUpdate()
        updateDelegates()
    }
    override func reloadViews(){
        self.tableMain.reloadData()
    }
}
extension ViewController {
    /// Method for link VC with VM
    func viewModelUpdate(){
        viewModel = ListViewModel(viewCtrl: self)
        self.viewModel?.updateData()
    }
    /// Methodfor update table delegate and datasource
    func updateDelegates(){
        self.tableMain.dataSource = viewModel
        self.tableMain.delegate = viewModel
    }
}






