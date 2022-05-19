//
//  StoryDetailView.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation
import UIKit
import SDWebImage

protocol StoryDetailViewProtocol: AnyObject {
    func seeMoreAction()
}

final class StoryDetailView: UIView {
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 36)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.required, for: .vertical)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let descriptionLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.required, for: .vertical)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let authorLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private let storyImage: UIImageView = {
        let imgView = UIImageView()
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "download")
        imgView.sd_imageTransition = .fade
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private let seeMoreButton: UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .clear
        btn.contentHorizontalAlignment = .left
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.blue,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        let attributeString = NSMutableAttributedString(
           string: "See more",
           attributes: yourAttributes
        )
        btn.setAttributedTitle(attributeString, for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(nil, action: #selector(buttonAction), for: .touchUpInside)
        return btn
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    let scrollViewContainer: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    weak var delegate: StoryDetailViewProtocol?
    private let leftPadding = 15.0
    private let topPadding = 10.0
    
    func setup(with displayedStory: StoryList.Something.ViewModel.DisplayedStory) {
        titleLabel.text = displayedStory.title
        descriptionLabel.text = displayedStory.description
        authorLabel.text = displayedStory.author
        guard let image = displayedStory.image else { return }
        storyImage.sd_setImage(with: image, placeholderImage: UIImage(named: "download"))
    }
    
    func setupUI() {
        self.addSubview(scrollView)
        scrollView.addSubview(scrollViewContainer)
        scrollViewContainer.addSubview(storyImage)
        scrollViewContainer.addSubview(titleLabel)
        scrollViewContainer.addSubview(descriptionLabel)
        scrollViewContainer.addSubview(authorLabel)
        scrollViewContainer.addSubview(seeMoreButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        var height = 0.0
        guard let superview = superview?.frame else { return }
        //get superview biggest side value
        superview.height > superview.width ? (height = superview.height) : (height = superview.width)

        scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        scrollViewContainer.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        scrollViewContainer.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        scrollViewContainer.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        scrollViewContainer.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        scrollViewContainer.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        
        storyImage.topAnchor.constraint(equalTo: scrollViewContainer.topAnchor).isActive = true
        storyImage.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor).isActive = true
        storyImage.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor).isActive = true
        storyImage.heightAnchor.constraint(equalToConstant: height/3).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: storyImage.bottomAnchor, constant: topPadding).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: leftPadding).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor).isActive = true
        
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: topPadding).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: leftPadding).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor, constant: -topPadding).isActive = true

        authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: topPadding).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: leftPadding).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true

        seeMoreButton.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: topPadding).isActive = true
        seeMoreButton.leftAnchor.constraint(equalTo: scrollViewContainer.leftAnchor, constant: leftPadding).isActive = true
        seeMoreButton.rightAnchor.constraint(equalTo: scrollViewContainer.rightAnchor).isActive = true
        seeMoreButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        seeMoreButton.bottomAnchor.constraint(equalTo: scrollViewContainer.bottomAnchor).isActive = true
    }
    
    @objc func buttonAction(sender: UIButton!) {
        delegate?.seeMoreAction()
    }
    
}
