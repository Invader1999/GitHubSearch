//
//  UITableView+Ext.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 23/10/24.
//

import UIKit


extension UITableView{
    
    func reloadDataOnMainThread(){
        DispatchQueue.main.async {
            self.reloadData()
        }
    }
    
    
    func removeExcessCells(){
        tableFooterView = UIView(frame: .zero)
    }
}
