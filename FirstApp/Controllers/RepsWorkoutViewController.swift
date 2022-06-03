//
//  RepsWorkoutViewController.swift
//  FirstApp
//
//  Created by Вячеслав Терентьев on 01.06.2022.
//

import UIKit

class RepsWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "СТАРТ ТРЕНИРОВКИ"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "closeButton"), for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let sportmanImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "sportsman")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("FINISH", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let detailsLabel = UILabel(text: "Details")
    
    private let workoutParametersView = WorkoutParametersView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(sportmanImageView)
        view.addSubview(detailsLabel)
        view.addSubview(workoutParametersView)
        view.addSubview(finishButton)
    }
    
    @objc private func closeButtonTapped() {
        print("closeButtonTapped")
    }
    
    @objc private func finishButtonTapped() {
        print("finishButtonTapped")
    }
}

//MARK: - SetConstraints

extension RepsWorkoutViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 30),
            closeButton.widthAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            sportmanImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 30),
            sportmanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            sportmanImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
//            sportmanImageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        ])
        
        NSLayoutConstraint.activate([
            detailsLabel.topAnchor.constraint(equalTo: sportmanImageView.bottomAnchor, constant: 25),
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        ])
        
        NSLayoutConstraint.activate([
            workoutParametersView.topAnchor.constraint(equalTo: detailsLabel.bottomAnchor, constant: 3),
            workoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            workoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            workoutParametersView.heightAnchor.constraint(equalToConstant: 240)
        ])
        
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 10),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
