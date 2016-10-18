#import "RCTLog.h"
#import "RCTConvert.h"
#import "RCTBridge.h"
#import "RCTUtils.h"
#import "RCTEventDispatcher.h"
#import "RCTBridgeModule.h"
#import <UIKit/UIKit.h>

@interface RNAlipay : NSObject <RCTBridgeModule>

+(void) handleCallback:(NSURL *)url;

@end
