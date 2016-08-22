//
//  JJH_constant.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import Foundation
import UIKit

public let screen_width = UIScreen.mainScreen().bounds.width
public let screen_height = UIScreen.mainScreen().bounds.height

func JJHRGB(r:CGFloat,g:CGFloat,b:CGFloat) -> UIColor {
    return UIColor(red:r/255.0 ,green:g/255.0,blue:b/255.0,alpha:1.0)
}