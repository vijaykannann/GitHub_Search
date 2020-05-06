//
//  UsersTableViewCell.swift
//  GitRepoSearch
//
//  Created by VJ's iMAC on 06/05/20.
//  Copyright © 2020 Deuglo. All rights reserved.
//

import UIKit

class UsersTableViewCell: UITableViewCell {

    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var imgUserProfilePic: UIImageView!
    @IBOutlet weak var lblRepoCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        self.imgUserProfilePic.makeRounded()        
    }
}
