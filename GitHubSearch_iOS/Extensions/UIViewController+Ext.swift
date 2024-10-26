//
//  UIViewController+Ext.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 09/10/24.
//

import UIKit
import SafariServices


extension UIViewController{
    
    
    func presentGFAlert(title:String,message:String,buttonTitle:String){
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC, animated: true)
    }
    
    func presentDefaultError(){
            let alertVC = GFAlertVC(title: "Something went wron",
                                    message: "We were unable to complete your request. Please try again",
                                    buttonTitle: "Ok")
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            present(alertVC, animated: true)
    }
    
    func presentSafariVC(with url:URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated: true)
    }
    
    
   
}
