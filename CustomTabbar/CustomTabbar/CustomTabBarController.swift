//
//  CustomTabBarController.swift
//  CustomTabbar
//
//  Created by macc on 16/7/19.
//  Copyright © 2016年 ZhengGuiJie. All rights reserved.
//

import UIKit
/// tabbar圆弧高度
let layerHeight: CGFloat = 10
/// 屏幕宽度
let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
/// 屏幕高度
let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTabBar()
        setControllers()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CustomTabBarController: UITabBarControllerDelegate {
    //MARK: 在这里，代理。。如果模态到第二个控制器，必须要用到此代理
    func tabBarController(tabBarController: UITabBarController, shouldSelectViewController viewController: UIViewController) -> Bool {
        if viewController.tabBarItem.tag == 1 {
            let editLiveVC = SecondViewController()
            //点击到第二个控制器，不选中此控制器，而是模态到此控制器
            self.presentViewController(editLiveVC, animated: true, completion: nil)

            return false
        } else {
            return true
        }
    }
}

//MARK: -CustomMethod-
private extension CustomTabBarController {
    /**
     设置tabbar UI
     */
    func setUpTabBar() {
        /// 贝塞尔曲线低tabbar的高度
        let downHeight: CGFloat = 0.2
        /// layer的宽度
        let layerLineWidth: CGFloat = 0.3
        let layer = CAShapeLayer()
        let beizer = UIBezierPath()
        let startPoint = CGPointMake(SCREEN_WIDTH / 2 - layerHeight * 3, downHeight)
        let endPoint = CGPointMake(SCREEN_WIDTH / 2 + layerHeight * 3, downHeight)
        beizer.moveToPoint(CGPointMake(0, downHeight))
        beizer.addLineToPoint(startPoint)
        beizer.addQuadCurveToPoint(endPoint, controlPoint: CGPointMake(SCREEN_WIDTH / 2, -layerHeight * 2))
        beizer.addLineToPoint(CGPointMake(SCREEN_WIDTH, downHeight))
        layer.path = beizer.CGPath
        layer.lineWidth = layerLineWidth
        layer.fillColor = UIColor.whiteColor().CGColor
        layer.strokeColor = UIColor.cyanColor().CGColor
        self.tabBar.backgroundColor = UIColor.whiteColor()
        self.tabBar.layer.addSublayer(layer)
        
        //隐藏阴影线---缺一不可
        self.tabBar.shadowImage = UIImage()
        self.tabBar.backgroundImage = UIImage()
    }
    
    
    
    func setControllers() {
        
        //MARK: imageInsets 改变item图像的位置
        let vc1 = FirstViewController()
        
        let na1 = UINavigationController(rootViewController: vc1)
        vc1.navigationItem.title = "一"
        
        na1.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        na1.tabBarItem.image = UIImage(named: "tab_bar_look_nor")
        
        let editVC = SecondViewController()
        editVC.initTabBarItem()
        editVC.view.backgroundColor = UIColor.orangeColor()
        editVC.tabBarItem.imageInsets = UIEdgeInsetsMake(-6, 0, 6, 0)
        editVC.tabBarItem.image = UIImage(named: "tab_bar_live_hig")

        
        let meVC = ThirdViewController()
        let meNavi = UINavigationController(rootViewController: meVC)
        meVC.navigationItem.title = "三"
        meNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        meNavi.tabBarItem.image = UIImage(named: "tab_bar_me_nor")

        
        viewControllers = [na1, editVC, meNavi];
    }
}






