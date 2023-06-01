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
    }
    
    private func configureBackground() {
        self.view.backgroundColor = UIColor.blue
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
        bannerCollectionView.delegate = self
        
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
    }
    
    @objc func didTapCollapseBtn() {
        isCollapsed = !isCollapsed
        UIView.animate(withDuration: 0.3, delay: 0.0) { [weak self] in
            guard let self = self else {return }
            self.categoryCollectionViewHeight.constant = self.isCollapsed ? 160 : 80
            self.view.layoutIfNeeded()
        }
    }

}

extension Home: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == firstCollectionView {
            return 8
        } else if collectionView == bannerCollectionView {
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
        } else {
            return UICollectionViewCell()
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x / scrollView.frame.width
        print("Index is \(index)")
    }
}
