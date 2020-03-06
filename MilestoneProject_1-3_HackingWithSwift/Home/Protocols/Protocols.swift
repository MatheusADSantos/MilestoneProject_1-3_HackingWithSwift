//
//  Protocols.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import Foundation
import UIKit

protocol ViewProtocol : class {
    var presenter : PresenterProtocol? { get set }
    func render()
    func searchImages()
    func insertImageToTableView()
}
protocol InputInteractorProtocol : class {
    //
}
protocol  OutputInteractorProtocol : class {
    //
}
protocol PresenterProtocol : class {
    var view : HomeViewController? { get set}
    var interactor : InputInteractorProtocol? { get set }
    var output : OutputInteractorProtocol? { get set }
    var wireFrame: WireFrameProtocol? { get set }
    
    func viewDidload()
    func goToDetailViewController(_ flag:String)
}
protocol WireFrameProtocol : class {
    var controller : HomeViewController { get set }
    
    static func createModule(viewRef : HomeViewController)
    func goToDetailViewController(_ flag:String)
}
