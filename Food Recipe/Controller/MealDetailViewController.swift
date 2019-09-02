//
//  MealDetailViewController.swift
//  Food Recipe
//
//  Created by Ari Supriatna on 31/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class MealDetailViewController: UIViewController {
  
  //MARK: Constants
  let MEAL_DETAIL_URL = "https://www.themealdb.com/api/json/v1/1/lookup.php"
  
  var idMeal: String?
  var strMealThumb: String?
  var strMeal: String?
  var dataMealDetail: JSON = []
  
  //MARK: IBOutlet
  @IBOutlet weak var mealNameLabel: UILabel!
  @IBOutlet weak var imageMeal: UIImageView!
  @IBOutlet weak var instructionsTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.mealNameLabel.text = strMeal!
    self.imageMeal.sd_setImage(with: URL(string: strMealThumb!))
    self.title = strMeal
    
    self.getMealDetail(url: MEAL_DETAIL_URL, parameters: ["i": idMeal!])
  }
  
  //MARK: Networking
  func getMealDetail(url: String, parameters: [String: String]) {
    Alamofire.request(url, method: .get, parameters: parameters).responseJSON { (response) in
      if response.result.isSuccess {
        let dataMealDetail: JSON = JSON(response.result.value!)
        
        self.updateDataMealDetail(json: dataMealDetail)
      } else {
        print("Error euy: \(response.error!)")
      }
    }
  }
  
  func updateDataMealDetail(json: JSON) {
    dataMealDetail = json["meals"]
    
    updateUI()
  }
  
  func updateUI() {
    instructionsTextView.text = dataMealDetail[0]["strInstructions"].stringValue
  }
  
}
