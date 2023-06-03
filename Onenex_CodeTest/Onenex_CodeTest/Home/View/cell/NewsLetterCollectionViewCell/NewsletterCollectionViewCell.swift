//
//  NewsletterCollectionViewCell.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import UIKit

class NewsletterCollectionViewCell: UICollectionViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var newsletterImageView: UIImageView!
    @IBOutlet weak var newsletterDateLabel: UILabel!
    @IBOutlet weak var newsletterTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        configureImageView()
        configureDateLabel()
        configureTitleLabel()
    }
    
    private func configureImageView() {
        newsletterImageView.contentMode = .scaleAspectFill
    }
    
    private func configureDateLabel() {
        
    }
    
    private func configureTitleLabel() {
        
    }
    
    func render(article: ArticleModel) {
        newsletterDateLabel.text = article.createdAt
        newsletterTitleLabel.text = article.title
    }

}
