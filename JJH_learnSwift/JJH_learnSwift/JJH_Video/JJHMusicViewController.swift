//
//  JJHMusicViewController.swift
//  JJH_learnSwift
//
//  Created by Jiajianhao on 16/8/10.
//  Copyright © 2016年 com.TongHaoDevelopment. All rights reserved.
//

import UIKit
import AVFoundation

class JJHMusicViewController: UIViewController {
    var mButton : UIButton?
    var player : AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.whiteColor()
        
        self.doAddSubview()
       
        
        let audioPath = NSBundle.mainBundle().pathForResource("see you again", ofType: "mp3")
//        var error : NSError? = nil
        do {
            player = try AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioPath!))
        }
        catch {
            print("Something bad happened. Try catching specific errors to narrow things down")
        }

        
        
    }
    func doAddSubview() {
        mButton = UIButton()
        mButton!.frame = CGRectMake(0, 10, screen_width, 50)
        mButton!.backgroundColor=JJHRGB(20, g: 40, b: 80)
        mButton!.setTitle("播放", forState: UIControlState.Normal)
        mButton!.setTitle("播放", forState: UIControlState.Highlighted)
        mButton!.setTitle("暂停", forState: UIControlState.Selected)
        mButton!.addTarget(self, action:#selector(pressBtn(_:
            )), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(mButton!)
    }
    
    func pressBtn(sender:UIButton) {
        if (sender.selected) {
             sender.selected = false
            self.pause()
        }
        else{
             sender.selected = true
//            self.playSound()
            self.play()
        }
    }
 
    
    func play( ) {
        player.play()
        
    }
    
    
    func stop( ) {
        player.stop()
        print(player.currentTime)
        player.currentTime = 0
    }
    
    func pause( ) {
        player.pause()
    }

//    func playSound(soundName: String)
//    {
//        let coinSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(soundName, ofType: "m4a")!)
//        do{
//            let audioPlayer = try AVAudioPlayer(contentsOfURL:coinSound)
//            audioPlayer.prepareToPlay()
//            audioPlayer.play()
//        }catch {
//            print("Error getting the audio file")
//        }
//    }
    
}
