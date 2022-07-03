//
//  ViewController.swift
//  Dart
//
//  Created by Bash on 02/07/2022.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    let onboardingView = OnboardingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureOnboardingScreen()
    }
    
    func configureOnboardingScreen() {
        onboardingView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboardingView)
        
        NSLayoutConstraint.activate([
            onboardingView.topAnchor.constraint(equalTo: view.topAnchor),
            onboardingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            onboardingView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

