//
//  DartButton.swift
//  Dart
//
//  Created by Bash on 03/07/2022.
//

import UIKit

class DartButton: UIButton {
    var onTap: (() -> ())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringLiterals.Errors.initCoder)
    }
    
    private func configure() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        backgroundColor = Colors.yellow
        layer.cornerRadius = 10
        setTitleColor(Colors.blue, for: .normal)
        addTarget(self, action: #selector(dartButtonClicked), for: .touchUpInside)
    }
    
    @objc func dartButtonClicked() {
      onTap?()
    }
}
