//
//  HomeView.swift
//  Dart
//
//  Created by Bash on 02/07/2022.
//

import UIKit

class OnboardingView: UIView {
    
    private lazy var onboardingCV: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = Colors.teal
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private lazy var getStartedButton: DartButton = {
        let button = DartButton()
        button.setTitle(StringLiterals.ButtonTitles.getStarted, for: .normal)
        button.onTap = gohome
        return button
    }()
    
    
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
        addSubview(onboardingCV)
        NSLayoutConstraint.activate([
            onboardingCV.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            onboardingCV.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingCV.trailingAnchor.constraint(equalTo: trailingAnchor),
            onboardingCV.bottomAnchor.constraint(equalTo: self.getStartedButton.topAnchor, constant: -30)
        ])
    }
    
    func setupButton() {
        addSubview(getStartedButton)
        NSLayoutConstraint.activate([
            getStartedButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            getStartedButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            getStartedButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    func gohome(){
        print("going home....")
    }
    
    
}

extension OnboardingView: UICollectionViewDelegate {
    
}

extension OnboardingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
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

extension OnboardingView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.size.width, height: frame.size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        5
    }
}
