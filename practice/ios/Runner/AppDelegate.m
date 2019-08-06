#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
  
    FlutterViewController *vc = (FlutterViewController *)self.window.rootViewController;
    FlutterMethodChannel *methodChannel = [FlutterMethodChannel methodChannelWithName:@"com.pages.your/native_get" binaryMessenger:vc];
    [methodChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        if ([call.method isEqualToString:@"toNativeSomething"]) {
            NSLog(@"lt- zhe 里使用了flutter传递过来的参数: %@",call.arguments);
            !result? :result(@"lt- 原生传递给flutter");
        }
        else if ([call.method isEqualToString:@"toNativePush"]) {
            !result? :result(@"lt- 原生 : to native push");
        }
        else if ([call.method isEqualToString:@"toNativePop"]) {
            !result? :result(@"lt- 原生：toNativePop");
        }
    }];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}


@end
