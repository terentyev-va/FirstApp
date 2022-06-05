//
//  StatisticTableViewCell.swift
//  FirstApp
//
//  Created by Вячеслав Терентьев on 29.05.2022.
//

import UIKit

class StatisticTableViewCell: UITableViewCell {
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Biceps"
        label.textColor = .specialGray
        label.font = .robotoMedium24()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let differenceLabel: UILabel = {
       let label = UILabel()
        label.text = "+2"
        label.textColor = .specialGreen
        label.font = .robotoMedium24()
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let beforeLabel = UILabel(text: "Before: 18")
    private let nowLabel = UILabel(text: "Now: 20")
    
    private let lineView: UIView = {
       let lineView = UIView()
        lineView.backgroundColor = .specialLine
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()
    
    var labelStackView = UIStackView()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        
        addSubview(nameLabel)
        addSubview(differenceLabel)
        
        labelStackView = UIStackView(arrangedSubviews: [beforeLabel, nowLabel],
                                     axis: .horizontal,
                                     spacing: 10)
        addSubview(labelStackView)
        addSubview(lineView)
    }
    
    public func cellConfigure(differenceWorkout: DifferenceWorkout) {
        
        nameLabel.text = differenceWorkout.name
        beforeLabel.text = "Before: \(differenceWorkout.firstReps)"
        nowLabel.text = "Now: \(differenceWorkout.lastReps)"
        
        let difference = differenceWorkout.lastReps - differenceWorkout.firstReps
        differenceLabel.text = "\(difference)"
        
        switch difference {
        case ..<0: differenceLabel.textColor = .specialGreen
        case 1...: differenceLabel.textColor = .specialDarkYellow
        default: differenceLabel.textColor = .specialGray
        }
    }
}

//MARK: - SetConstraints

extension StatisticTableViewCell {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            nameLabel.trailingAnchor.constraint(equalTo: differenceLabel.leadingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            differenceLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            differenceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            differenceLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 0),
            labelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20)
        ])
        
        NSLayoutConstraint.activate([
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
