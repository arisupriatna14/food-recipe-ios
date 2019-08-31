//
//  MealDataModel.swift
//  Food Recipe
//
//  Created by Ari Supriatna on 30/08/19.
//  Copyright © 2019 Ari Supriatna. All rights reserved.
//

import UIKit

class MealDataModel {
  var idMeal: String
  var strMeal: String
  var strMealThumb: String
  
  init(idMeal: String, strMeal: String, strMealThumb: String) {
    self.idMeal = idMeal
    self.strMeal = strMeal
    self.strMealThumb = strMealThumb
  }
}
