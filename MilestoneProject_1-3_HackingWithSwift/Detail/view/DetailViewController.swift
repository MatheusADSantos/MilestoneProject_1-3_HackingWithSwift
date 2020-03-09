//
//  DetailViewController.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController, DetailViewProtocol {
    var presenter: DetailPresenterProtocol?
    static var flagName: String?

    
    let imageFlag : UIImageView = {
        let i = UIImageView()
        i.layer.masksToBounds = true
        i.layer.borderWidth = 1
        return i
    }()
    
    func render() {
        let name = DetailViewController.flagName!.replacingOccurrences(of: "@3x.png", with: "")
        title = name.uppercased()
        view.backgroundColor = .white
        imageFlag.image = UIImage(named: DetailViewController.flagName!)
        view.addSubview(imageFlag)
        
        imageFlag.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.height.equalTo(UIScreen.main.bounds.width/2)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createModule(viewRef: self)
        presenter?.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(shareTapped))
        
    }
    
    
    @objc func shareTapped() {
        guard let nameImage = DetailViewController.flagName else { return }
        let image = UIImage(named: nameImage)
        
        guard let imageData = image?.jpegData(compressionQuality: 0.8) else {
            print("deu ruim")
            return
        }
        
        let activityVC = UIActivityViewController.init(activityItems: [imageData], applicationActivities: [])
        activityVC.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(activityVC, animated: true)
    }


}
