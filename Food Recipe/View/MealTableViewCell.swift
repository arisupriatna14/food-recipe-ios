//
//  MealTableViewCell.swift
//  Food Recipe
//
//  Created by Ari Supriatna on 30/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit
import SwiftyJSON
import SDWebImage

class MealTableViewCell: UITableViewCell {
  
  @IBOutlet weak var mealImage: UIImageView!
  @IBOutlet weak var mealLabel: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.labelStyles()
    self.imageStyles()
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
  func setupCell(meal: JSON) {
    mealLabel.text = meal["strMeal"].stringValue
    mealImage.sd_setImage(with: URL(string: meal["strMealThumb"].stringValue))
  }
  
  func imageStyles() {
    mealImage.layer.cornerRadius = 10
    mealImage.layer.masksToBounds = true
    mealImage.contentMode = .scaleAspectFill
  }

  func labelStyles() {
    mealLabel.numberOfLines = 2
  }
}
