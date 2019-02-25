//
//  DetailViewController.swift
//  DemoSimpleCollectionView2
//
//  Created by duycuong on 2/23/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailScrollView: UIScrollView!
    
    var detailData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailScrollView.delegate = self
        if detailData != nil {
            detailImage.image = UIImage(named: detailData!)
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.detailImage
    }
    
}
