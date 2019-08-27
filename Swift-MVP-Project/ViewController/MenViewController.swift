//
//  HomeViewController.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import UIKit

class MenViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,MenViewDelegate {
    
    
    private let menViewPresentor = MenViewPresentor()
    @IBOutlet weak var tableView: UITableView!
    static var ID = ""
    static var type = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        Spinner.start()
        menViewPresentor.setViewDelegate(menViewDelegate: self)
        menViewPresentor.getdoc()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            Spinner.stop()
        })
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (MenViewPresentor.MenCells.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shirt = MenViewPresentor.MenCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "menCell") as! CellModel
        cell.setCell(list: shirt)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shirt = MenViewPresentor.MenCells[indexPath.row]
        MenViewController.ID = shirt.id
        MenViewController.type = shirt.type
        DetailScreenPresentor.page = shirt.type
        let p = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailScreen") as! DetailScreenViewController
        self.addChild(p)
        p.view.frame = self.view.frame
        self.view.addSubview(p.view)
        p.didMove(toParent: self)
    }
    
    
}

