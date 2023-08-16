//
//  DemoCollectionViewCell.swift
//  SwappableCollectionview
//
//  Created by Akshatha on 16/08/23.
//

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func transformToLarge(){
        UIView.animate(withDuration: 0.2){
          self.transform = CGAffineTransform(scaleX: 1.07, y: 1.07)
        }
      }
      
      func transformToStandard(){
        UIView.animate(withDuration: 0.2){
          self.transform = CGAffineTransform.identity
        }
      }

}
