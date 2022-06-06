//
//  CustomAlert.swift
//  FirstApp
//
//  Created by Вячеслав Терентьев on 06.06.2022.
//

import UIKit

class CustomAlert {
    
    
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
//        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let alertView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let scrollView = UIScrollView()
    
    private var mainView: UIView?
    
    private let setTextTextField = UITextField()
    private let repsTextField = UITextField()
    
    func alertCustom(viewController: UIViewController,
                     repsOrTimer: String,
                     completion: @escaping (String, String) -> Void) {
        
        guard let parrentView = viewController.view else { return }
        mainView = parrentView
        
        scrollView.frame = parrentView.frame
        parrentView.addSubview(scrollView)
        
        backgroundView.frame = parrentView.frame
        scrollView.addSubview(backgroundView)
        
        alertView.frame = CGRect(x: 40,
                                 y: -420,
                                 width: parrentView.frame.width - 80,
                                 height: 420)
        
        scrollView.addSubview(alertView)
        
        let spotsmanImageView = UIImageView(frame: CGRect(x: (alertView.frame.width - alertView.frame.height * 0.4) / 2,
                                                          y: 30,
                                                          width: alertView.frame.height * 0.4,
                                                          height: alertView.frame.height * 0.4))
        spotsmanImageView.image = UIImage(named: "sportsmanAlert")
        spotsmanImageView.contentMode = .scaleAspectFit
        alertView.addSubview(spotsmanImageView)
        
        let editingLabel = UILabel(frame: CGRect(x: 10,
                                                 y: alertView.frame.height * 0.4 + 50,
                                                 width: alertView.frame.width - 20,
                                                 height: 25))
        
        editingLabel.text = "Editing"
        editingLabel.textAlignment = .center
        editingLabel.font = .robotoMedium22()
        alertView.addSubview(editingLabel)
        
        let setsLabel = UILabel(text: "Sets")
        setsLabel.translatesAutoresizingMaskIntoConstraints = true
        setsLabel.frame = CGRect(x: 30,
                                 y: editingLabel.frame.maxY + 10,
                                 width: alertView.frame.width - 60,
                                 height: 20)
        alertView.addSubview(setsLabel)
        
        setTextTextField.frame = CGRect(x: 20,
                                        y: setsLabel.frame.maxY,
                                        width: alertView.frame.width - 40,
                                        height: 30)
        
        setTextTextField.backgroundColor = .specialBrown
        setTextTextField.borderStyle = .none
        setTextTextField.layer.cornerRadius = 10
        setTextTextField.textColor = .specialGray
        setTextTextField.font = .robotoBold20()
        setTextTextField.leftView = UIView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: 15,
                                                   height: setTextTextField.frame.height))
        setTextTextField.leftViewMode = .always
        setTextTextField.clearButtonMode = .always
        setTextTextField.returnKeyType = .done
        setTextTextField.keyboardType = .numberPad
        alertView.addSubview(setTextTextField)
        
        let repsOrTimerLabel = UILabel(text: repsOrTimer)
        repsOrTimerLabel.translatesAutoresizingMaskIntoConstraints = true
        repsOrTimerLabel.frame = CGRect(x: 30,
                                        y: setTextTextField.frame.maxY + 3,
                                        width: alertView.frame.width - 60,
                                        height: 20)
        alertView.addSubview(repsOrTimerLabel)
        
        
        repsTextField.frame = CGRect(x: 20,
                                        y: repsOrTimerLabel.frame.maxY,
                                        width: alertView.frame.width - 40,
                                        height: 30)
        
        repsTextField.backgroundColor = .specialBrown
        repsTextField.borderStyle = .none
        repsTextField.layer.cornerRadius = 10
        repsTextField.textColor = .specialGray
        repsTextField.font = .robotoBold20()
        repsTextField.leftView = UIView(frame: CGRect(x: 0,
                                                   y: 0,
                                                   width: 15,
                                                   height: repsTextField.frame.height))
        repsTextField.leftViewMode = .always
        repsTextField.clearButtonMode = .always
        repsTextField.returnKeyType = .done
        repsTextField.keyboardType = .numberPad
        alertView.addSubview(repsTextField)
        
        let okButton = UIButton(frame: CGRect(x: 50,
                                              y: repsTextField.frame.maxY + 15,
                                              width: alertView.frame.width - 100,
                                              height: 35))
        okButton.backgroundColor = .specialGreen
        okButton.setTitle("OK", for: .normal)
        okButton.titleLabel?.textColor = .white
        okButton.titleLabel?.font = .robotoMedium18()
        okButton.layer.cornerRadius = 10
        okButton.addTarget(self, action: #selector(okButtonTapped), for: .touchUpInside)
        alertView.addSubview(okButton)
        
        UIView.animate(withDuration: 0.3) {
            self.backgroundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = parrentView.center
                }
            }
        }

    }
    
    @objc private func okButtonTapped() {
        guard let targetView = mainView else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 40,
                                          y: targetView.frame.height,
                                          width: targetView.frame.width - 80,
                                          height: 420)
        } completion: { done in
            UIView.animate(withDuration: 0.3) {
                self.backgroundView.alpha = 0
            } completion: { done in
                if done {
                    self.alertView.removeFromSuperview()
                    self.backgroundView.removeFromSuperview()
                    self.scrollView.removeFromSuperview()
                    self.setTextTextField.text = ""
                    self.repsTextField.text = ""
                }
            }
        }
    }
}
