//
//  AppDelegate.m
//  sample
//
//  Created by Yutaka Shimazaki on 2020/08/17.
//  Copyright © 2020 sample. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    RootViewController *root = [RootViewController sharedInstance];
    [self.window setRootViewController:root];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
