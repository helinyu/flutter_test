//
//  ViewViewController.m
//  Runner
//
//  独学而无友 则孤陋寡闻
//
//  Created by helinyu on 2019/8/6 14:55 .
//  Copyright © 2019 The Chromium Authors. All rights reserved.
//  xcode 10.15 .
//
    

#import "ViewViewController.h"
#import <Flutter/Flutter.h>
#import "ThirdViewController.h"

@interface ViewViewController ()

@end

@implementation ViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


- (void)pushFlutterViewController {
    FlutterViewController* flutterViewController = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
    flutterViewController.navigationItem.title = @"Flutter Demo";
    __weak __typeof(self) weakSelf = self;
    
    // 要与main.dart中一致
    NSString *channelName = @"com.pages.your/native_get";
    
    FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterViewController];
    
    [messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
        // call.method 获取 flutter 给回到的方法名，要匹配到 channelName 对应的多个 发送方法名，一般需要判断区分
        // call.arguments 获取到 flutter 给到的参数，（比如跳转到另一个页面所需要参数）
        // result 是给flutter的回调， 该回调只能使用一次
        NSLog(@"flutter 给到我：\nmethod=%@ \narguments = %@",call.method,call.arguments);
        
        if ([call.method isEqualToString:@"toNativeSomething"]) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"flutter回调" message:[NSString stringWithFormat:@"%@",call.arguments] delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
            
            // 回调给flutter
            if (result) {
                result(@1000);
            }
        } else if ([call.method isEqualToString:@"toNativePush"]) {
            ThirdViewController *testVC = [[ThirdViewController alloc] init];
            testVC.parames = call.arguments;
            [weakSelf.navigationController pushViewController:testVC animated:YES];
        } else if ([call.method isEqualToString:@"toNativePop"]) {
            [weakSelf.navigationController popViewControllerAnimated:YES];
        }
    }];
    
    [self.navigationController pushViewController:flutterViewController animated:YES];
}

@end
