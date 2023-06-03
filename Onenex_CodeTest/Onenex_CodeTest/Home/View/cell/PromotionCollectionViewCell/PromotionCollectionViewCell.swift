//
//  PromotionCollectionViewCell.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import UIKit

class PromotionCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var promotionImageView: UIImageView!
    @IBOutlet weak var promotionDateLabel: UILabel!
    @IBOutlet weak var promotionNameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    
    private func configureHierarchy() {
        configureImageView()
        configureNameLabel()
        configureDateLabel()
    }
    
    private func configureImageView() {
        promotionImageView.layer.cornerRadius = 10
        promotionImageView.contentMode = .scaleAspectFill
    }
    
    private func configureDateLabel() {
        
    }
    
    private func configureNameLabel() {
        
    }
    
    func render(article: ArticleModel) {
        self.promotionDateLabel.text = article.createdAt
        self.promotionNameLabel.text = article.title
    }
}
