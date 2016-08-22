//
//  JJhActivityIndicatorViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit

class JJhActivityIndicatorViewController: UIViewController {
    var mActIndicator : UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        
        self.doAddSubview()
        // Do any additional setup after loading the view.
        NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: #selector(JJhActivityIndicatorViewController.myStopAnimation), userInfo: nil, repeats: false)
    }
    
    func doAddSubview() {
        mActIndicator = UIActivityIndicatorView()
        mActIndicator!.activityIndicatorViewStyle=UIActivityIndicatorViewStyle.Gray
        mActIndicator!.center=self.view.center
        self.view.addSubview(mActIndicator!)
        self.myStartAnimation()
    }
    func myStartAnimation()  {
        mActIndicator!.startAnimating()
        print("start")

    }
    func myStopAnimation()  {
        mActIndicator!.stopAnimating()
        print("stop")
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
