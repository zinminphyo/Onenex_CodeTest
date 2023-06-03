//
//  AnnouncementTableViewCell.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 01/06/2023.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {
    
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
    
    @IBOutlet weak var announcementDateLabel: UILabel!
    @IBOutlet weak var announcementTitleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        configureHierarchy()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        selectionStyle = .none
    }
    
    private func configureHierarchy() {
        configureDateLabel()
        configureTitleLabel()
    }
    
    private func configureDateLabel() {
        
    }
    
    private func configureTitleLabel() {
        
    }
    
    func render(article: ArticleModel) {
        self.announcementTitleLabel.text = article.title
        self.announcementDateLabel.text = article.createdAt
    }
}

