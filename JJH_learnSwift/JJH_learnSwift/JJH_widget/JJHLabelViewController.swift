//
//  JJHLabelViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit

class JJHLabelViewController: UIViewController {
    var mLabel : UILabel?
    var mLabel1 : UILabel?
    var mLabel2 : UILabel?
    var mLabel3 : UILabel?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
    
        //
        
        // Do any additional setup after loading the view.
        mLabel = UILabel()
        mLabel!.frame=CGRectMake(0, 10, screen_width, 20)
        mLabel!.text="See You Again"
        mLabel!.textColor=UIColor.blackColor()
        mLabel!.backgroundColor=UIColor.purpleColor()
        self.view .addSubview(mLabel!)
        
        
        mLabel1 = UILabel()
        mLabel1!.frame=CGRectMake(0, 40, screen_width, 20)
        mLabel1!.text="See You Again"
        mLabel1!.textColor=UIColor.blackColor()
        mLabel1!.backgroundColor=UIColor.whiteColor()
        self.view .addSubview(mLabel1!)
        
        mLabel2 = UILabel()
        mLabel2!.frame=CGRectMake(0, 70, screen_width, 20)
        mLabel2!.text="See You Again"
        mLabel2!.textColor=UIColor.orangeColor()
        mLabel2!.backgroundColor=UIColor.whiteColor()
        self.view .addSubview(mLabel2!)
        
        mLabel3 = UILabel()
        mLabel3!.frame=CGRectMake(0, 100, screen_width, 20)
        mLabel3!.text="See You Again"
        mLabel3!.textColor=UIColor.blueColor()
        mLabel3!.backgroundColor=UIColor.clearColor()
        self.view .addSubview(mLabel3!)
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
