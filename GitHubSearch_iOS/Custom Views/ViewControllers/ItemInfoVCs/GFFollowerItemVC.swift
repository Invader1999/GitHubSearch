//
//  GFFollowerVC.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 16/10/24.
//

import UIKit

protocol GFFollowerVCDelegate:AnyObject{
    func didTapGetFollowers(for user:User)
}

class GFFollowerItemVC: GFItemInfoVC {
    
    weak var delegate:GFFollowerVCDelegate!
    
    init(user:User ,delegate: GFFollowerVCDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()

       
    }
    
    private func configureItems(){
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(color: .systemGreen, title: "Get Followers", systemImageName: "person.3")
    }

    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
