//
//  AppDelegate.m
//  HotelsDotCom
//
//  Created by Nuzhat Zari on 21/12/20.
//  Copyright © 2020 Nuzhat Zari. All rights reserved.
//

#import "AppDelegate.h"
#import "Utility.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"Host"] == nil) {
        NSString *host = [Utility valueForKeyFromInfoPlist:@"Host"];
        if ( host != nil ) {
            [[NSUserDefaults standardUserDefaults] setObject:host forKey:@"Host"];
        }
    }
    //5fc4eb87cdmsh93062bc8aeafd62p1de7d2jsn689af8da7fe3
    //a7474bdac2mshc34cce1e05c318cp18b81ejsn8cf34b801981
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"APIKey"] == nil) {
        NSString *apiKey = [Utility valueForKeyFromInfoPlist:@"APIKey"];
        if (apiKey != nil){
            [[NSUserDefaults standardUserDefaults] setObject:apiKey forKey:@"APIKey"];
        }
    }
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
