#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "QGBaseDecoder.h"
#import "QGMP4FrameHWDecoder.h"
#import "QGAnimatedImageBufferManager.h"
#import "QGAnimatedImageDecodeConfig.h"
#import "QGAnimatedImageDecodeManager.h"
#import "QGAnimatedImageDecodeThread.h"
#import "QGAnimatedImageDecodeThreadPool.h"
#import "QGVAPConfigManager.h"
#import "QGBaseAnimatedImageFrame+Displaying.h"
#import "QGBaseAnimatedImageFrame.h"
#import "QGBaseDFileInfo.h"
#import "QGMP4AnimatedImageFrame.h"
#import "QGMP4HWDFileInfo.h"
#import "QGVAPConfigModel.h"
#import "QGVAPMaskInfo.h"
#import "QGVAPTextureLoader.h"
#import "QGMP4Box.h"
#import "QGMP4Parser.h"
#import "QGVAPlayer.h"
#import "QGVAPWrapView.h"
#import "UIView+VAP.h"
#import "NSArray+VAPUtil.h"
#import "NSDictionary+VAPUtil.h"
#import "NSNotificationCenter+VAPThreadSafe.h"
#import "UIColor+VAPUtil.h"
#import "UIDevice+VAPUtil.h"
#import "UIGestureRecognizer+VAPUtil.h"
#import "UIView+MP4HWDecode.h"
#import "QGVAPLogger.h"
#import "QGVAPMetalShaderFunctionLoader.h"
#import "QGVAPMetalUtil.h"
#import "QGVAPSafeMutableArray.h"
#import "QGVAPSafeMutableDictionary.h"
#import "QGVAPWeakProxy.h"
#import "VAPMacros.h"
#import "QGHWDMetalRenderer.h"
#import "QGHWDMetalView.h"
#import "QGVAPMetalRenderer.h"
#import "QGVAPMetalView.h"
#import "QGHWDMP4OpenGLView.h"
#import "QGHWDMetalShaderSourceDefine.h"
#import "QGHWDShaderTypes.h"

FOUNDATION_EXPORT double QGVAPlayerVersionNumber;
FOUNDATION_EXPORT const unsigned char QGVAPlayerVersionString[];

