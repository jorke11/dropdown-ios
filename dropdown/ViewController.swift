//
//  ViewController.swift
//  dropdown
//
//  Created by Jorge Pinedo on 7/24/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    @IBOutlet weak var btnNumber: UIButton!
    @IBOutlet weak var tblDropDown: UITableView!
    @IBOutlet weak var tblDropDownHW: NSLayoutConstraint!
    var isTableVisible=false
    
    @IBOutlet weak var tblDropDown2: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDropDown.delegate = self
        tblDropDown.dataSource = self
        
        tblDropDown2.delegate = self
        tblDropDown2.dataSource = self
        
        tblDropDownHW.constant = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func selectNumber(_ sender: AnyObject){
        print("asdas")
        UIView.animate(withDuration: 0.5){
            if self.isTableVisible == false{
                self.isTableVisible = true
                self.tblDropDownHW.constant = 44.0 * 3.0
            }else{
                self.tblDropDownHW.constant=0
                self.isTableVisible = false
            }

            self.view.layoutIfNeeded()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "numbers")
        if cell == nil{
            cell = UITableViewCell(style: .default, reuseIdentifier: "numbers")
            
        }
        cell?.textLabel?.text = "\(indexPath.row) roms"
        print(indexPath.row)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    btnNumber.setTitle("Rooms selected \(indexPath.row+1)", for: .normal)
        UIView.animate(withDuration:0.5){
            self.tblDropDownHW.constant = 0
            self.isTableVisible = false
            self.view.layoutIfNeeded()
        }
    }
}


