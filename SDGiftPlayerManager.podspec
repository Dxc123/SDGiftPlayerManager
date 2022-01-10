#
#  Be sure to run `pod spec lint SDGiftDownload.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "SDGiftPlayerManager"
  spec.version      = "1.0.0"
  spec.summary      = "业务礼物特效动画播放封装，包括SVGA格式的动画播放、Lottie播放josn格式动画、VAP(.mp4文件)特效动画播放 "

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
  业务礼物特效动画播放封装模块
                   DESC

  spec.homepage     = "https://github.com/Dxc123/SDGiftPlayerManager"
  spec.license      = "MIT"
 
  spec.author       = { "dxc_123" => "daixingchuang@163.com" }

  spec.source       = { :git => "https://github.com/Dxc123/SDGiftPlayerManager.git", :tag => spec.version.to_s}

  spec.source_files  = "SDGiftPlayerManager/**/*.{h,m}"
  spec.public_header_files = 'SDGiftDownload/Download/SDGiftPlayerManager.h}'
 
  spec.requires_arc = true
  spec.ios.deployment_target  = '11.0'
  spec.swift_versions = "5.0"#支持的Swift版本
  spec.framework      = 'UIKit'
  spec.osx.framework  = 'AppKit'

  # spec.dependency "JSONKit", "~> 1.4"
  
  #播放 json文件动画库 #OC版使用2.5.3
  spec.dependency "lottie-ios", "~> 3.1.2" 
  #播放 SVGA文件动画库
  spec.dependency "SVGAPlayer", "~> 2.5.7"
  #OC版:企鹅电竞开发，用于播放酷炫mp4视频动画。
  spec.dependency "QGVAPlayer", "~> 1.0.16"
end
