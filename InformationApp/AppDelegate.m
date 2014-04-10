//
//  AppDelegate.m
//  InformationApp
//
//  Created by DengWuPing on 14-4-9.
//  Copyright (c) 2014年 DengWuPing. All rights reserved.
//

#import "AppDelegate.h"
#import "LeftSideViewController.h"
#import "RightSideViewController.h"
#import "CenterViewController.h"
#import <MMDrawerController.h>
#import "MMExampleDrawerVisualStateManager.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    LeftSideViewController * leftCtrl = [[LeftSideViewController alloc]initWithNibName:@"LeftSideViewController" bundle:Nil];
    
    RightSideViewController * rightCtrl = [[RightSideViewController alloc]initWithNibName:@"RightSideViewController" bundle:nil];
    
    CenterViewController * centerCtrl = [[CenterViewController alloc]initWithNibName:@"CenterViewController" bundle:nil];
    
    UINavigationController * navgationCtrl =[[UINavigationController alloc]initWithRootViewController:centerCtrl];
    
    MMDrawerController * mmdController = [[MMDrawerController alloc]initWithCenterViewController:navgationCtrl leftDrawerViewController:leftCtrl rightDrawerViewController:rightCtrl];
    
   //设置右边ViewController的显示大小
    [mmdController setMaximumRightDrawerWidth:280.0];
    [mmdController setOpenDrawerGestureModeMask:MMOpenDrawerGestureModeAll];
    [mmdController setCloseDrawerGestureModeMask:MMCloseDrawerGestureModeAll];
    
    [mmdController
     setDrawerVisualStateBlock:^(MMDrawerController *drawerController, MMDrawerSide drawerSide, CGFloat percentVisible) {
         
         MMDrawerControllerDrawerVisualStateBlock block;
         block = [[MMExampleDrawerVisualStateManager sharedManager]
                  drawerVisualStateBlockForDrawerSide:drawerSide];
         if(block){
             block(drawerController, drawerSide, percentVisible);
         }
     }];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self.window setRootViewController:mmdController];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];

    
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
