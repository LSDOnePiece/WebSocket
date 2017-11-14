//
//  ViewController.m
//  WebSocket
//
//  Created by 神州锐达 on 2017/11/13.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "ViewController.h"
#import "WebSocketManager.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [[WebSocketManager sharedManager] connectServer];
    
    
}

- (IBAction)sendData:(UIButton *)sender {
    
    NSString *str = @"connect";
    
    [[WebSocketManager sharedManager] sendData:[str dataUsingEncoding:NSUTF8StringEncoding]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
