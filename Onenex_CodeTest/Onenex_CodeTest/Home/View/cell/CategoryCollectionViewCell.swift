//
//  CategoryCollectionViewCell.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var categoryImageView: UIImageView!
    @IBOutlet weak var categoryNameLabel: UILabel!
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureHierarhy()
    }
    
    
    private func configureHierarhy() {
        configureBackgroundView()
        configureImageView()
        configureNameLabel()
    }
    
    private func configureBackgroundView() {
        self.backgroundColor = UIColor.white
    }
    
    private func configureImageView() {
        categoryImageView.contentMode = .scaleAspectFill
    }
    
    private func configureNameLabel() {
        categoryNameLabel.textColor = UIColor.black.withAlphaComponent(0.8)
    }
    
    func updateUI(image: UIImage?, name: String) {
        categoryImageView.image = image
        categoryNameLabel.text = name
    }

}
