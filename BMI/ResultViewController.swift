//
//  ResultViewController.swift
//  BMI
//
//  Created by Vladimir Fibe on 16.02.2022.
//

import Foundation
import UIKit

class ResultViewController: UIViewController {
  var value = "0.0"
  lazy var resultLabel: UILabel = {
    let label = UILabel()
    label.text = value
    return label
  }()
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .blue
    resultLabel.text = value
    view.addSubview(resultLabel)
    resultLabel.translatesAutoresizingMaskIntoConstraints = false
    resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    
  }
}
