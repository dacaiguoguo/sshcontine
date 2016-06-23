//
//  main.m
//  sshcontine
//
//  Created by yanguo sun on 16/3/8.
//  Copyright © 2016年 Lvmama. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SSHContine.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString *selfPath = [NSString stringWithCString:*argv encoding:NSUTF8StringEncoding];
        SSHContine *contin = [SSHContine new];
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:contin selector:@selector(continueSSH:) userInfo:@{@"selfPath":selfPath} repeats:YES];
        NSLog(@"dacaiguoguo:\n%s\n%@",__func__,timer);
        NSRunLoop *currLoop = [NSRunLoop currentRunLoop];
        [currLoop addTimer:timer forMode:NSDefaultRunLoopMode];
        [currLoop run];

    }
    return 0;
}