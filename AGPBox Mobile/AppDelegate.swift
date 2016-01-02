//
//  AppDelegate.swift
//  AGPBox Mobile
//
//  Created by Andrew Augustine on 10/6/15.
//  Copyright © 2015 Andrew Augustine. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit
import PubNub
import Crashlytics
import DigitsKit
import Stripe



@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var client: PubNub?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        Fabric.with([Digits.self, Twitter.self, PubNub.self, Crashlytics.self, STPAPIClient.self])
        self.client = PubNub.client()
        self.client?.historyForChannel("lobby", withCompletion: { (result, status) -> Void in
            
            if status == nil {
                
                // Handle downloaded history using:
                //   result.data.start - oldest message time stamp in response
                //   result.data.end - newest message time stamp in response
                //   result.data.messages - list of messages
            }
            else {
                
                // Handle message history download error. Check 'category' property
                // to find out possible reason because of which request did fail.
                // Review 'errorData' property (which has PNErrorData data type) of status
                // object to get additional information about issue.
                //
                // Request can be resent using: status.retry()
            }
        })
        
        let settings = UIUserNotificationSettings(forTypes: [.Badge, .Sound, .Alert], categories: nil)
        UIApplication.sharedApplication().registerUserNotificationSettings(settings)
        UIApplication.sharedApplication().registerForRemoteNotifications()
        return true
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        
        self.client?.addPushNotificationsOnChannels(["announcements"], withDevicePushToken: deviceToken,
            andCompletion: { (status) -> Void in
                
                if !status.error {
                    
                    // Handle successful push notification enabling on passed channels.
                }
                else {
                    
                    // Handle modification error. Check 'category' property
                    // to find out possible reason because of which request did fail.
                    // Review 'errorData' property (which has PNErrorData data type) of status
                    // object to get additional information about issue.
                    //
                    // Request can be resent using: status.retry()
                }
        })
        // We have our devide push token now.
    }
    
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        
        // Something went wrong and you better to look into error description.
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

