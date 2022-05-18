//
//  StoryListView.swift
//  NYStories
//
//  Created by Maksim Chulkov on 17.05.2022.
//

import Foundation
import UIKit

//struct StoryListViewSetupModel {
//    var model: [StoryList.Something.ViewModel.DisplayedStory]
//}

protocol StoryListViewProtocol: AnyObject {
    func select(model: StoryList.Something.ViewModel.DisplayedStory)
}

final class StoryListView: UIView {
    let tableView = UITableView()
    private var displayedStories: [StoryList.Something.ViewModel.DisplayedStory]?//StoryListViewSetupModel?
    weak var delegate: StoryListViewProtocol?
    
    
    func setupUI() {
        self.backgroundColor = .lightGray
        self.addSubview(tableView)
        setupTableView()
    }
    
    func setup(with displayedStories: [StoryList.Something.ViewModel.DisplayedStory]) { //StoryListViewSetupModel
        self.displayedStories = displayedStories
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(StoryListTableViewCell.self, forCellReuseIdentifier: "storyCell")
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
}

extension StoryListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayedStories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let model = self.displayedStories?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeueReusableCell(withIdentifier: "storyCell", for: indexPath) as! StoryListTableViewCell
        cell.setup(with: model)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        guard let model = self.displayedStories?[indexPath.row] else { return }
        delegate?.select(model: model)
    }
    
}
