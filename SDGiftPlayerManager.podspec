

Pod::Spec.new do |spec|
  spec.name         = "SDGiftPlayerManager"
  spec.version      = "1.0.3"
  spec.summary      = "业务礼物特效动画播放封装,SVGA格式、Lottie播放josn格式、VAP(.mp4文件)格式"
  spec.description  = <<-DESC
  封装业务礼物特效动画播放，包括SVGA格式的动画播放、Lottie播放josn格式动画、VAP(.mp4文件)特效动画播放.
                   DESC

  spec.homepage     = "https://github.com/Dxc123/SDGiftPlayerManager"
  spec.license      = "MIT"
  spec.author       = { "dxc_123" => "daixingchuang@163.com" }
  spec.source       = { :git => "https://github.com/Dxc123/SDGiftPlayerManager.git", :tag => '1.0.3'}
  # spec.source_files  = "SDGiftPlayerManager/**/*.{h,m}"  #OC
  spec.source_files = 'SDGiftPlayerManager/SDGiftPlayerManager/*.swift' #Swift
  # spec.public_header_files = 'SDGiftPlayerManager/SDGiftPlayerManager.h}'
  
  spec.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }
 
  spec.requires_arc = true
  spec.ios.deployment_target  = '11.0'
  spec.swift_versions = "5.0"#支持的Swift版本
  spec.framework      = 'UIKit'
  spec.osx.framework  = 'AppKit'

 
  #播放 json文件动画库 #OC版使用2.5.3
  spec.dependency "lottie-ios", "~> 3.1.2" 
  #播放 SVGA文件动画库
  spec.dependency "SVGAPlayer", "~> 2.5.7"
  #OC版:企鹅电竞开发，用于播放酷炫mp4视频动画。
  spec.dependency "QGVAPlayer", "~> 1.0.16"
end
