//
//  InstrinsicTableView.swift
//  MobileDay2019
//
//  Created by Trung Phan on 6/1/19.
//  Copyright © 2019 Dwarvesf. All rights reserved.
//

import Foundation
import UIKit

class IntrinsicTableView: UITableView {
    var didUpdateHeight: (()->())?
    
    override var contentSize:CGSize {
        didSet {
            self.invalidateIntrinsicContentSize()
            guard let didUpdateHeight = didUpdateHeight else {return}
            didUpdateHeight()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        self.layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
    
}

