//
//  ProtocolsDetail.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import Foundation
import UIKit

protocol DetailViewProtocol: class {
    var presenter : DetailPresenterProtocol? { get set }
    
    func render()
}

protocol DetailInputInteractorProtocol: class {
    //
}

protocol DetailOutputInteractorProtocol: class {
    //
}

protocol DetailPresenterProtocol: class {
    var view : DetailViewProtocol? { get set }
    var interactor : DetailInputInteractorProtocol? { get set }
    var output : DetailOutputInteractorProtocol? { get set }
    var wireframe : DetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
}

protocol DetailWireFrameProtocol: class {
    var controller : DetailViewController { get set }
    
    static func createModule(viewRef: DetailViewController)
}
