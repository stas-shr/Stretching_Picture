//
//  ViewController.swift
//  Stretching Picture
//
//  Created by Стас on 21.05.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    let pictureHeight: CGFloat = 270
    
    lazy var pictureScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.frame = view.frame
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.insetsLayoutMarginsFromSafeArea = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: 1500)
        scrollView.verticalScrollIndicatorInsets.top = pictureHeight - view.safeAreaInsets.top
        return scrollView
    }()
    
    lazy var picture: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Cat")
        imageView.frame.origin = .zero
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.frame.size = CGSize(width: view.frame.width, height: pictureHeight)
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(pictureScrollView)
        pictureScrollView.addSubview(picture)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            let height = pictureHeight - scrollView.contentOffset.y
            picture.frame.size = CGSize(width: view.frame.width, height: height)
            picture.frame.origin = CGPoint(x: 0, y: scrollView.contentOffset.y)
            scrollView.verticalScrollIndicatorInsets.top = height - view.safeAreaInsets.top
        }
    }
}
