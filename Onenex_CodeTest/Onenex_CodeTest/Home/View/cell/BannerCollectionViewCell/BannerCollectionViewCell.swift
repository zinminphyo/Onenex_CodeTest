//
//  BannerCollectionViewCell.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import UIKit

class BannerCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bannerImageView: UIImageView!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    
    private func configureHierarchy() {
        configureImageView()
    }
    
    private func configureImageView() {
        bannerImageView.contentMode = .scaleAspectFill
    }
}
