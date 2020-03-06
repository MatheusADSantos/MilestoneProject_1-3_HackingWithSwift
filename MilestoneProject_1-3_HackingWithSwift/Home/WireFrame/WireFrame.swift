//
//  WireFrame.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import Foundation
import UIKit

class WireFrame : WireFrameProtocol {
    var controller: HomeViewController
    
    init(_ controller : HomeViewController) {
        self.controller = controller
    }
    
    static func createModule(viewRef: HomeViewController) {
        let presenter : PresenterProtocol & OutputInteractorProtocol = Presenter()
        viewRef.presenter = presenter
        viewRef.presenter?.view = viewRef
//        viewRef.presenter?.interactor =
//        viewRef.presenter?.output =
        viewRef.presenter?.wireFrame = WireFrame(viewRef)
    }
    
    func goToDetailViewController(_ flag:String) {
//        DetailViewController().flag = flag
        controller.navigationController?.pushViewController(DetailViewController(), animated: true)
    }
    
    
}
