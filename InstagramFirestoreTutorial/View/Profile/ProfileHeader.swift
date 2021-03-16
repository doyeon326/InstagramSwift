//
//  ProfileHeader.swift
//  InstagramFirestoreTutorial
//
//  Created by Tony Jung on 2021/03/16.
//

import UIKit

class profileHeader: UICollectionReusableView {
    
    // MARK: - Property
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
