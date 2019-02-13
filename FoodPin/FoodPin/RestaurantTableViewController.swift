//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 張芷瑄 on 2019/1/29.
//  Copyright © 2019 MaggieChang. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
   var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For Kee Restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate","Palomino Espresso","Upstate","Traif","Graham Avenue Meats And Deli","Waffle & Wolf","Five Leaves","Cafe Lore","Confessional","Barrafina","Donostia","Royal Oak","CASK Pub and Kitchen"]
    
    var restaurantImages = ["cafedeadend","homei","teakha","cafeloisl","petiteoyster","forkeerestaurant","posatelier","bourkestreetbakery","haighschocolate","palominoespresso","upstate","traif","grahamavenuemeats","wafflewolf","fiveleaves","cafelore","confessional","barrafina","donostia","royaloak","caskpubkitchen"]
    
    var restaurantIsVisited = [false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    //表格列要顯示時會被呼叫
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "mag"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier,for: indexPath)as!RestaurantTableViewCell
    
        //設定cell
        //? Optional，要存取textLabel的屬性，必須要先確認textLabel有沒有值
        //indexPath.row => 目前正在顯示的列
        //cell.textLabel?.text => 文字標籤要顯示的文字
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
    
        //檢查餐廳是否有被勾選起來，true->顯示打勾，false->不顯示打勾
        //        if restaurantIsVisited[indexPath.row]{
        //            cell.accessoryType = .checkmark
        //        }else{
        //            cell.accessoryType = .none
        //        }
        //三元運算子
        cell.accessoryType = restaurantIsVisited[indexPath.row] ? .checkmark :.none
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //建立一個選單作為動作清單
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .alert)
        
        //加入動作至選單中
        let cancelMenu = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelMenu)
        
 
        
        //加入打電話的動作
        //「閉包」closure：將程式碼區塊當做值。通常是包覆在一對大括號內。
        let callActionHandler = { (action:UIAlertAction!) //閉包的參數與回傳型態
            -> Void in //in關鍵字指示閉包本體的開始位置
            let alertMessage = UIAlertController(title: "Service Unavailable", message:"Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage,animated: true,completion: nil)
        }
        let callAction = UIAlertAction(title: "Call"+"123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
        //加入打卡動作
        let checkInAction = UIAlertAction(title: "Check in", style: .default, handler: {
            (action:UIAlertAction!)-> Void in
            
            let cell = tableView.cellForRow(at: indexPath) //indexPath -> 所選取的寶表格cell與索引值
            cell?.accessoryType = .checkmark //檢查cell是否存在，如果存在的話可以允許設定accessoryType
            self.restaurantIsVisited[indexPath.row] = true
        })
        optionMenu.addAction(checkInAction)
        
        //呈現選單
        present(optionMenu,animated: true,completion: nil)
        //取消列的選取
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //自動調整cell的寬度
        tableView.cellLayoutMarginsFollowReadableWidth = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    //滑動刪除功能
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //使用remove(at:)從資料源刪除列
            restaurantNames.remove(at: indexPath.row)
            restaurantIsVisited.remove(at: indexPath.row)
            restaurantImages.remove(at: indexPath.row)
        }
        
        //重新載入頁面
        //tableView.reloadData()
        tableView.deleteRows(at: [indexPath], with: .fade)//fade是刪除陣列的動畫方式
        
        //除錯
        print("Total item:\(restaurantNames.count)")
        for name in restaurantNames{
            print(name)
        }
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //建立刪除動作
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){(action,sourceView,completionHandler) in
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantImages.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
            //呼叫完成就處理器來取消動作按鈕
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share"){(action,sourceView,completionHandler) in
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            
            
//            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
//            self.present(activityController,animated: true, completion: nil)
//            completionHandler(true)
            
            let activityController : UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]){
                activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            }else{
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
                
                completionHandler(true)
            }
            
            self.present(activityController,animated: true,completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60.0/255.0, alpha: 1.0)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38.0/255.0, alpha: 1.0)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        
        return swipeConfiguration
}

    // MARK: - Table view data source

    //表格視圖只有一塊
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //回傳儲存在陣列中的全部餐廳數
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
