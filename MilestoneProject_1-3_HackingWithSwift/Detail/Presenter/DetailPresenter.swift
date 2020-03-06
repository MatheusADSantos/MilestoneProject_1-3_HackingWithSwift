//
//  DetailPresenter.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import Foundation
import UIKit

class DetailPresenter : DetailPresenterProtocol {
    var view: DetailViewProtocol?
    
    var interactor: DetailInputInteractorProtocol?
    
    var output: DetailOutputInteractorProtocol?
    
    var wireframe: DetailWireFrameProtocol?
    
    func viewDidLoad() {
        view?.render()
    }
    
    
}


extension  DetailPresenter : DetailOutputInteractorProtocol {
    //
}
