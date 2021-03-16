//
//  ProfileCell.swift
//  InstagramFirestoreTutorial
//
//  Created by Tony Jung on 2021/03/16.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
