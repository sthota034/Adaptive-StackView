//
//  ViewController.swift
//  AdaptiveStackView
//
//  Created by Srikanth Thota (Contractor) on 8/22/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      buildStackView()
    }
    
    func buildStackView() {
        let adaptiveStack = AdaptiveStackView()
        let label1 = UILabel(text: "Hi Rob")
        let label2 = UILabel(text: "Welcome to the Adaptive ")
        let label3 = UILabel(text: "StackView!")
        
        [label1, label2, label3].forEach({ adaptiveStack.addArrangedSubview($0)})
        view.addSubview(adaptiveStack)
        
        adaptiveStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            adaptiveStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            adaptiveStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            adaptiveStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}



extension UILabel {
    convenience init(text: String) {
        self.init()
        self.text = text
        self.font = .preferredFont(forTextStyle: .body)
        adjustsFontForContentSizeCategory = true
    }
}
