//
//  HomeView.swift
//  Dart
//
//  Created by Bash on 02/07/2022.
//

import UIKit

class OnboardingView: UIView {
    private lazy var onboardingCV = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    private lazy var getStartedButton = DartButton()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError(StringLiterals.Errors.initCoder)
    }
    
    func addViews(){
        setupButton()
        setupCollectionView()
    }
    
    func setupCollectionView(){
        onboardingCV.dataSource = self
        onboardingCV.delegate = self
        onboardingCV.register(OnboardingCollectionViewCell.self, forCellWithReuseIdentifier: OnboardingCollectionViewCell.identifier)
        onboardingCV.translatesAutoresizingMaskIntoConstraints = false
        onboardingCV.backgroundColor = .link
        addSubview(onboardingCV)
        NSLayoutConstraint.activate([
            onboardingCV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            onboardingCV.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingCV.trailingAnchor.constraint(equalTo: trailingAnchor),
            onboardingCV.bottomAnchor.constraint(equalTo: self.getStartedButton.topAnchor, constant: -30)
        ])
    }
    
    func setupButton() {
        getStartedButton.setTitle(StringLiterals.ButtonTitles.getStarted, for: .normal)
        getStartedButton.onTap = gohome
        addSubview(getStartedButton)
        NSLayoutConstraint.activate([
            getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            getStartedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            getStartedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func gohome(){
        
    }
    
    
}

extension OnboardingView: UICollectionViewDelegate {
    
}

extension OnboardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: OnboardingCollectionViewCell.identifier,
            for: indexPath) as? OnboardingCollectionViewCell {
            return cell
        }
        fatalError(StringLiterals.Errors.cellError)
    }
    
    
}
