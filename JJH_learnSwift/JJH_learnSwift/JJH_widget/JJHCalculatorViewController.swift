//
//  JJHCalculatorViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit
enum actionType: Int {
    case addition = 0
    case subtraction = 1
    case multiplication = 2
    case division = 3
    case noAction = 4
}
class JJHCalculatorViewController: UIViewController {
    var label_show : UILabel?
    var btn_add : UIButton?
    var btn_sub : UIButton?
    var btn_mul : UIButton?
    var btn_div : UIButton?
    var btn_compute : UIButton?
    
    var firstNum : Float = 0
    var secondNum : Float = 0
    
    var doAction : Bool = false
    var doActionForSecond : Bool = false
    
    var myActionType = actionType.noAction
    var btn_width = screen_width/4.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        self.doAddSubview()
        // Do any additional setup after loading the view.
    }
    func doAddSubview() {
        label_show = UILabel()
        label_show!.frame=CGRectMake(10, 10, screen_width-20, 50)
        label_show!.text="0"
        label_show!.textColor=UIColor.purpleColor()
        label_show!.backgroundColor=UIColor.clearColor()
        label_show!.layer.borderColor=UIColor.purpleColor().CGColor
        label_show!.layer.borderWidth=0.5
        label_show!.layer.cornerRadius=2;
        label_show!.textAlignment=NSTextAlignment.Right
        label_show!.font=UIFont.systemFontOfSize(40)
        self.view .addSubview(label_show!)
        
        /////
        btn_add = UIButton()
        btn_add!.frame = CGRectMake(screen_width-btn_width, 70, btn_width, btn_width)
        btn_add!.backgroundColor=UIColor.orangeColor()
        btn_add!.setTitle("+", forState: UIControlState.Normal)
        btn_add!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        btn_add!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_add!.titleLabel?.font=UIFont.systemFontOfSize(30)
        btn_add!.layer.borderWidth=0.5
        btn_add!.layer.borderColor=UIColor.grayColor().CGColor
        btn_add!.tag=0
        self.view.addSubview(btn_add!)
        
        let clearBtn = UIButton()
        clearBtn.frame = CGRectMake(0, 70, btn_width*3, btn_width)
        clearBtn.backgroundColor=UIColor.orangeColor()
        clearBtn.setTitle("C", forState: UIControlState.Normal)
        clearBtn.addTarget(self, action:#selector(m_clear(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        clearBtn.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        clearBtn.titleLabel?.font=UIFont.systemFontOfSize(30)
        clearBtn.layer.borderWidth=0.5
        clearBtn.layer.borderColor=UIColor.grayColor().CGColor
        self.view.addSubview(clearBtn)
        
        
        
        
        /////
        btn_sub = UIButton()
        btn_sub!.frame = CGRectMake(screen_width-btn_width, 70+btn_width, btn_width, btn_width)
        btn_sub!.backgroundColor=UIColor.orangeColor()
        btn_sub!.setTitle("-", forState: UIControlState.Normal)
        btn_sub!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        btn_sub!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_sub!.titleLabel?.font=UIFont.systemFontOfSize(30)
        btn_sub!.layer.borderWidth=0.5
        btn_sub!.layer.borderColor=UIColor.grayColor().CGColor
        btn_sub!.tag=1
        self.view.addSubview(btn_sub!)
        
        let numBtn1 = UIButton()
        numBtn1.frame = CGRectMake(0, 70+btn_width, btn_width, btn_width)
        numBtn1.backgroundColor=UIColor.orangeColor()
        numBtn1.setTitle("1", forState: UIControlState.Normal)
        numBtn1.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn1.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn1.layer.borderWidth=0.5
        numBtn1.layer.borderColor=UIColor.grayColor().CGColor
        numBtn1.tag=1
        self.view.addSubview(numBtn1)
        
        let numBtn2 = UIButton()
        numBtn2.frame = CGRectMake(btn_width, 70+btn_width, btn_width, btn_width)
        numBtn2.backgroundColor=UIColor.orangeColor()
        numBtn2.setTitle("2", forState: UIControlState.Normal)
        numBtn2.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn2.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn2.layer.borderWidth=0.5
        numBtn2.layer.borderColor=UIColor.grayColor().CGColor
        numBtn2.tag=2
        self.view.addSubview(numBtn2)
        let numBtn3 = UIButton()
        numBtn3.frame = CGRectMake(btn_width*2, 70+btn_width, btn_width, btn_width)
        numBtn3.backgroundColor=UIColor.orangeColor()
        numBtn3.setTitle("3", forState: UIControlState.Normal)
        numBtn3.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn3.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn3.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn3.layer.borderWidth=0.5
        numBtn3.layer.borderColor=UIColor.grayColor().CGColor
        numBtn3.tag=3
        self.view.addSubview(numBtn3)
        
        
        
        
        /////
        btn_mul = UIButton()
        btn_mul!.frame = CGRectMake(screen_width-btn_width, 70+btn_width*2, btn_width, btn_width)
        btn_mul!.backgroundColor=UIColor.orangeColor()
        btn_mul!.setTitle("*", forState: UIControlState.Normal)
        btn_mul!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        btn_mul!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_mul!.titleLabel?.font=UIFont.systemFontOfSize(30)
        btn_mul!.layer.borderWidth=0.5
        btn_mul!.layer.borderColor=UIColor.grayColor().CGColor
        btn_mul!.tag=2
        self.view.addSubview(btn_mul!)
        let numBtn4 = UIButton()
        numBtn4.frame = CGRectMake(0, 70+btn_width*2, btn_width, btn_width)
        numBtn4.backgroundColor=UIColor.orangeColor()
        numBtn4.setTitle("4", forState: UIControlState.Normal)
        numBtn4.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn4.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn4.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn4.layer.borderWidth=0.5
        numBtn4.layer.borderColor=UIColor.grayColor().CGColor
        numBtn4.tag=4
        self.view.addSubview(numBtn4)
        
        let numBtn5 = UIButton()
        numBtn5.frame = CGRectMake(btn_width, 70+btn_width*2, btn_width, btn_width)
        numBtn5.backgroundColor=UIColor.orangeColor()
        numBtn5.setTitle("5", forState: UIControlState.Normal)
        numBtn5.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn5.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn5.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn5.layer.borderWidth=0.5
        numBtn5.layer.borderColor=UIColor.grayColor().CGColor
        numBtn5.tag=5
        self.view.addSubview(numBtn5)
        let numBtn6 = UIButton()
        numBtn6.frame = CGRectMake(btn_width*2, 70+btn_width*2, btn_width, btn_width)
        numBtn6.backgroundColor=UIColor.orangeColor()
        numBtn6.setTitle("6", forState: UIControlState.Normal)
        numBtn6.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn6.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn6.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn6.layer.borderWidth=0.5
        numBtn6.layer.borderColor=UIColor.grayColor().CGColor
        numBtn6.tag=6
        self.view.addSubview(numBtn6)
        
        
        /////
        btn_div = UIButton()
        btn_div!.frame = CGRectMake(screen_width-btn_width, 70+btn_width*3, btn_width, btn_width)
        btn_div!.backgroundColor=UIColor.orangeColor()
        btn_div!.setTitle("/", forState: UIControlState.Normal)
        btn_div!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        btn_div!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_div!.titleLabel?.font=UIFont.systemFontOfSize(30)
        btn_div!.layer.borderWidth=0.5
        btn_div!.layer.borderColor=UIColor.grayColor().CGColor
        btn_div!.tag=3
        self.view.addSubview(btn_div!)
        let numBtn7 = UIButton()
        numBtn7.frame = CGRectMake(0, 70+btn_width*3, btn_width, btn_width)
        numBtn7.backgroundColor=UIColor.orangeColor()
        numBtn7.setTitle("7", forState: UIControlState.Normal)
        numBtn7.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn7.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn7.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn7.layer.borderWidth=0.5
        numBtn7.layer.borderColor=UIColor.grayColor().CGColor
        numBtn7.tag=7
        self.view.addSubview(numBtn7)
        
        let numBtn8 = UIButton()
        numBtn8.frame = CGRectMake(btn_width, 70+btn_width*3, btn_width, btn_width)
        numBtn8.backgroundColor=UIColor.orangeColor()
        numBtn8.setTitle("8", forState: UIControlState.Normal)
        numBtn8.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn8.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn8.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn8.layer.borderWidth=0.5
        numBtn8.layer.borderColor=UIColor.grayColor().CGColor
        numBtn8.tag=8
        self.view.addSubview(numBtn8)
        let numBtn9 = UIButton()
        numBtn9.frame = CGRectMake(btn_width*2, 70+btn_width*3, btn_width, btn_width)
        numBtn9.backgroundColor=UIColor.orangeColor()
        numBtn9.setTitle("9", forState: UIControlState.Normal)
        numBtn9.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn9.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn9.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn9.layer.borderWidth=0.5
        numBtn9.layer.borderColor=UIColor.grayColor().CGColor
        numBtn9.tag=9
        self.view.addSubview(numBtn9)
        
        
        /////
        btn_compute = UIButton()
        btn_compute!.frame = CGRectMake(screen_width-btn_width, 70+btn_width*4, btn_width, btn_width)
        btn_compute!.backgroundColor=UIColor.orangeColor()
        btn_compute!.setTitle("=", forState: UIControlState.Normal)
        btn_compute!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        btn_compute!.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        btn_compute!.titleLabel?.font=UIFont.systemFontOfSize(30)
        btn_compute!.layer.borderWidth=0.5
        btn_compute!.layer.borderColor=UIColor.grayColor().CGColor
        btn_compute!.tag=4
        self.view.addSubview(btn_compute!)
        
        
        let numBtn0 = UIButton()
        numBtn0.frame = CGRectMake(0, 70+btn_width*4, btn_width*2, btn_width)
        numBtn0.backgroundColor=UIColor.orangeColor()
        numBtn0.setTitle("0", forState: UIControlState.Normal)
        numBtn0.addTarget(self, action:#selector(chooseNum(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtn0.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtn0.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtn0.layer.borderWidth=0.5
        numBtn0.layer.borderColor=UIColor.grayColor().CGColor
        numBtn0.tag=0
        self.view.addSubview(numBtn0)
        
        let numBtnDot = UIButton()
        numBtnDot.frame = CGRectMake(btn_width*2, 70+btn_width*4, btn_width, btn_width)
        numBtnDot.backgroundColor=UIColor.orangeColor()
        numBtnDot.setTitle(".", forState: UIControlState.Normal)
        numBtnDot.addTarget(self, action:#selector(pressDotBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        numBtnDot.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        numBtnDot.titleLabel?.font=UIFont.systemFontOfSize(30)
        numBtnDot.layer.borderWidth=0.5
        numBtnDot.layer.borderColor=UIColor.grayColor().CGColor
        numBtnDot.tag=0
        self.view.addSubview(numBtnDot)
    }
    
    func chooseNum(sender:UIButton) {
        if doAction {
            if !doActionForSecond {
                let now_num = String(sender.tag)
                label_show!.text = now_num as String
                doActionForSecond = true
            }
            else{
                let strNum : NSString  =  label_show!.text!
                print(strNum)
                let now_num = String(sender.tag)
                let numTemp = strNum.floatValue
                if numTemp == 0 {
                    label_show!.text = now_num as String
                }
                else{
                    let strTemp : String = (strNum as String) + now_num
                    label_show!.text = strTemp
                }
            }
            
        }
        else{
            let strNum : NSString  =  label_show!.text!
            print(strNum)
            let now_num = String(sender.tag)
            let numTemp = strNum.floatValue
            if numTemp == 0 {
                label_show!.text = now_num as String
            }
            else{
                let strTemp : String = (strNum as String) + now_num
                label_show!.text = strTemp
            }
            
        }
        
    }
    func pressDotBtn(sender:UIButton)  {
        
        let strNum : NSString  =  label_show!.text!
        if (strNum.containsString(".")) {
            return
        }
        let strTemp : String = (strNum as String) + "."
        label_show!.text = strTemp
        
        
    }
    
    func pressBtn(sender:UIButton) {
        switch sender.tag {
        case 0:
            myActionType = actionType.addition
            let strNum : NSString =  label_show!.text!
            firstNum = strNum.floatValue
            secondNum = firstNum
            doAction = true
            doActionForSecond = false

            break
        case 1:
            myActionType = actionType.subtraction
             let strNum : NSString =  label_show!.text!
            firstNum = strNum.floatValue
            secondNum = firstNum
            doAction = true
            doActionForSecond = false

            break
        case 2:
            myActionType = actionType.multiplication
             let strNum : NSString =  label_show!.text!
            firstNum = strNum.floatValue
            secondNum = firstNum
            doAction = true
            doActionForSecond = false

            break
        case 3:
            myActionType = actionType.division
             let strNum : NSString =  label_show!.text!
            firstNum = strNum.floatValue
            secondNum = firstNum
            doAction = true

            doActionForSecond = false

            break
        case 4:
            
            self.doReadSecondNum()
            self.doCompute()
            
            doAction = false
            doActionForSecond = false
            break
        default:
            doAction = false
            break
        }
    }
    func doReadSecondNum() {
        if doAction {
            let strNum : NSString =  label_show!.text!
            secondNum = strNum.floatValue
        }
    
    }
    func doCompute() {
        if (myActionType == actionType.noAction) {
            return
        }
        
        if (myActionType == actionType.addition) {
            
            let num_dec : NSDecimalNumber = NSDecimalNumber.init(float: self.m_doAdd(firstNum, num2: secondNum))
            label_show!.text=String(num_dec)
        }
        else if (myActionType == actionType.subtraction) {
            let num_dec : NSDecimalNumber = NSDecimalNumber.init(float: self.m_doSub(firstNum, num2: secondNum))
            label_show!.text=String(num_dec)
            
        }
        else if (myActionType == actionType.multiplication) {
            let num_dec : NSDecimalNumber = NSDecimalNumber.init(float: self.m_doMul(firstNum, num2: secondNum))
            label_show!.text=String(num_dec)
        }
        else if (myActionType == actionType.division) {
            let num_dec : NSDecimalNumber = NSDecimalNumber.init(float: self.m_doDiv(firstNum, num2: secondNum))
            label_show!.text=String(num_dec)
            
        }
        
        let strNum : NSString =  label_show!.text!
        firstNum = strNum.floatValue
    }
    
    
    func m_doAdd(num1:Float,num2:Float) -> Float {
        return  num1+num2;
    }
    func m_doSub(num1:Float,num2:Float) -> Float {
        return  num1-num2;

    }
    func m_doMul(num1:Float,num2:Float) -> Float {
        return  num1*num2;
    }
    func m_doDiv(num1:Float,num2:Float) -> Float {
        return  num1/num2;
    }
    
    func m_clear(sender:UIButton) {
        label_show!.text="0"
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
