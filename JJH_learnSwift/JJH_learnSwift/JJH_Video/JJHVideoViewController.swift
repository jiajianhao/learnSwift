//
//  JJHVideoViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit

class JJHVideoViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var myTableView : UITableView?

    var turple_video = ["music", "movie"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor=UIColor.whiteColor()
        self.title="Video"
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
        return turple_video.count
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
        cell!.textLabel?.text=turple_video[indexPath.row]
        return cell!
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if (indexPath.row==0) {
            let jjh_music = JJHMusicViewController()
            jjh_music.title=turple_video[indexPath.row]
            jjh_music.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_music, animated: true)
        }
        if (indexPath.row==1) {
            let jjh_movie = JJHMovieViewController()
            jjh_movie.title=turple_video[indexPath.row]
            jjh_movie.hidesBottomBarWhenPushed=true
            self.navigationController?.pushViewController(jjh_movie, animated: true)
        }
//        if indexPath.row==2 {
//            let jjh_textfield = JJhTextfiledViewController()
//            jjh_textfield.title=turple_video[indexPath.row]
//            jjh_textfield.hidesBottomBarWhenPushed=true
//            self.navigationController?.pushViewController(jjh_textfield, animated: true)
//            
//        }
//        if indexPath.row==3 {
//            let jjh_actIndicator = JJhActivityIndicatorViewController()
//            jjh_actIndicator.title=turple_video[indexPath.row]
//            jjh_actIndicator.hidesBottomBarWhenPushed=true
//            self.navigationController?.pushViewController(jjh_actIndicator, animated: true)
//            
//        }
//        if indexPath.row==4 {
//            let jjh_calculator = JJHCalculatorViewController()
//            jjh_calculator.title=turple_video[indexPath.row]
//            jjh_calculator.hidesBottomBarWhenPushed=true
//            self.navigationController?.pushViewController(jjh_calculator, animated: true)
//            
//        }
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
