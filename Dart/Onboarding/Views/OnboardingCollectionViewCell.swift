//
//  OnboardingCollectionViewCell.swift
//  Dart
//
//  Created by Bash on 02/07/2022.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    static let identifier = StringLiterals.CellIdentifiers.onboardingCell
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringLiterals.Errors.initCoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
