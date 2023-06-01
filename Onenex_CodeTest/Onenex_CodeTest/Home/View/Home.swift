//
//  Home.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 31/05/2023.
//

import UIKit

class Home: UIViewController {
    
    @IBOutlet weak var firstCollectionView: UICollectionView!
    @IBOutlet weak var collapseCategoryCollectinViewBtn: UIButton!
    @IBOutlet weak var summaryContainerView: UIView!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    @IBOutlet weak var bannerPageControl: UIPageControl!
    @IBOutlet weak var promotionsCollectionView: UICollectionView!
    @IBOutlet weak var promotionsSeeAllBtn: UIButton!
    @IBOutlet weak var announcementTableView: UITableView!
    @IBOutlet weak var newsletterCollectionView: UICollectionView!
    @IBOutlet weak var notificationBtn: UIButton!
    
    @IBOutlet weak var categoryCollectionViewHeight: NSLayoutConstraint!
    
    private var isCollapsed: Bool = true

    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
    }
    

    private func configureHierarchy() {
        configureBackground()
        configureCollectionView()
        configureCollapseCollectionView()
        configureSummaryContainerView()
        configureBannerCollectionView()
        configureBannerPageControl()
        configurePromotionsCollectionView()
        configureAnnouncementTableView()
        configureNewsLetterCollectionView()
        configureNotificationButton()
    }
    
    private func configureBackground() {
        self.view.backgroundColor = UIColor.white
    }
    
    private func configureSummaryContainerView() {
        summaryContainerView.layer.cornerRadius = 10
    }
    
    private func configureCollectionView() {
        firstCollectionView.register(UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: firstCollectionView.frame.width / 4 - 10, height: 80)
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        firstCollectionView.collectionViewLayout = flowLayout
        firstCollectionView.dataSource = self
        firstCollectionView.showsVerticalScrollIndicator = false
        firstCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureCollapseCollectionView() {
        collapseCategoryCollectinViewBtn.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner
        ]
        collapseCategoryCollectinViewBtn.layer.cornerRadius = 10
        collapseCategoryCollectinViewBtn.addTarget(self, action: #selector(didTapCollapseBtn), for: .touchUpInside)
    }
    
    private func configureBannerCollectionView() {
        bannerCollectionView.register(UINib(nibName: String(describing: BannerCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: BannerCollectionViewCell.reuseIdentifier)
        bannerCollectionView.dataSource = self
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.visibleItemsInvalidationHandler = { [weak self] visibleItems, point, environment in
            guard let index = visibleItems.last?.indexPath.row else { return }
            self?.bannerPageControl.currentPage = index
        }
        let compositionalLayout = UICollectionViewCompositionalLayout(section: section)
        bannerCollectionView.collectionViewLayout = compositionalLayout
    }
    
    private func configureBannerPageControl() {
        bannerPageControl.numberOfPages = 5
        bannerPageControl.tintColor = UIColor(named: "Main")
        bannerPageControl.setCurrentPageIndicatorImage(UIImage(named: "selected"), forPage: 0)
        bannerPageControl.setCurrentPageIndicatorImage(UIImage(named: "selected"), forPage: 1)
        bannerPageControl.setCurrentPageIndicatorImage(UIImage(named: "selected"), forPage: 2)
        bannerPageControl.setCurrentPageIndicatorImage(UIImage(named: "selected"), forPage: 3)
        bannerPageControl.setCurrentPageIndicatorImage(UIImage(named: "selected"), forPage: 4)
//        bannerPageControl.setIndicatorImage(UIImage(systemName: "selected"), forPage: 0)
    }
    
    private func configurePromotionsCollectionView() {
        promotionsCollectionView.register(UINib(nibName: String(describing: PromotionCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: PromotionCollectionViewCell.reuseIdentifier)
        promotionsCollectionView.dataSource = self
        promotionsCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: promotionsCollectionView.frame.width / 1.5, height: promotionsCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        promotionsCollectionView.showsVerticalScrollIndicator = false
        promotionsCollectionView.showsHorizontalScrollIndicator = false
        promotionsCollectionView.collectionViewLayout = flowLayout
    }
    
    private func configureAnnouncementTableView() {
        announcementTableView.register(UINib(nibName: String(describing: AnnouncementTableViewCell.self), bundle: nil), forCellReuseIdentifier: AnnouncementTableViewCell.reuseIdentifier)
        announcementTableView.dataSource = self
        announcementTableView.delegate = self
    }
    
    private func configureNewsLetterCollectionView() {
        newsletterCollectionView.register(UINib(nibName: String(describing: NewsletterCollectionViewCell.self), bundle: nil), forCellWithReuseIdentifier: NewsletterCollectionViewCell.reuseIdentifier)
        newsletterCollectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        newsletterCollectionView.dataSource = self
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: newsletterCollectionView.frame.width / 3 - 20, height: newsletterCollectionView.frame.height)
        flowLayout.scrollDirection = .horizontal
        newsletterCollectionView.collectionViewLayout = flowLayout
        newsletterCollectionView.showsVerticalScrollIndicator = false
        newsletterCollectionView.showsHorizontalScrollIndicator = false
    }
    
    private func configureNotificationButton() {
        notificationBtn.layer.cornerRadius = notificationBtn.frame.width / 2
    }
    
    @objc func didTapCollapseBtn() {
        isCollapsed = !isCollapsed
        UIView.animate(withDuration: 0.3, delay: 0.0) { [weak self] in
            guard let self = self else {return }
            self.collapseCategoryCollectinViewBtn.setImage(self.isCollapsed ? UIImage(systemName: "arrowtriangle.down.fill") : UIImage(systemName: "arrowtriangle.up.fill"), for: .normal)
            self.categoryCollectionViewHeight.constant = self.isCollapsed ? 160 : 80
            self.view.layoutIfNeeded()
        }
    }

}

extension Home: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return 8
        } else if collectionView == bannerCollectionView {
            return 5
        } else if collectionView == promotionsCollectionView {
            return 5
        } else if collectionView == newsletterCollectionView {
            return 5
        } else {
            return 0
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == firstCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else if collectionView == bannerCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BannerCollectionViewCell.reuseIdentifier, for: indexPath) as? BannerCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else if collectionView == promotionsCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PromotionCollectionViewCell.reuseIdentifier, for: indexPath) as? PromotionCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else if collectionView == newsletterCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NewsletterCollectionViewCell.reuseIdentifier, for: indexPath) as? NewsletterCollectionViewCell else { return UICollectionViewCell() }
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
}


extension Home: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AnnouncementTableViewCell.reuseIdentifier, for: indexPath) as? AnnouncementTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
