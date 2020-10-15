#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(Sha1Lib, NSObject)

RCT_EXTERN_METHOD(sha1:(NSString)input
                 withResolver:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)
@end
