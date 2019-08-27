//
//  HomeViewController.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import UIKit

class WomenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,WomenViewDelegate {
    private let womenViewPresentor = WomenViewPresentor()
    static var ID = ""
    static var type = ""
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Spinner.start()
        womenViewPresentor.setViewDelegate(womenViewDelegate: self)
        womenViewPresentor.getdoc()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.tableview.delegate = self
            self.tableview.dataSource = self
            
            Spinner.stop()
        })
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (WomenViewPresentor.WomenCells.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let shirt = WomenViewPresentor.WomenCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "womenCell") as! CellModel
        cell.setCell(list: shirt)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shirt = WomenViewPresentor.WomenCells[indexPath.row]
        WomenViewController.ID = shirt.id
        WomenViewController.type = shirt.type
        DetailScreenPresentor.page = shirt.type
        
        let p = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailScreen") as! DetailScreenViewController
        self.addChild(p)
        p.view.frame = self.view.frame
        self.view.addSubview(p.view)
        p.didMove(toParent: self)
    }
    
}

