//
//  CollectionCell.swift
//  CaringCollection
//
//  Created by Vyacheslav Pronin on 27.07.2023.
//

import UIKit

final class CollectionCell: UICollectionViewCell {
    
    static let identifier = "CollectionCell"
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemYellow
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImage(image: UIImage?) {
        iconView.image = image
    }
}

private extension CollectionCell {
    
    func setup() {
        iconView.image = nil
        backgroundColor = .clear
        [iconView].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        setupConstraint()
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: Constant.height),
            iconView.widthAnchor.constraint(equalToConstant: Constant.width),
            
            iconView.topAnchor.constraint(equalTo: contentView.topAnchor),
            iconView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            iconView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            iconView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
