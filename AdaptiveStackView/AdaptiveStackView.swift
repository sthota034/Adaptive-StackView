//
//  AdaptiveStackView.swift
//  AdaptiveStackView
//
//  Created by Srikanth Thota (Contractor) on 8/22/24.
//

import Foundation
import UIKit

class AdaptiveStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        axis = .horizontal
        spacing = 10
        alignment = .fill
        distribution = .fill
    }
    
    
    override func addArrangedSubview(_ view: UIView) {
        super.addArrangedSubview(view)
        updateStackViewAxis()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if traitCollection.preferredContentSizeCategory != previousTraitCollection?.preferredContentSizeCategory {
            updateStackViewAxis()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateStackViewAxis()
    }

    func updateStackViewAxis() {
        let totalWidth = subviews.reduce(0) { (sum, view) -> CGFloat in
            return sum + view.intrinsicContentSize.width
        }
        axis = totalWidth > bounds.width ? .vertical : .horizontal
    }
}
