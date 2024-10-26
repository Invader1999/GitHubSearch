//
//  GFAvatarImageView.swift
//  GitHubSearch_iOS
//
//  Created by Hemanth Reddy Kareddy on 10/10/24.
//

import UIKit

class GFAvatarImageView: UIImageView {
    var cache = NetworkManager.shared.cache
    let placeholderImage = Images.placeholder
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configure(){
        layer.cornerRadius = 10
        clipsToBounds = true
        image = placeholderImage
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    
    func downloadImage(fromURL url: String){
        Task{image = await NetworkManager.shared.donwloadImage(from: url) ?? placeholderImage}
    }
    
}
