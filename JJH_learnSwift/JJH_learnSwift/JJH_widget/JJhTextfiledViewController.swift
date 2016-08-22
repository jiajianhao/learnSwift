//
//  JJhTextfiledViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit

class JJhTextfiledViewController: UIViewController,UITextFieldDelegate,UIGestureRecognizerDelegate {
    var phoneTextfield : UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.doAddSubview()
        // Do any additional setup after loading the view.
    }
    func doAddSubview() {
        phoneTextfield = UITextField(frame:CGRectMake(20,10,120,40))
        phoneTextfield!.backgroundColor=UIColor.clearColor()
        phoneTextfield!.placeholder="填写手机号"
        phoneTextfield!.text=""
        phoneTextfield!.textColor=UIColor.purpleColor()
        phoneTextfield!.delegate=self
        phoneTextfield!.addTarget(self, action: #selector(myTextChange(_:)), forControlEvents: UIControlEvents.ValueChanged)
        phoneTextfield!.keyboardType=UIKeyboardType.PhonePad
        self.view.addSubview(phoneTextfield!)
        
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTapGesture(_:)))
        //设置手势点击数,双击：点2下
        tapGesture.numberOfTapsRequired = 1
        self.view.addGestureRecognizer(tapGesture)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func myTextChange(sender:UITextField) {
        print(sender.text)
    }
    
    func handleTapGesture(sender:UITapGestureRecognizer) {
        phoneTextfield!.resignFirstResponder()
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
