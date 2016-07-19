//
//  SecondViewController.swift
//  CustomTabbar
//
//  Created by macc on 16/7/19.
//  Copyright © 2016年 ZhengGuiJie. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      view.backgroundColor = UIColor.orangeColor()
        // Do any additional setup after loading the view.
    }

    func initTabBarItem() {
        self.tabBarItem.tag = 1
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
