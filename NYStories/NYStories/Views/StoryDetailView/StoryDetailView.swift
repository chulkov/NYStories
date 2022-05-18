//
//  StoryDetailView.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation
import UIKit

final class StoryDetailView: UIView {
    
    private let titleLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 230, height: 21))
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 36)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.required, for: .vertical)
//        lbl.setContentCompressionResistancePriority(.required, for: .vertical)
        return lbl
    }()
    
    private let descriptionLabel : UILabel = {
        let lbl = UILabel(frame: CGRect(x: 0, y: 0, width: 230, height: 21))
        lbl.textColor = .darkGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        lbl.setContentHuggingPriority(.required, for: .vertical)
        return lbl
    }()
    
    private let authorLabel : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .lightGray
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    private let storyImage: UIImageView = {
        let imgView = UIImageView()
        imgView.backgroundColor = .blue
        imgView.contentMode = .scaleAspectFit
//        imgView.clipsToBounds = true
        return imgView
    }()
    
    func setupUI() {
//        self.backgroundColor = .gray
        self.addSubview(storyImage)
        self.addSubview(titleLabel)
        self.addSubview(descriptionLabel)
        self.addSubview(authorLabel)
        
        titleLabel.text = "JOPAAAAAAAAAA"
        
        setupConstraints()
        
    }
    
    private func setupConstraints() {
        guard let superview = superview else { return }
        
        storyImage.translatesAutoresizingMaskIntoConstraints = false
        storyImage.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        storyImage.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        storyImage.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        storyImage.heightAnchor.constraint(equalToConstant: superview.frame.height/3).isActive = true
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: storyImage.bottomAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
//        titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor).isActive = true
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
//        descriptionLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
//        authorLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setup(with displayedStory: StoryList.Something.ViewModel.DisplayedStory) { 

        titleLabel.text = displayedStory.title
        descriptionLabel.text = displayedStory.description
        authorLabel.text = displayedStory.author
//        titleLabel.sizeToFit()
//        descriptionLabel.sizeToFit()
        
    }
    
}
