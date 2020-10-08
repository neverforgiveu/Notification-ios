//
//  ViewController.swift
//  NotificationIOS
//
//  Created by Cooli on 2020/10/7.
//  Copyright © 2020 Cooli. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func notify(_ sender: UIButton) {
        let content = UNMutableNotificationContent() //通知標題＋副標＋內容
        content.title = "通知"
        content.subtitle = "ios"
        content.body = "今天是禮拜三"
        content.sound = UNNotificationSound.default
        content.badge = 1
        
        
        
      /*  let tempDirURL = URL(fileURLWithPath: NSTemporaryDirectory(), isDirectory:  true)//回傳暫存檔目錄
        
        let tempFileURL = tempDirURL.appendingPathComponent("suggested-apple.jpg")
      */
        
        let imageURL: URL = Bundle.main.url(forResource: "apple", withExtension: "png")!  //取得bundle物件
        let attachment = try! UNNotificationAttachment(identifier: "image", url: imageURL, options: nil)
        
        content.attachments = [attachment]
        
         content.userInfo = ["link" : "https://www.google.com/?client=safari&channel=mac_bm"]
        
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10 , repeats: false)//觸發器
        let request = UNNotificationRequest(identifier: "1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler:{
            error in  print("成功建立通知...")
        }) //排定通知
    }
    
    
}

