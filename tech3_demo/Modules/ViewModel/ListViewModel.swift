//
//  ListViewModel.swift
//  tech3_demo
//
//  Created by Clorida on 08/10/21.
//

import UIKit
let cellIdentifier = "stateCell"
let cellIdentifier1 = "cityCell"
class ListViewModel: NSObject {
    var viewController: UIViewController?
    var stateData = [State]()
    var cityData = [City]()
    var placeData = [Place]()
    var selRow = false
    var selRowIn = false
    var selIndex = 0
    var selIndexIn = 0
    var rowHeight: CGFloat?
    init(viewCtrl: UIViewController) {
        self.viewController = viewCtrl
    }
    /// Method for update data
    func updateData()  {
        stateData.append(State(StateName: "Tamil Nadu", City: [City(CityName: "Chennai", Place: [Place(PlaceName: "Anna Salai"),Place(PlaceName: "T Nagar"),Place(PlaceName: "Nungambakkam")]),City(CityName: "Vellore", Place: [Place(PlaceName: "Ambur"), Place(PlaceName: "Tirupathur")])]))
        
        stateData.append(State(StateName: "Kerala", City: [City(CityName: "Malapurram", Place: [Place(PlaceName: "Arimbra"),Place(PlaceName: "Kadalundi")]),City(CityName: "Trissur", Place: [Place(PlaceName: "Attoor"), Place(PlaceName: "Elinjipra")])]))
        
        stateData.append(State(StateName: "Karnataka", City: [City(CityName: "Bangalore", Place: [Place(PlaceName: "Marathahalli"),Place(PlaceName: "jayanagara")]),City(CityName: "Bagalkot", Place: [Place(PlaceName: "Pattadakal"), Place(PlaceName: "Badami")])]))
    }
}
// MARK: - UITableViewDataSource && UITableViewDelegate
extension ListViewModel: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView.tag == 99{
            return stateData.count
        }else{
            return cityData.count
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView.tag == 99{
            if(selRow && selIndex == section){
                return 1
            }
            return 0
        }else{
            if(selRowIn && selIndexIn == section){
                return placeData.count
            }
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView.tag == 99{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? StateListCell
            cell?.tableInside.delegate = self
            cell?.tableInside.dataSource = self
            cell?.tableInside.reloadData()
            rowHeight = cell?.tableInside.contentSize.height
            return cell!
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier1) as? CityListCell
            cell?.data = placeData[indexPath.row]
            return cell!
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView.tag == 99{
            return rowHeight!
        }else{
            return 40
        }
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView.tag == 99 {
            let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            view.backgroundColor = #colorLiteral(red: 0.9438326359, green: 0.9905000329, blue: 1, alpha: 1)
            // Title
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: view.frame.width-40, height: view.frame.height-10)
            label.text = stateData[section].StateName
            view.addSubview(label)
            // Arrow Image
            let img = UIImageView()
            img.frame = CGRect.init(x: view.frame.width-40, y: 15, width: 20, height: 20)
            if selRow && selIndex == section{
                img.image = UIImage(named: "down-arrow")
            }else{
                img.image = UIImage(named: "arrow")
            }
            view.addSubview(img)
            let btn = UIButton()
            btn.frame = view.frame
            btn.addTarget(self, action: #selector(onStateTap(_:)), for: .touchUpInside)
            btn.tag = section
            view.addSubview(btn)
            return view
        }else{
            let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            // Title
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: view.frame.width-10, height: view.frame.height-10)
            label.text = cityData[section].CityName
            label.textColor = .red
            view.addSubview(label)
            let img = UIImageView()
            // Arrow Image
            img.frame = CGRect.init(x: view.frame.width-40, y: 15, width: 20, height: 20)
            if selRowIn && selIndexIn == section{
                img.image = UIImage(named: "down-arrow")
            }else{
                img.image = UIImage(named: "arrow")
            }
            view.addSubview(img)
            let btn = UIButton()
            btn.frame = view.frame
            btn.addTarget(self, action: #selector(onCityTap(_:)), for: .touchUpInside)
            btn.tag=section
            view.addSubview(btn)
            return view
        }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    /// Method for collapse Outer TableView Cell
    @objc func onStateTap(_ sender: UIButton) -> () {
        if (selIndex == sender.tag && selRow){
            selRow = false
        }else{
            selRow = true
        }
        selIndex = sender.tag
        self.cityData = self.stateData[sender.tag].City
        self.viewController?.reloadViews()
    }
    /// Method for collapse Inner TableView cell
    @objc func onCityTap(_ sender: UIButton) -> () {
        if (selIndexIn == sender.tag && selRowIn){
            selRowIn = false
        }else{
            selRowIn = true
        }
        selIndexIn = sender.tag
        self.placeData = self.cityData[sender.tag].Place
        self.viewController?.reloadViews()
    }
}
