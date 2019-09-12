//
//  HomeCell.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 09/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class HomeCell: UITableViewCell {
    let imageSize = CGSize(width: 220, height: 200)
    
    lazy var titleLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helveticaBold.of(18)
        label.textColor = UIColor.flatBlackDark
        label.numberOfLines = 0
        return label
    }()
    
    lazy var newsImageView: UIImageView = {
        var imageView = UIImageView(frame: .zero)
        imageView.backgroundColor = UIColor.clear
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.font = Fonts.helvetica.of(14)
        label.textColor = UIColor.flatBlack
        label.numberOfLines = 0
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupData(_ viewModel: NewsViewModel) {
      titleLabel.text = viewModel.title
      descriptionLabel.text = viewModel.description
      if let imageUrl = viewModel.imageUrl {
        newsImageView.kf.setImage(with: imageUrl)
      }
    }
    
    func setupViews() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(newsImageView)
        contentView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().inset(16)
            make.left.right.equalToSuperview().inset(20)
        }
        
        newsImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.left.right.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
        }
        
        descriptionLabel.snp.makeConstraints { (make) in
           make.top.equalTo(newsImageView.snp.bottom).offset(8)
           make.left.right.equalToSuperview().inset(20)
           make.bottom.equalToSuperview().inset(16)
        }
    }
}
