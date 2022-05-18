//
//  StoryListViewTableViewCell.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation
import UIKit

//struct StoryListTableViewCellModel {
//    let storyImage: UIImage
//    let storyTitle: String
//    let storyAuthor: String
//}

final class StoryListTableViewCell: UITableViewCell {

    private let titleLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let authorLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    private let storyImage : UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .blue
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(storyImage)
        
        storyImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        titleLabel.anchor(top: topAnchor, left: storyImage.rightAnchor, bottom: nil, right: nil, paddingTop: 20, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        authorLabel.anchor(top: titleLabel.bottomAnchor, left: storyImage.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width, height: 0, enableInsets: false)
        
        
        
        
//        let stackView = UIStackView(arrangedSubviews: [decreaseButton,productQuantity,increaseButton])
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        addSubview(stackView)
//        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup(with story: StoryList.Something.ViewModel.DisplayedStory) {
        authorLabel.text = story.author
        titleLabel.text = story.title
    }
    
    
}


