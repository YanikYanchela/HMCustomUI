//
//  AlertView.swift
//  CustomUI
//
//  Created by Дмитрий Яновский on 11.01.24.
//


import UIKit


class alertView: UIView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отмена", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemRed
        button.addTarget(self,
                         action: #selector(cancelButtonTapped),
                         for: .touchUpInside)
        return button
    }()

    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подтвердить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemGreen
        button.addTarget(self,
            action: #selector(confirmButtonTapped),
            for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
   

    
    private func setupUI() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.7
        layer.shadowRadius = 5
        layer.shadowOffset = CGSize(width: 2, height: 2.5)
        layer.masksToBounds = true
        
        
        addSubview(titleLabel)
        addSubview(cancelButton)
        addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            cancelButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            cancelButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cancelButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cancelButton.widthAnchor.constraint(equalToConstant: 134),
            cancelButton.heightAnchor.constraint(equalToConstant: 40),
            
            confirmButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            confirmButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            confirmButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            confirmButton.widthAnchor.constraint(equalToConstant: 134),
            confirmButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }

    // MARK: - Public Methods

    func setTitle(_ title: String) {
        titleLabel.text = title
    }

    func setCancelButtonTitle(_ title: String) {
        cancelButton.setTitle(title, for: .normal)
    }

    func setConfirmButtonTitle(_ title: String) {
        confirmButton.setTitle(title, for: .normal)
    }

    @objc private func cancelButtonTapped() {
        print("Cancel button tapped")
        hideAlert()
    }

    @objc private func confirmButtonTapped() {
        print("Confirm button tapped")
        hideAlert()
    }
    
    
  
    func hideAlert() {
            self.removeFromSuperview()
            
        }
    }
    










