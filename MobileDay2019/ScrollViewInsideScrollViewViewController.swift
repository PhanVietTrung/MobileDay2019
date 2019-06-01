//
//  ScrollViewInsideScrollViewViewController.swift
//  MobileDay2019
//
//  Created by Trung Phan on 6/1/19.
//  Copyright © 2019 Dwarvesf. All rights reserved.
//

import UIKit

typealias CellData = (title: String, data: [String])

class ScrollViewInsideScrollViewViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    //MARK:- Variables
    var datasource:[CellData] = [CellData(title: "First Cell",data: ["0", "1", "2"]), CellData(title: "Second Cell",data: ["0", "1"])]
    
    //MARK: - ViewController Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
}

//MARK: - UITableView Datasource
extension ScrollViewInsideScrollViewViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ScrollViewTableViewCell") as? ScrollViewTableViewCell else {return UITableViewCell()}
        
        var cellData = datasource[indexPath.row]
        cell.cellData = cellData
        
        cell.didAddNewItem = { [weak self, weak cell] in
            cellData.data = cellData.data + [String(cellData.data.count)]
            cell?.cellData = cellData
            
            self?.datasource[indexPath.row] = cellData
        }
        
        cell.didChangeContentHeigh = {  [weak self] in
            guard let strongSelf = self else {return}
            strongSelf.tableView.beginUpdates()
            strongSelf.tableView.endUpdates()
        }
        return cell
    }
    
    
}
