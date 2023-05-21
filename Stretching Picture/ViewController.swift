//
//  ViewController.swift
//  Stretching Picture
//
//  Created by Стас on 21.05.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let pictureHeight: CGFloat = 270
    
    lazy var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.frame.origin = .zero
        imageView.frame.size = CGSize(width: view.frame.width, height: pictureHeight)
        return imageView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.delegate = self
        scrollView.frame = view.frame
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1500)
        scrollView.verticalScrollIndicatorInsets.top = pictureHeight - view.safeAreaInsets.top
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        scrollView.addSubview(picture)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            let imageViewHeight = pictureHeight - scrollView.contentOffset.y
            
            picture.frame.origin = CGPoint(x: 0, y: scrollView.contentOffset.y)
            picture.frame.size = CGSize(width: view.frame.width, height: imageViewHeight)
            scrollView.verticalScrollIndicatorInsets.top = imageViewHeight - view.safeAreaInsets.top
        }
    }
}
