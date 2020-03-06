//
//  ViewController.swift
//  MilestoneProject_1-3_HackingWithSwift
//
//  Created by macbook-estagio on 06/03/20.
//  Copyright © 2020 macbook-estagio. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController, ViewProtocol {
    var presenter: PresenterProtocol?
    var cellCustom = "cellCustom"
    var images = [String]()
    
    
    func render() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Fun with Flags"
    }

    func searchImages() {
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
//        print("\n\n\n\n IMAGES")
//        for i in items {
//            if i.hasSuffix("3x.png") {
//                print(i)
//                var image = i
////                image = image.replacingOccurrences(of: "@2x.png", with: "")
//                image = image.replacingOccurrences(of: "@3x.png", with: "")
//                self.images.append(image)
//            }
//        }
//        print(images)
//        self.images.sort()
        
        
        
        
        for item in items {
            if item.hasSuffix("3x.png") {
                images.append(item)
            }
        }

    }
    
    func insertImageToTableView() {
        print("ïnsert")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        WireFrame.createModule(viewRef: self)
        presenter?.viewDidload()
        tableView.register(CustomCellTableViewCell.self, forCellReuseIdentifier: cellCustom)
        tableView.dataSource = self
        tableView.delegate = self
    }

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 0
//    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellCustom, for: indexPath) as! CustomCellTableViewCell
        cell.imagePhoto.image = UIImage(named: images[indexPath.row])
        cell.imagePhoto.layer.borderColor = UIColor.black.cgColor
        cell.imagePhoto.layer.borderWidth = 1
        
        cell.label.text = images[indexPath.row].uppercased()
        cell.accessoryType = .detailDisclosureButton
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellCustom, for: indexPath)
//        cell.imageView?.image = UIImage(named: images[indexPath.row])
//        cell.textLabel?.text = images[indexPath.row].uppercased()
//        cell.accessoryType = .detailButton
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    var lastIndex : IndexPath?
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let value = tableView.cellForRow(at: indexPath)?.accessoryType.rawValue else { return }
        print(value)
        print(lastIndex)
        if (value == 2) {
            if ((lastIndex?.hashValue) != nil) {
                tableView.cellForRow(at: lastIndex!)?.accessoryType = .detailDisclosureButton
            }
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .detailDisclosureButton
        }
        lastIndex = indexPath
        
        presenter?.goToDetailViewController(images[indexPath.row])
    }
}

