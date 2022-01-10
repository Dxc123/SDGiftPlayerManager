//
//  OLottieManager.swift
//  Sista
//
//  Created by daixingchuang on 2021/8/31.
//swift版本 Lottie播放josn格式动画

import UIKit
import Lottie
public typealias finishedClosure = (Bool) -> Void

class OLottieManager: NSObject {
    static let shared = OLottieManager()
    public lazy  var  animationView: AnimationView = {
        let view = AnimationView.init()
        view.contentMode = .scaleAspectFill
        view.backgroundBehavior = .pauseAndRestore
        view.animationSpeed = 1
        view.loopMode = .playOnce
//        view.translatesAutoresizingMaskIntoConstraints = false//是否将视图的自动调整大小的遮罩
        return view
    }()

    override init() {
          super.init()
           //初始化
        self.animationView.frame = CGRect.init(x:(UIScreen.main.bounds.width - anWidth)/2, y:100, width:anWidth, height:anHeight)
        kGiftPalyerkeyWindow?.addSubview(self.animationView)

      }

}

extension OLottieManager {

//MARK: --  从本地支持的JSON文件加载Lottie动画.
     func playLocalJsonFile(name: String,completion:@escaping finishedClosure){
        let an = Animation.named(name)
        self.animationView.frame = CGRect.init(x:(UIScreen.main.bounds.width - anWidth)/2, y:100, width:anWidth, height:anHeight)
        kGiftPalyerkeyWindow?.addSubview(self.animationView)
        self.animationView.animation = an
        self.animationView.play(fromProgress: 0,
                               toProgress: 1,
                               loopMode: LottieLoopMode.playOnce,
                               completion: { (finished) in
                                if finished {
                                    debugPrint("Animation Complete")
                                    self.animationView.removeFromSuperview()
                                    completion(true)
                                } else {
                                    self.animationView.removeFromSuperview()
                                    debugPrint("Animation cancelled")
                                    completion(false)
                                }
                               })

    }

//MARK: --从磁盘路径加载动画
    func playFilepath(fileOfath: String,fileOfName :String,completion:@escaping finishedClosure){

        let an = Animation.filepath(fileOfath)
        self.animationView.frame = CGRect.init(x:(UIScreen.main.bounds.width - anWidth)/2, y:100, width:anWidth, height:anHeight)
        kGiftPalyerkeyWindow?.addSubview(self.animationView)
        self.animationView.animation = an
        self.animationView.play(fromProgress: 0,
                               toProgress: 1,
                               loopMode: LottieLoopMode.playOnce,
                               completion: { (finished) in
                                if finished {
                                    self.animationView.removeFromSuperview()
                                    debugPrint("Animation Complete")
                                    completion(true)

                                } else {
                                    debugPrint("Animation cancelled")
                                    self.animationView.removeFromSuperview()
                                    completion(false)
                                }
                               })

        if self.animationView.isAnimationPlaying {
            debugPrint("播放中。。。")
//            debugPrint("realtimeAnimationProgress = \(self.animationView.realtimeAnimationProgress)")
        }else{
            self.animationView.removeFromSuperview()
        }

    }
//MARK: -- 从网络Url加载

    func playUrl(urlStr: String ,completion:@escaping finishedClosure){
        self.animationView.frame = CGRect.init(x:(UIScreen.main.bounds.width - anWidth)/2, y:100, width:anWidth, height:anHeight)
        kGiftPalyerkeyWindow?.addSubview(self.animationView)
        guard let url = URL.init(string: urlStr) else { return }
        debugPrint("url = \(url)")
        Animation.loadedFrom(url: url, closure: { (animation) in
         self.animationView.animation = animation

         self.animationView.play(fromProgress: 0,
                                     toProgress: 1,
                                     loopMode: LottieLoopMode.playOnce,
                                     completion: { (finished) in
                                      if finished {
                                       debugPrint("Animation Complete")
                                        self.animationView.removeFromSuperview()
                                        completion(true)

                                      } else {
                                       debugPrint("Animation cancelled")
                                       self.animationView.removeFromSuperview()
                                          completion(false)
                                      }
                                     })

        }, animationCache: nil)

    }

    public func getCurrentProgress()-> CGFloat {
        if self.animationView.isAnimationPlaying {
            return self.animationView.currentProgress
         }
        return 0

    }
    public func getCurrentTime()->  TimeInterval{
        if self.animationView.isAnimationPlaying {
            return self.animationView.currentTime
        }
        return 0

    }

    public func isAnimationPlaying() -> Bool{
        return self.animationView.isAnimationPlaying
    }


    public func stop(){
        if self.animationView.isAnimationPlaying {
            self.animationView.stop()
        }
    }

    public func pause(){
            if self.animationView.isAnimationPlaying {
                self.animationView.pause()
            }
        }


}

