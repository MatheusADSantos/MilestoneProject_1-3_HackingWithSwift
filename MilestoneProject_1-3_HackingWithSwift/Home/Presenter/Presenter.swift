//
//  Presenter.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import Foundation
import UIKit

class Presenter : PresenterProtocol {
    var view: HomeViewController?
    
    var interactor: InputInteractorProtocol?
    
    var output: OutputInteractorProtocol?
    
    var wireFrame: WireFrameProtocol?
    
    func viewDidload() {
        view?.render()
        view?.searchImages()
        view?.insertImageToTableView()
    }
    
    func goToDetailViewController(_ flag:String) {
        wireFrame?.goToDetailViewController(flag)
    }
    
    
}


extension Presenter : OutputInteractorProtocol {
    
}
