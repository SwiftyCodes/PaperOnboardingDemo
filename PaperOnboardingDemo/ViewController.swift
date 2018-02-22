//
//  ViewController.swift
//  PaperOnboardingDemo
//
//  Created by Admin on 2/22/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
import paper_onboarding

class ViewController: UIViewController {
    
    @IBOutlet var skipButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.isHidden = true
        
        setupPaperOnboardingView()
        
        view.bringSubview(toFront: skipButton)
    }
    
    @IBAction func skipButtonTapped(_: UIButton) {
        print(#function)
    }
    
    private func setupPaperOnboardingView() {
        let onboarding = PaperOnboarding()
        onboarding.delegate = self
        onboarding.dataSource = self
        onboarding.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(onboarding)
        
        // Add constraints
        for attribute: NSLayoutAttribute in [.left, .right, .top, .bottom] {
            let constraint = NSLayoutConstraint(item: onboarding,
                                                attribute: attribute,
                                                relatedBy: .equal,
                                                toItem: view,
                                                attribute: attribute,
                                                multiplier: 1,
                                                constant: 0)
            view.addConstraint(constraint)
        }
    }
}

// MARK: PaperOnboardingDelegate

extension ViewController: PaperOnboardingDelegate {
    
    func onboardingWillTransitonToIndex(_ index: Int) {
        skipButton.isHidden = index == 2 ? false : true
    }
    
    func onboardingDidTransitonToIndex(_ index: Int) {
        print("index is when Did called:\(index)")
    }
    
    func onboardingConfigurationItem(_ item: OnboardingContentViewItem, index: Int) {
        //item.titleLabel?.backgroundColor = .redColor()
        //item.descriptionLabel?.backgroundColor = .redColor()
        //item.imageView = ...
    }
}

// MARK: PaperOnboardingDataSource

extension ViewController: PaperOnboardingDataSource {
    
    func onboardingItem(at index: Int) -> OnboardingItemInfo {
        
        return [
            OnboardingItemInfo(informationImage: UIImage(named:"Hotels")!,
                               title: "Hotels",
                               description: "All hotels and hostels are sorted by hospitality rating",
                               pageIcon: UIImage(named:"Key")!,
                               color: UIColor(red: 0.40, green: 0.56, blue: 0.71, alpha: 1.00),
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: ViewController.titleFont, descriptionFont: ViewController.descriptionFont),
            
            OnboardingItemInfo(informationImage: UIImage(named:"Banks")!,
                               title: "Banks",
                               description: "We carefully verify all banks before add them into the app",
                               pageIcon: UIImage(named:"Wallet")!,
                               color: UIColor(red: 0.40, green: 0.69, blue: 0.71, alpha: 1.00),
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: ViewController.titleFont, descriptionFont: ViewController.descriptionFont),
            
            OnboardingItemInfo(informationImage: UIImage(named:"Stores")!,
                               title: "Stores",
                               description: "All local stores are categorized for your convenience",
                               pageIcon: UIImage(named:"Shopping-cart")!,
                               color: UIColor(red: 0.61, green: 0.56, blue: 0.74, alpha: 1.00),
                               titleColor: UIColor.white, descriptionColor: UIColor.white, titleFont: ViewController.titleFont, descriptionFont: ViewController.descriptionFont),
            ][index]
    }

    
    func onboardingItemsCount() -> Int {
        return 3
    }

}


//MARK: Constants
extension ViewController {
    
    private static let titleFont = UIFont(name: "Nunito-Bold", size: 36.0) ?? UIFont.boldSystemFont(ofSize: 36.0)
    private static let descriptionFont = UIFont(name: "OpenSans-Regular", size: 14.0) ?? UIFont.systemFont(ofSize: 14.0)
}



