//
//  SSHContine.m
//  sshcontine
//
//  Created by yanguo sun on 16/6/23.
//  Copyright © 2016年 Lvmama. All rights reserved.
//

#import "SSHContine.h"
#include <spawn.h>
extern char **environ;
@implementation SSHContine
- (int)continueSSH:(NSTimer *)timer {
    NSString *selfPath = [timer.userInfo objectForKey:@"selfPath"];
    NSLog(@"%@",selfPath);
    NSString *superPath = [selfPath stringByDeletingLastPathComponent];
    NSString *sshResult = [superPath stringByAppendingPathComponent:@"sshresult.txt"];
    NSString *toShell = [NSString stringWithFormat:@"ps -A | grep ssh > %@",sshResult];
    system([toShell UTF8String]);
    NSString *resultString = [NSString stringWithContentsOfFile:sshResult encoding:NSUTF8StringEncoding error:nil];
    
    
    if ([resultString rangeOfString:@"ssh -nNTf -D 7000 -i /Users/sunyanguo/awskeypair.pem ec2-user@ec2-52-193-240-141.ap-northeast-1.compute.amazonaws.com"].location != NSNotFound) {
        return 0;
    }
    pid_t pid;
    char *argv[] = {
        "/usr/bin/ssh",
        "-nNTf",
        "-D",
        "7000",
        "-i",
        "/Users/sunyanguo/awskeypair.pem",
        "ec2-user@ec2-52-193-240-141.ap-northeast-1.compute.amazonaws.com",
        NULL
    };
    
    posix_spawn(&pid, argv[0], NULL, NULL, argv, environ);
    printf("%d",pid);
    waitpid(pid, NULL, 0);
    return 1;
}
@end
