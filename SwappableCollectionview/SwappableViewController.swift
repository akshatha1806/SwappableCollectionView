//
//  ViewController.swift
//  SwappableCollectionview
//
//  Created by Akshatha on 16/08/23.

import UIKit


class SwappableViewController: UIViewController {
    @IBOutlet weak var swappableCollectionView: UICollectionView!
    var images: [UIImage] = [UIImage(named: "imageOne")!, UIImage(named: "imageTwo")!, UIImage(named: "imageThree")!, UIImage(named: "imageFour")!,
                              UIImage(named: "imageFive")!, UIImage(named: "imageSix")!, UIImage(named: "imageSeven")!, UIImage(named: "imageEight")!, UIImage(named: "imageNine")!]
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(longPressRecognize(_ :)))
        swappableCollectionView.addGestureRecognizer(gesture)
    }
    @objc func longPressRecognize(_ gesture: UILongPressGestureRecognizer) {
        guard let collectionView = swappableCollectionView else {
            return
        }
        switch gesture.state {
        case .began:
            guard let targettedIndexPath = swappableCollectionView.indexPathForItem(at: gesture.location(in: swappableCollectionView)) else {
                return
            }
            swappableCollectionView.beginInteractiveMovementForItem(at: targettedIndexPath)
        case .changed:
            swappableCollectionView.updateInteractiveMovementTargetPosition(gesture.location(in: swappableCollectionView))
        case .ended:
            swappableCollectionView.endInteractiveMovement()
        default:
            swappableCollectionView.cancelInteractiveMovement()
     
        }
    }
    func configureCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let numberOfColumns: CGFloat = 3
        let itemWidth = (self.swappableCollectionView?.frame.size.width)!/3
        layout.itemSize =  CGSize(width: itemWidth - 16, height: 50)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        swappableCollectionView.setCollectionViewLayout(layout, animated: true)
        swappableCollectionView.dataSource = self
        swappableCollectionView.delegate = self
        swappableCollectionView.register(UINib(nibName: "DemoCollectionViewCell", bundle: nil),
                                         forCellWithReuseIdentifier: "DemoCollectionViewCell")
    }
}
extension SwappableViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell",
                                                            for: indexPath) as? DemoCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.imageView.image = images[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (self.swappableCollectionView?.frame.size.width)!/3 - 16, height: (self.swappableCollectionView?.frame.size.width)!/3 - 10)
    }
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movableItem = images.remove(at: sourceIndexPath.row)
        images.insert(movableItem, at: destinationIndexPath.row)
    }
    
    
}
