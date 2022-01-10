//
//  SDSVGAManager.swift
//  Sista
//
//  Created by daixingchuang on 2021/8/31.
//播放 SVGA格式的动画

import UIKit
import SVGAPlayer

class SDSVGAManager: NSObject {
    static let shared = SDSVGAManager()
    //播放 SVGA动画
    lazy var svgaPlayer: SVGAPlayer = {
           let player = SVGAPlayer.init()
           player.delegate = self
           player.loops = 1
           player.clearsAfterStop = true
           player.translatesAutoresizingMaskIntoConstraints = true//是否将视图的自动调整大小的遮罩
           return player
       }()
    lazy var svgaParser: SVGAParser = {
           let svgaParser = SVGAParser.init()
           return svgaParser
       }()
    
    override init() {
          super.init()
           //初始化
//        self.svgaPlayer.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
//        kSVGAkeyWindow?.addSubview(self.svgaPlayer)
        
      }
    

}

extension SDSVGAManager:  SVGAPlayerDelegate{
    
    //设置第几帧触发该方法
    func svgaPlayerDidAnimated(toFrame frame: Int) {
//        debugPrint("设置第几帧触发该方法")
        if frame == 1 {
            debugPrint("动画开始播放")
        }
    }
    //动画播放百分比
    func svgaPlayerDidAnimated(toPercentage percentage: CGFloat) {
//        debugPrint("动画播放百分比=\(percentage)")
    }
    //动画完成播放
    func svgaPlayerDidFinishedAnimation(_ player: SVGAPlayer!) {
        debugPrint("动画完成播放")
        self.svgaPlayer.removeFromSuperview()
    }
    
}

extension SDSVGAManager {
    /// 播放已下载本地的SVGA礼物特效文件
    /// - Parameters:
    ///   - fileOfath: 本地的礼物特效文件路径
    ///   - fileOfName: 礼物特效文件名称
    ///   - type:  礼物类型:1,lottie动画礼物 2，3，4分别代表小，半屏，全屏  SVGA动画礼物 1，可以lottie播放 2 3 4 可以SVGAPlayer播放
    func playSVGAFilePath(fileOfath: String,fileOfName: String,type:Int) {
            if type == 3 || type == 4 {
                self.svgaPlayer.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
                kGiftPalyerkeyWindow?.addSubview(self.svgaPlayer)
            }else{
                self.svgaPlayer.frame = CGRect.init(x:0, y:100, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-100)
                kGiftPalyerkeyWindow?.addSubview(self.svgaPlayer)
            }
              
        
            let filesPath = fileOfath as String
            let filePathData = NSData.init(contentsOfFile: filesPath)
//            let url = URL.init(fileURLWithPath: fileOfath)
//            let filePathData =  try? Data(contentsOf: url)
            self.svgaParser.parse(with: filePathData! as Data, cacheKey: fileOfName, completionBlock: { (videoItem) in
                   self.svgaPlayer.videoItem = videoItem
                   self.svgaPlayer.startAnimation()
               }) { (error) in
            }

        }
       

    /// url播放(本地未缓存SVGA礼物文件)
    /// - Parameters:
    ///   - playOfUrl: url地址
    ///   - type: 礼物类型:1,lottie动画礼物 2，3，4分别代表小，半屏，全屏  SVGA动画礼物 1，可以lottie播放 2 3 4 可以SVGAPlayer播放
    func playSVGAUrl(playOfUrl :URL,type:Int){
            if type == 3 || type == 4 {
                self.svgaPlayer.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
                kGiftPalyerkeyWindow?.addSubview(self.svgaPlayer)
            }else{
                self.svgaPlayer.frame = CGRect.init(x:0, y:100, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height-100)
                kGiftPalyerkeyWindow?.addSubview(self.svgaPlayer)
            }
            kGiftPalyerkeyWindow?.addSubview(self.svgaPlayer)
            self.svgaParser.parse(with: playOfUrl, completionBlock: { (videoItem) in
                self.svgaPlayer.videoItem = videoItem
                self.svgaPlayer.startAnimation()
            }) { (error) in
                 debugPrint("error = \(String(describing: error))")
            }

        }
}
/**
 //用于测试的 SVGA动画文件
 NSArray *items = @[
                       @"https://github.com/yyued/SVGA-Samples/blob/master/EmptyState.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/HamburgerArrow.svga?raw=true",
                       @"https://github.com/yyued/SVGA-Samples/blob/master/PinJump.svga?raw=true",
                       @"https://github.com/svga/SVGA-Samples/raw/master/Rocket.svga"
                       ];
 */


/**
 测试
 SDSVGAManager.shared.playSVGAUrl(playOfUrl: URL.init(string: "https://github.com/yyued/SVGA-Samples/blob/master/Walkthrough.svga?raw=true")!)

*/
