//
//  ResultViewController.swift
//  BMI
//
//  Created by Vladimir Fibe on 16.02.2022.
//

import SwiftUI

class ResultViewController: UIViewController {
  var bmi: BMI?
  let backgroundView = UIImageView(image: UIImage(named: "result_background"))
  let titleLabel: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.text = "YOUR RESULT"
    label.font = .boldSystemFont(ofSize: 35)
    label.textAlignment = .center
    return label
  }()
  let resultLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .boldSystemFont(ofSize: 80)
    label.textColor = .white
    return label
  }()
  let subtitleLabel: UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 20, weight: .light)
    label.textColor = .white
    label.text = "EAT SOME MORE SNACKS!"
    return label
  }()
  
  let recalculateButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("RECALCULATE", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 20.0)
    button.tintColor = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1) // 7472D2
    button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    button.layer.cornerRadius = 10
    button.clipsToBounds = true
    button.translatesAutoresizingMaskIntoConstraints = false
    button.heightAnchor.constraint(equalToConstant: 51.0).isActive = true
    button.addTarget(nil, action: #selector(recalculatePressed), for: .touchUpInside)
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = bmi?.color ?? #colorLiteral(red: 0.2, green: 0.4823529412, blue: 0.7725490196, alpha: 1) // 337BC5
    view.addSubview(backgroundView)
    backgroundView.contentMode = .scaleAspectFill
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    resultLabel.text = bmi?.title ?? "0.0"
    subtitleLabel.text = bmi?.advice ?? ""
    view.addSubview(recalculateButton)
    let margins = view.layoutMarginsGuide
    recalculateButton.translatesAutoresizingMaskIntoConstraints = false
    recalculateButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -20).isActive = true
    recalculateButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
    recalculateButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
    recalculateButton.heightAnchor.constraint(equalToConstant: 51).isActive = true

    let stack = UIStackView(arrangedSubviews: [titleLabel, resultLabel, subtitleLabel])
    stack.axis = .vertical
    stack.alignment = .fill
    stack.distribution = .fill
    stack.spacing = 8.0
    view.addSubview(stack)
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    stack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
  @objc func recalculatePressed(_ sender: UIButton) {
    self.dismiss(animated: true)
  }
}

struct ResultViewControllerSUI: UIViewControllerRepresentable {
  typealias UIViewControllerType = ResultViewController
  
  func makeUIViewController(context: Context) -> UIViewControllerType {
    let viewController = UIViewControllerType()
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    
  }
}

struct ResultViewController_Previews: PreviewProvider {
  static var previews: some View {
    ResultViewControllerSUI()
      .edgesIgnoringSafeArea(.all)
  }
}

