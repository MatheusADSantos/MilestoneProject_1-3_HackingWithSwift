//
//  CustomCellTableViewCell.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit
import SnapKit

class CustomCellTableViewCell: UITableViewCell {
    
    var imagePhoto : UIImageView = {
        let imagePhoto = UIImageView()
//        imagePhoto.layer.masksToBounds = true
        return imagePhoto
    }()
    var label : UILabel = {
        let label = UILabel()
        return label
    }()
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        contentView.addSubview(imagePhoto)
        contentView.addSubview(label)
        
        imagePhoto.snp.makeConstraints { (make) in
//            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(100)
        }
        label.snp.makeConstraints { (make) in
            make.left.equalTo(imagePhoto.snp.right).offset(10)
            make.centerY.equalToSuperview()
            make.height.equalTo(50)
        }
    }

}
