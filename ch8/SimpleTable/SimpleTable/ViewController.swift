//
//  ViewController.swift
//  SimpleTable
//
//  Created by 張芷瑄 on 2019/1/28.
//  Copyright © 2019 MaggieChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    //陣列，餐廳名字
    var restaurantName = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //回傳區塊中的列數
        return restaurantName.count
    }
    
    //表格列要顯示時會被呼叫
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mag"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath)
        
        //設定cell
        //? Optional，要存取textLabel的屬性，必須要先確認textLabel有沒有值
        //indexPath.row => 目前正在顯示的列
        //cell.textLabel?.text => 文字標籤要顯示的文字
        cell.textLabel?.text = restaurantName[indexPath.row]
        cell.imageView?.image = UIImage(named: "restaurant")
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //指示視圖控制器要隱藏狀態列
    override var prefersStatusBarHidden: Bool{
        return true
    }
}

