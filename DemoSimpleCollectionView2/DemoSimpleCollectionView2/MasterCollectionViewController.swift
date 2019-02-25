//
//  CollectionViewController.swift
//  DemoSimpleCollectionView2
//
//  Created by duycuong on 2/25/19.
//  Copyright © 2019 duycuong. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class MasterCollectionViewController: UICollectionViewController, CollectionViewCellDelegate {
    
    var  arrImage = [Int](1...10)
    
    func onClick(at indexPath: IndexPath) {
        arrImage.remove(at: indexPath.row)
        collectionView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImage.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.delegate = self  
        cell.indexPath = indexPath
        cell.masterImage.image = UIImage(named: String(arrImage[indexPath.row]))
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "Reuse", for: indexPath)
            // do any programmatic customization, if any, here
            return view
        }
        fatalError("Unexpected kind")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as? UICollectionViewCell
        
        let indexPath = collectionView.indexPath(for: cell!)
        if let destination = segue.destination as? DetailViewController {
            destination.detailData = String(arrImage[(indexPath?.row)!])
        }
    }
    
    
}
