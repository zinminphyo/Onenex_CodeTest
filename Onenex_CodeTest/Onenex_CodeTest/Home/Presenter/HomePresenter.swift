//
//  HomePresenter.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation


class HomePresenter: HomePresenting {
    
    var viewDelegate: HomeViewDelegate?
    
    var interactor: HomeInteracting?
    
    func fetchArticleLists() {
        Task {
            
            let result = try await interactor?.fetchArticleLists()
            
            
            DispatchQueue.main.async { [weak self] in
                guard let self  = self else { return }
                guard let data = result?.data else { return }
               
                
                let promotionLists = data.filter{ $0.value.articleId ==  307365209109043891}.compactMap{ $0.value }
                self.viewDelegate?.render(state: .renderPromotionLists(promotionLists))
                
                let announcementLists = data.filter{ $0.value.articleId == 307363530326282481 }.compactMap{ $0.value }
                self.viewDelegate?.render(state: .renderAnnouncementLists(announcementLists))
                
                let newsLetterLists = data.filter{ $0.value.articleId == 307363530275953074 }.compactMap{ $0.value }
                self.viewDelegate?.render(state: .renderNewsLetterLists(newsLetterLists))
                
            }
        }
    }
    
    
}
