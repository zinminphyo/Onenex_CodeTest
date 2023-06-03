//
//  Home+State.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 02/06/2023.
//

import Foundation



extension Home {
    enum State {
        case showLoading
        case hideLoading
        case renderPromotionLists([ArticleModel])
        case renderAnnouncementLists([ArticleModel])
        case renderNewsLetterLists([ArticleModel])
        case renderError(String)
    }
}
