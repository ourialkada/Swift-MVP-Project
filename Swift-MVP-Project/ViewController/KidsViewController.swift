//
//  HomeViewController.swift
//  Swift-MVP-Project
//
//  Created by Ouri -Live Care on 8/26/19.
//  Copyright © 2019 Ouri Alkada. All rights reserved.
//

import Foundation
import UIKit

class KidsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,KidsViewDelegate {
    private let kidsViewPresentor = KidsViewPresentor()
    
    static var ID = ""
    static var type = ""
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Spinner.start()
        kidsViewPresentor.setViewDelegate(kidsViewDelegate: self)
        kidsViewPresentor.getdoc()
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
        return (KidsViewPresentor.kidsCells.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let shirt = KidsViewPresentor.kidsCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "kidsCell") as! CellModel
        cell.setCell(list: shirt)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let shirt = KidsViewPresentor.kidsCells[indexPath.row]
        KidsViewController.ID = shirt.id
        KidsViewController.type = shirt.type
        DetailScreenPresentor.page = shirt.type
        
        let p = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "detailScreen") as! DetailScreenViewController
        self.addChild(p)
        p.view.frame = self.view.frame
        self.view.addSubview(p.view)
        p.didMove(toParent: self)
        
        
    }
    
}

