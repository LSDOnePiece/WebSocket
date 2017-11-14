//
//  WebSocketManager.m
//  WebSocket
//
//  Created by 神州锐达 on 2017/11/13.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import "WebSocketManager.h"

@interface WebSocketManager()<SRWebSocketDelegate>

#define WebSocketUrl @"ws://47.93.57.18:2346"

@end

@implementation WebSocketManager

+(instancetype)sharedManager{
    
    static WebSocketManager *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[WebSocketManager alloc]init];
    });
    return _instance;
}


-(void)connectServer{
    
    [self closeSocket];
    
    self.webSocket = [[SRWebSocket alloc]initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:WebSocketUrl]]];
    
    self.webSocket.delegate = self;
    
    [self.webSocket open];
    
}

-(void)closeSocket{
    
    self.webSocket.delegate = nil;
    [self.webSocket close];
    self.webSocket = nil;
    
}

-(void)sendData:(id)data{
    [self.webSocket send:data];
}

//连接成功
//代理方法实现
#pragma mark - SRWebSocketDelegate
- (void)webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"WebSocket Connect");
}

// 连接失败
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    NSLog(@"Websocket Failed With Error --- %@", error);
    
    self.webSocket = nil;
}

// 接收到新消息的处理
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"接收到Message-----%@",message);
}

// 连接关闭
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(NSString *)reason wasClean:(BOOL)wasClean
{
    NSLog(@"Closed Reason:%@",reason);
    self.webSocket = nil;
}


@end
