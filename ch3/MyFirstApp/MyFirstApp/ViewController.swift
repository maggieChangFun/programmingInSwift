//
//  ViewController.swift
//  MyFirstApp
//
//  Created by maggieChang on 2019/1/2.
//  Copyright © 2019 MaggieChang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    //顯示表情符號文字表示
    @IBAction func showMessage(sender: UIButton) {
        
        //建立存放表情符號的字典
        var emojiDict = ["🤥":"lie","👻":"ghost","🤐":"shut up","👾":"monster"]
        
        // sender 是使用者所按下的按鈕
        // 這裡我們將 sender 儲存至 selectedButton constant
        let selectedButton = sender
        
        if (selectedButton.titleLabel?.text) != nil {
            
            // 前端所按的參數
            let meaning = sender.currentTitle
            
            // Change the line below to display the meaning of the emoji instead of Hello World
            let alertController = UIAlertController(title: "Welcome to My First App", message: emojiDict[meaning!], preferredStyle: UIAlertController.Style.alert)
            
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            
            //顯示訊息
            present(alertController, animated: true, completion: nil)
        }
    }

}

