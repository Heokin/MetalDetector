//
//  SecondOnBoarding.swift
//  BuilderHelper
//
//  Created by Kirill Sedliarov on 10.11.22.
//

import Foundation
import UIKit

class SecondOnBoarding: UICollectionViewCell {

    public static var id = "second"
    
    let local = LocalizationVariables()
    
    lazy var label = Label(type: .boardingHeader, local.secondOnBoardingHeader)
    lazy var mainImage = ImageView(image: .boardingBig)
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SecondOnBoarding {
    
    func setup() {

        addSubview(label)
        addSubview(mainImage)
        
        mainImage.image = UIImage(named: "box")

        NSLayoutConstraint.activate([

            mainImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 23),
            mainImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -23),
            mainImage.topAnchor.constraint(equalTo: topAnchor, constant: UIScreen.main.bounds.height/6.766),
            mainImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height/2.333),
            
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -UIScreen.main.bounds.height/5.107),
            
        ])
    }
}
