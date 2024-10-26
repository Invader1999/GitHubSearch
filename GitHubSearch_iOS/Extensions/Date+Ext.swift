//
//  Date+Ext.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 17/10/24.
//

import Foundation

extension Date{
    
//    func convertToMonthYearFormat()->String{
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM yyyy"
//        return dateFormatter.string(from: self)
//    }
    
    func convertToMonthYearFormat()->String{
        return formatted(.dateTime.month().year())
    }
}
