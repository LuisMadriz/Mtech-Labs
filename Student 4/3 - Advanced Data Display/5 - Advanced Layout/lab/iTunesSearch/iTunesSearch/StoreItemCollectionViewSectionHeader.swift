//
//  StoreItemCollectionViewSectionHeader.swift
//  iTunesSearch
//
//  Created by Luis Madriz on 3/29/22.
//

import Foundation
import UIKit

class StoreItemCollectionViewSectionHeader:
    UICollectionReusableView {
        static let reuseIdentifier =
            "StoreItemCollectionViewSectionHeader"
        
        let titleLabel: UILabel = {
            let label = UILabel()
            label.textColor = .label
            label.font = UIFont.boldSystemFont(ofSize: 17)
            
            return label
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupView()
        }
        
        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupView()
        }
        
        func setTitle(_ title: String) {
            titleLabel.text = title
        }
        
        private func setupView() {
            backgroundColor = .systemGray5
            
            addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints =
                false
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
                titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
            ])
            
        }
        
    }

extension SearchScope {
    var orthogonalScrollingBehavior:
       UICollectionLayoutSectionOrthogonalScrollingBehavior {
        switch self {
        case .all:
            return .continuousGroupLeadingBoundary
        default:
            return .none
        }
    }

    var groupItemCount: Int {
        switch self {
        case .all:
            return 1
        default:
            return 3
        }
    }

    var groupWidthDimension: NSCollectionLayoutDimension {
        switch self {
        case .all:
            return .fractionalWidth(1/3)
        default:
            return .fractionalWidth(1.0)
        }
    }
}
