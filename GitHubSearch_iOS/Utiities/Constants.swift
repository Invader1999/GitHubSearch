//
//  Constants.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 15/10/24.
//

import Foundation
import UIKit

enum SFSymbols{
    static let location = UIImage(systemName: "mappin.and.ellipse")
    static let repos = UIImage(systemName:"folder")
    static let gists = UIImage(systemName:"text.alignleft")
    static let followers = UIImage(systemName:"heart")
    static let following = UIImage(systemName:"person.2")
}

enum Images{
    static let placeholder = UIImage(named: "avatar-placeholder")
    static let ghLogo = UIImage(named: "gh-logo")
    static let emptyStateLogo = UIImage(named: "empty-state-logo")
}

enum ScreenSize {
    static let width     = UIScreen.main.bounds.size.width
    static let height    = UIScreen.main.bounds.size.height
    static let maxLength = max(ScreenSize.width, ScreenSize.height)
    static let minLength = min(ScreenSize.width, ScreenSize.height)
}


enum DeviceTypes {
    static let idom        = UIDevice.current.userInterfaceIdiom
    static let nativeScale = UIScreen.main.nativeScale
    static let scale       = UIScreen.main.scale
    
    static let isiPhoneSE            = idom == .phone && ScreenSize.maxLength == 568.0
    static let isiPhone8Standard     = idom == .phone && ScreenSize.maxLength == 667 && nativeScale == scale
    static let isiPhone8Zoomed       = idom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
    static let isiPhone8PlusStandard = idom == .phone && ScreenSize.maxLength == 736.0
    static let isiPhone8PlusZoomed   = idom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
    static let isiPhoneX             = idom == .phone && ScreenSize.maxLength == 812.0
    static let isiPhoneXssMaxAndXr   = idom == .phone && ScreenSize.maxLength == 896.0
    static let isiPad                = idom == .pad && ScreenSize.maxLength >= 1024.0
    
    
    static func isiPhoneXAspectRatio() ->Bool{
        return isiPhoneX || isiPhoneXssMaxAndXr
    }
    
}
