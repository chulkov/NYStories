//
//  StoryListViewTableViewCell.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation
import UIKit
import SDWebImage

final class StoryListTableViewCell: UITableViewCell {

    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.setContentHuggingPriority(.required, for: .vertical)
        return lbl
    }()
    
    private let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 12)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let storyImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 15
        imgView.sd_imageTransition = .fade
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let padding = 10.0
    
    func setup(with story: StoryList.Something.ViewModel.DisplayedStory) {
        authorLabel.text = story.author
        titleLabel.text = story.title
        guard let image = story.image else { return }
        storyImage.sd_setImage(with: image, placeholderImage: UIImage(named: "download"))
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(storyImage)
        
        storyImage.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        storyImage.leftAnchor.constraint(equalTo: leftAnchor, constant: padding).isActive = true
        storyImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding).isActive = true
        storyImage.widthAnchor.constraint(equalTo: storyImage.heightAnchor).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: padding).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: storyImage.rightAnchor, constant: padding).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
        
        authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: storyImage.rightAnchor, constant: padding).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding).isActive = true
        authorLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding/2).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
