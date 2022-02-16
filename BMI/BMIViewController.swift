//
//  BMIViewController.swift
//  BMI
//
//  Created by Vladimir Fibe on 16.02.2022.
//

import UIKit

class BMIViewController: UIViewController {
  let backgroundView = UIImageView(image: UIImage(named: "calculate_background"))
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "CALCULATE YOUR BMI"
    label.font = .systemFont(ofSize: 40)
    label.textColor = .darkGray
    label.numberOfLines = 0
    return label
  }()
  
  let heightTitle: UILabel = {
    let label = UILabel()
    label.text = "Height"
    label.font = .systemFont(ofSize: 17)
    label.textColor = .darkGray
    return label
  }()
  
  let heightLabel: UILabel = {
    let label = UILabel()
    label.text = "1.5m"
    label.font = .systemFont(ofSize: 17)
    label.textColor = .darkGray
    return label
  }()
  
  let weightTitle: UILabel = {
    let label = UILabel()
    label.text = "Weight"
    label.font = .systemFont(ofSize: 17)
    label.textColor = .darkGray
    return label
  }()
  
  let weightLabel: UILabel = {
    let label = UILabel()
    label.text = "100Kg"
    label.font = .systemFont(ofSize: 17)
    label.textColor = .darkGray
    return label
  }()
  let heightSlider: UISlider = {
    let slider = UISlider()
    slider.maximumValue = 3.0
    slider.minimumValue = 0.1
    slider.value = 1.5
    slider.minimumTrackTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099) // 7472D2 0.52
    slider.thumbTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099) // 7472D2 0.52
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    slider.addTarget(self, action: #selector(heightSliderChanged), for: .valueChanged)
    return slider
  }()
  
  let weightSlider: UISlider = {
    let slider = UISlider()
    slider.maximumValue = 200.0
    slider.minimumValue = 0.0
    slider.value = 100.0
    slider.minimumTrackTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099) // 7472D2 0.52
    slider.thumbTintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 0.4951038099) // 7472D2 0.52
    slider.translatesAutoresizingMaskIntoConstraints = false
    slider.heightAnchor.constraint(equalToConstant: 60.0).isActive = true
    slider.addTarget(self, action: #selector(weightSliderChanged), for: .valueChanged)
    return slider
  }()
  
  let calculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("CALCULATE", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20.0)
    button.backgroundColor = #colorLiteral(red: 0.3843137255, green: 0.3764705882, blue: 0.6156862745, alpha: 1) // 62609D
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 51.0).isActive = true
    button.addTarget(self, action: #selector(calculatePressed), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    print(heightSlider.value)
  }
  func setupUI() {
    view.addSubview(backgroundView)
    backgroundView.contentMode = .scaleAspectFill
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    let heightStack = UIStackView(arrangedSubviews: [heightTitle, heightLabel])
    heightStack.axis = .horizontal
    heightStack.alignment = .fill
    heightStack.distribution = .equalSpacing
    heightStack.translatesAutoresizingMaskIntoConstraints = false
    heightStack.heightAnchor.constraint(equalToConstant: 21.0).isActive = true
    let weightStack = UIStackView(arrangedSubviews: [weightTitle, weightLabel])
    weightStack.axis = .horizontal
    weightStack.alignment = .fill
    weightStack.distribution = .equalSpacing
    weightStack.translatesAutoresizingMaskIntoConstraints = false
    weightStack.heightAnchor.constraint(equalToConstant: 21.0).isActive = true
    let stack = UIStackView(arrangedSubviews: [titleLabel, heightStack, heightSlider, weightStack, weightSlider, calculateButton])
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fillProportionally
    stack.spacing = 10
    view.addSubview(stack)
    let margins = view.layoutMarginsGuide
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
    stack.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    stack.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    stack.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
  }
  @objc func heightSliderChanged(_ sender: UISlider) {
    heightLabel.text = String(format: "%.2fm", sender.value)
  }
  
  @objc func weightSliderChanged(_ sender: UISlider) {
    weightLabel.text = String(format: "%.0fKg", sender.value)
  }
  
  @objc func calculatePressed(_ sender: UIButton) {
    let weight = weightSlider.value
    let height = heightSlider.value
    let bmi = weight / (height * height)
    let controller = ResultViewController()
    controller.value = String(format: "%.1f", bmi)
    self.present(controller, animated: true, completion: nil)
  }
}
