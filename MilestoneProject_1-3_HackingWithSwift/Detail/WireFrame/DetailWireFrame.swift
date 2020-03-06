//
//  DetailWireFrame.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit


class DetailWireFrame : DetailWireFrameProtocol {
    var controller: DetailViewController
    init(controller : DetailViewController) {
        self.controller = controller
    }
    
    static func createModule(viewRef: DetailViewController) {
        let presenter : DetailPresenterProtocol & DetailOutputInteractorProtocol = DetailPresenter()
        viewRef.presenter = presenter
        viewRef.presenter?.view = viewRef
        viewRef.presenter?.wireframe = DetailWireFrame(controller: viewRef)
    }
    
    
}
