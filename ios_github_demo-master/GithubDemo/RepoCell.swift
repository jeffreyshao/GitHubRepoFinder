//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Jeffrey Shao on 2/15/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var repoName: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var describo: UILabel!
    @IBOutlet weak var creator: UILabel!
    
    var githubRepo: GithubRepo! {
        didSet{
            repoName.text = githubRepo.name
            profilePic.setImageWith(URL(string: githubRepo.ownerAvatarURL!)!)
            creator.text = githubRepo.ownerHandle
            starsLabel.text = String(githubRepo.stars!)
            forksLabel.text = String(githubRepo.forks!)
            describo.text = githubRepo.repoDescription
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
