//
//  ViewController.swift
//  CustomUI
//
//  Created by Дмитрий Яновский on 11.01.24.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
       
        setupButton()
    }

  

    func setupButton() {
        let buttonAlert = UIButton()
        buttonAlert.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonAlert)
        buttonAlert.setTitle("Alert Show", for: .normal)
        buttonAlert.tintColor = .black
        buttonAlert.setTitleColor(.black, for: .normal)
        buttonAlert.backgroundColor = .white
        buttonAlert.layer.borderWidth = 1
        buttonAlert.layer.cornerRadius = 10
        buttonAlert.layer.shadowColor = UIColor.black.cgColor
        buttonAlert.layer.shadowOpacity = 0.7
        buttonAlert.layer.shadowRadius = 5
        buttonAlert.layer.shadowOffset = CGSize(width: 2, height: 2.5)
        
        let constraints = [
            buttonAlert.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonAlert.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonAlert.widthAnchor.constraint(equalToConstant: 150),
            buttonAlert.heightAnchor.constraint(equalToConstant: 50)
        ]
        NSLayoutConstraint.activate(constraints)
        buttonAlert.addTarget(self, action: #selector(self.checkButton(sender:)), for: .touchUpInside)
    }

    @objc func checkButton(sender: UIButton) {
        print("check button")
        let customAlert = alertView(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
       
               customAlert.setTitle("Warning!!!")
               customAlert.setCancelButtonTitle("Cancel")
               customAlert.setConfirmButtonTitle("Ok")
        UIView.animate(withDuration: 1, delay: 0,usingSpringWithDamping: 0.1, initialSpringVelocity: 0.2, options: [], animations: {
            customAlert.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        })
        
        
        view.addSubview(customAlert)
       
        customAlert.center = view.center
        self.animatedButton(sender)
    }

    func animatedButton(_ viewAnimate: UIView) {
        UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            viewAnimate.transform = CGAffineTransform(scaleX: 0.98, y: 0.98)
        }) { finiched in
            UIView.animate(withDuration: 0.1, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 2, options: .curveEaseIn, animations: {
                viewAnimate.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
    }
}



