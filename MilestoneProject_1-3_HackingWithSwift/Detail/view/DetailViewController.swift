//
//  DetailViewController.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    var presenter: DetailPresenterProtocol?
    
    func render() {
        view.backgroundColor = .red
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        DetailWireFrame.createModule(viewRef: self)
        presenter?.viewDidLoad()
    }
    


}
