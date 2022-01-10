//
//  OVAPManager.swift
//  Sista
//
//  Created by daixingchuang on 2021/8/31.
//VAP是企鹅电竞开发，用于播放特效动画 （.mp4文件）
/**
 let filePath = Bundle.main.path(forResource: "vap", ofType: "mp4")
 SSVAPMananger.shared.palyMP4FilePath(filePath, isTapStop: false)
 */
import UIKit
import QGVAPlayer

class OVAPManager: NSObject {
    static let shared = OVAPManager()
    lazy var vapView: UIView = {
           let player = UIView.init()
           player.hwd_enterBackgroundOP = .stop
           player.isUserInteractionEnabled = true
//           player.translatesAutoresizingMaskIntoConstraints = true//是否将视图的自动调整大小的遮罩
           return player
       }()
    
    
    
    lazy var vapWrapView: QGVAPWrapView = {//封装VAPView
           let player = QGVAPWrapView.init()
           player.hwd_enterBackgroundOP = .stop
           player.contentMode = .aspectFit
           player.autoDestoryAfterFinish = true//是否在播放完成后自动移除内部VAPView
           player.isUserInteractionEnabled = true
//           player.translatesAutoresizingMaskIntoConstraints = true//是否将视图的自动调整大小的遮罩
           return player
       }()
    override init() {
          super.init()
           //初始化
//        self.vapView.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
//        kVAPkeyWindow?.addSubview(self.vapView)
        
      }
    
    
}

extension OVAPManager {

    /// 播放特效动画（VAPView）
    /// - Parameter path: 资源路径
    func palyMP4FilePath(_ filePath: String,isTapStop:Bool){
        debugPrint("filePath = \(filePath )")
        self.vapView.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        kGiftPalyerkeyWindow?.addSubview(self.vapView)
        self.vapView.playHWDMP4(filePath, repeatCount: -1, delegate: self)
        if isTapStop{
            self.vapView.addVapTapGesture { tap, insideSource, displayItem in
                debugPrint("点击手势")
                tap?.view?.stopHWDMP4()
                tap?.view?.removeFromSuperview()
            }
        }
        
       
    }
    /// 播放特效动画（QGVAPWrapView）
    /// - Parameter path: 资源路径
    func palyMP4FilePathFormVapWrap(_ filePath: String,isTapStop:Bool){
        debugPrint("filePath = \(filePath )")
        self.vapWrapView.frame = CGRect.init(x:0, y:0, width:UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
        kGiftPalyerkeyWindow?.addSubview(self.vapWrapView)
        self.vapWrapView.playHWDMP4(filePath , repeatCount: -1, delegate: self)
        if isTapStop {
            self.vapView.addVapTapGesture { tap, insideSource, displayItem in
                debugPrint("点击手势")
                tap?.view?.stopHWDMP4()
                tap?.view?.removeFromSuperview()
            }
        }
        
    }
    
}

extension OVAPManager: HWDMP4PlayDelegate{

    //即将开始播放时询问，true马上开始播放，false放弃播放
    func shouldStartPlayMP4(_ container: UIView!, config: QGVAPConfigModel!) -> Bool {
        return true
    }
    func viewDidStartPlayMP4(_ container: UIView!) {
        debugPrint("开始播放")
    }
    func viewDidPlayMP4(at frame: QGMP4AnimatedImageFrame,view container: UIView!){
        //note:在子线程被调用
       
    }
    
    
    func viewDidStopPlayMP4(_ lastFrameIndex: Int, view container: UIView!) {
        debugPrint("vapView停止播放")
        //note:在子线程被调用
        DispatchQueue.main.async {
            self.vapView.removeFromSuperview()
        }
    }
   
    func viewDidFinishPlayMP4(_ totalFrameCount: Int, view container: UIView!) {
        debugPrint("vapView完成播放")
        //note:在子线程被调用
        DispatchQueue.main.async {
            self.vapView.removeFromSuperview()
        }
    }
    func viewDidFailPlayMP4(_ error: Error!) {
        debugPrint("播放失败error = \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.vapView.removeFromSuperview()
        }
    }
    
    
//    //融合动画代理(替换tag内容和下载图片)
//
//    func content(forVapTag tag: String!, resource info: QGVAPSourceInfo!) -> String! {
//
//    }
//
//    func loadVapImage(withURL urlStr: String!, context: [AnyHashable : Any]!, completion completionBlock: VAPImageCompletionBlock!) {
//        ////由于组件内不包含网络图片加载的模块，因此需要外部支持图片加载。
//
//    }
    
}

extension OVAPManager: VAPWrapViewDelegate {
    
    func vapWrap_viewshouldStartPlayMP4(_ container: UIView, config: QGVAPConfigModel) -> Bool {
        return true
    }
    func vapWrap_viewDidStartPlayMP4(_ container: UIView) {
        debugPrint("vapWrap开始播放")
    }
    func vapWrap_viewDidPlayMP4(at frame: QGMP4AnimatedImageFrame, view container: UIView) {
    }
    func vapWrap_viewDidStopPlayMP4(_ lastFrameIndex: Int, view container: UIView) {
        debugPrint("vapWrap停止播放")
        DispatchQueue.main.async {
            self.vapWrapView.removeFromSuperview()
        }
    
    }
    func vapWrap_viewDidFinishPlayMP4(_ totalFrameCount: Int, view container: UIView) {
        debugPrint("vapWrap完成播放")
        DispatchQueue.main.async {
            self.vapWrapView.removeFromSuperview()
        }
    }
    func vapWrap_viewDidFailPlayMP4(_ error: Error) {
        debugPrint("vapWrap播放失败error = \(error.localizedDescription)")
        DispatchQueue.main.async {
            self.vapWrapView.removeFromSuperview()
        }
    }
    //    //融合动画代理(替换tag内容和下载图片)
    //
    //    func vapWrapview_content(forVapTag tag: String!, resource info: QGVAPSourceInfo!) -> String! {
    //
    //    }
    //
    //    func vapWrapview_loadVapImage(withURL urlStr: String!, context: [AnyHashable : Any]!, completion completionBlock: VAPImageCompletionBlock!) {
    //        ////由于组件内不包含网络图片加载的模块，因此需要外部支持图片加载。
    //
    //    }
    
    
}

