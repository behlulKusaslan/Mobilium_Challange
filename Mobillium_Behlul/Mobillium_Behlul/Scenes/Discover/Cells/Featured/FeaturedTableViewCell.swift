//
//  FeaturedTableViewCell.swift
//  Mobillium_Behlul
//
//  Created by behlul on 21.12.2018.
//  Copyright © 2018 behlul. All rights reserved.
//

import UIKit
import Kingfisher

final class FeaturedTableViewCell: UITableViewCell, XibLoadable {
    
    // Outlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    // Proporties
    private var featureds: [FeaturedPresentation] = []
    
    // MARK: - Lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        
        //loadViewFromXib()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadViewFromXib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        loadViewFromXib()
    }
    
    // MARK: - Functions
    func createSlides() -> [SlideView] {
        var slides: [SlideView] = []
        for featured in featureds {
            let slide: SlideView = Bundle.main.loadNibNamed("SlideView", owner: self, options: nil)?.first as! SlideView
            slide.imageView.kf.setImage(with: featured.imageUrl)
            slide.titleLabel.text = featured.title
            slide.subtitleLabel.text = featured.subtitle
            slides.append(slide)
        }
        return slides
    }
    
    func setUpScrollView(with slides: [SlideView]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        scrollView.contentSize = CGSize(width: self.frame.width * CGFloat(slides.count), height: self.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: self.frame.width * CGFloat(i), y: 0, width: self.frame.width, height: self.frame.height)
            scrollView.addSubview(slides[i])
        }
    }
    
}

// MARK: - FeaturedTableViewCellProtocol
extension FeaturedTableViewCell: FeaturedTableViewCellProtocol {
    func updateTableViewCell(_ featureds: [FeaturedPresentation]) {
        self.featureds = featureds
        let slides = createSlides()
        setUpScrollView(with: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        self.bringSubviewToFront(pageControl)
    }
}

// MARK: - UIScrollViewDelegate
extension FeaturedTableViewCell: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/self.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
