//
//  ViewController.swift
//  CaringCollection
//
//  Created by Vyacheslav Pronin on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var memes = [String]()
    
    private lazy var collectionView: UICollectionView = {
        let layout = CustomFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: Constant.width, height: Constant.height)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        view.showsHorizontalScrollIndicator = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        memes = ["cats", "arozgovorov", "monkeys", "ouMay",
                 "paebat", "party", "pischu", "top", "ucheny",
                 "what", "yea", "yes", "zapret", "zapret2"]
        
        setup()
        setupConstraint()
    }
}

extension ViewController: UICollectionViewDelegate,
                          UICollectionViewDataSource,
                          UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionCell.identifier,
                                                            for: indexPath) as? CollectionCell
        else { return .init() }
        cell.setupImage(image: UIImage(named: memes[indexPath.row]))
        
        return cell
    }
    
    func collectionView(_: UICollectionView, layout: UICollectionViewLayout,
                        insetForSectionAt: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 0, left: Constant.space, bottom: 0, right: Constant.space)
    }
}

private extension ViewController {
   
    func setup() {
        [collectionView].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionCell.self,
                                forCellWithReuseIdentifier: CollectionCell.identifier)
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        title = "Collection"
    }
    
    func setupConstraint() {
        let safeGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: safeGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor)
        ])
    }
}
