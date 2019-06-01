//
//  ScrollViewTableViewCell.swift
//  MobileDay2019
//
//  Created by Trung Phan on 6/1/19.
//  Copyright © 2019 Dwarvesf. All rights reserved.
//

import UIKit

class ScrollViewTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var tableView: IntrinsicTableView!
    @IBOutlet weak var lblHeader: UILabel!
    
    var cellData: CellData? {
        didSet {
            guard let cellData =  cellData else { return }
            lblHeader.text = cellData.title
            dataSource = cellData.data
            tableView.reloadData()
        }
    }
    var dataSource:[String] = []
    
    //MARK: - Variables
    var didAddNewItem:(()->())?
    var didChangeContentHeigh: (()->())?

    //MARK: - View Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.dataSource = self
        tableView.didUpdateHeight = {[weak self] in
            if let didChangeContentHeigh = self?.didChangeContentHeigh {
                didChangeContentHeigh()
            }
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Methods
    
    @IBAction func btnAddPressed(_ sender: Any) {
        guard let didAddNewItem = didAddNewItem  else {
            return
        }
        didAddNewItem()
    }
    
}

extension ScrollViewTableViewCell: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellID") else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = dataSource[indexPath.row]
        
        return cell
    }
    
    
}
