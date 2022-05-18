//
//  StoryListViewTableViewCell.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation
import UIKit
import SDWebImage
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
        //TODO: Provide image placeholder
        let imgView = UIImageView()
//        imgView.backgroundColor = .blue
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
        imgView.layer.cornerRadius = 15
//        imgView.image = UIImage(named: "download")
        imgView.sd_imageTransition = .fade
        return imgView
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(titleLabel)
        addSubview(authorLabel)
        addSubview(storyImage)
        #imageLiteral(resourceName: "download.png")
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
        guard let image = story.image else { return }
//        storyImage.load(url: image)
        storyImage.sd_setImage(with: image, placeholderImage: UIImage(named: "download"))
    }
    
    
}

//TODO: Replace

//extension UIImageView {
//    func load(url: URL) {
//        DispatchQueue.global().async { [weak self] in
//            if let data = try? Data(contentsOf: url) {
//                if let image = UIImage(data: data) {
//                    DispatchQueue.main.async {
//                        self?.setImage(image, animated: true)
////                        self?.image = image
//                    }
//                }
//            }
//        }
//    }
//}
//
//extension UIImageView{
//    func setImage(_ image: UIImage?, animated: Bool = true) {
//        let duration = animated ? 0.3 : 0.0
//        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
//            self.image = image
//        }, completion: nil)
//    }
//}
//
