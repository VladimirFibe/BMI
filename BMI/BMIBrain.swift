//
//  BMIBrain.swift
//  BMI
//
//  Created by Vladimir Fibe on 16.02.2022.
//

import Foundation
import UIKit

struct BMI {
  let value: Float
  var advice: String
  var color: UIColor
  var title: String {
    String(format: "%.1f", value)
  }
}
struct BMIBrain {
  let blueColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
  let greenColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
  let redColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
  private var bmi: BMI?
  mutating func calculateBMI(height: Float, weight: Float) {
    let value = weight / (height * height)
    if value < 18.5 {
      bmi = BMI(value: value, advice: "Eat more pies!", color: blueColor)
    } else if value < 24.9 {
      bmi = BMI(value: value, advice: "Fit as a fiddle!", color: greenColor)
    } else {
      bmi = BMI(value: value, advice: "Eat less pies!", color: redColor)
    }
  }
  func getBMI() -> BMI? {
    bmi
  }
}
