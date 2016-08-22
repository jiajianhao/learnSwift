//
//  JJHButtonViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit

class JJHButtonViewController: UIViewController {
    var mButton : UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.doAddSubview()
        
        // Do any additional setup after loading the view.
    }
    
    func doAddSubview() {
        mButton = UIButton()
        mButton!.frame = CGRectMake(0, 10, screen_width, 50)
        mButton!.backgroundColor=JJHRGB(20, g: 40, b: 80)
        mButton!.setTitle("未选", forState: UIControlState.Normal)
        mButton!.setTitle("未选", forState: UIControlState.Highlighted)
        mButton!.setTitle("已选", forState: UIControlState.Selected)
        mButton!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(mButton!)
    }

    func pressBtn(sender:UIButton) {
        if (sender.selected) {
            print("取消选中")
            sender.selected = false
        }
        else{
            print("选中按钮")
            sender.selected = true

        }
        
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
