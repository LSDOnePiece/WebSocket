//
//  WebSocketManager.h
//  WebSocket
//
//  Created by 神州锐达 on 2017/11/13.
//  Copyright © 2017年 onePiece. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SocketRocket/SRWebSocket.h>
@interface WebSocketManager : NSObject

@property(strong,nonatomic)SRWebSocket *webSocket;

+(instancetype)sharedManager;

-(void)connectServer;

-(void)closeSocket;

-(void)sendData:(id)data;

@end
