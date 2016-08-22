//
//  JJHWidgetViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit

class JJHWidgetViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var myTableView : UITableView?
    
    var turple_widget = ["Label", "Button", "TextField", "Activity Indicator","Calculator-Simple"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="Widget"
        // Do any additional setup after loading the view.
        self.doAddSubview()
    }
    
    
    func doAddSubview() {
        myTableView = UITableView(frame: CGRectMake(0, 0, screen_width, screen_height))
        myTableView!.backgroundColor=UIColor.whiteColor()
        //        myTableView!.style=UITableViewStyle.Plain
        myTableView!.delegate=self
        myTableView!.dataSource=self
        self.view.addSubview(myTableView!)
        
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return turple_widget.count
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(identifier)
        if (cell == nil) {
            cell=UITableViewCell(style:UITableViewCellStyle.Value1 ,reuseIdentifier:identifier )
        }
        cell!.textLabel?.text=turple_widget[indexPath.row]
        return cell!
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print(indexPath.row)
        if (indexPath.row==0) {
            let jjh_label = JJHLabelViewController()
            jjh_label.title=turple_widget[indexPath.row]
            jjh_label.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_label, animated: true)
        }
        if (indexPath.row==1) {
            let jjh_button = JJHButtonViewController()
            jjh_button.title=turple_widget[indexPath.row]
            jjh_button.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_button, animated: true)
        }
        if indexPath.row==2 {
            let jjh_textfield = JJhTextfiledViewController()
            jjh_textfield.title=turple_widget[indexPath.row]
            jjh_textfield.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_textfield, animated: true)
            
        }
        if indexPath.row==3 {
            let jjh_actIndicator = JJhActivityIndicatorViewController()
            jjh_actIndicator.title=turple_widget[indexPath.row]
            jjh_actIndicator.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_actIndicator, animated: true)
            
        }
        if indexPath.row==4 {
            let jjh_calculator = JJHCalculatorViewController()
            jjh_calculator.title=turple_widget[indexPath.row]
            jjh_calculator.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_calculator, animated: true)
            
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
