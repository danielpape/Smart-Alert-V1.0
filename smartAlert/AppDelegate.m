//
//  AppDelegate.m
//  smartAlert
//
//  Created by Daniel Pape on 20/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIBarButtonItem appearance] setTintColor:[UIColor colorWithRed:202.0/255.0
                                                               green:34.0/255.0
                                                                blue:62.0/255.0
                                                               alpha:1.0]];
    
    defaults = [[NSUserDefaults alloc]init];
    
    NSLog(@"%hhd",[defaults boolForKey:@"returnVisit"]);
    NSLog(@"%hhd",[defaults boolForKey:@"alertSet"]);
    
    if ([defaults boolForKey:@"alertSet"]) {
        UIViewController *controller = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"setView"];
        self.window.rootViewController = controller;
        
    }else{
        if ([defaults boolForKey:@"returnVisit"]) {
            UIViewController *controller = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"alertView"];
            self.window.rootViewController = controller;
        }else{
        
            UIViewController *controller = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"intro"];
            self.window.rootViewController = controller;
        }
    }
    
    
//    UIPageControl *pageControl = [UIPageControl appearance];
//    pageControl.pageIndicatorTintColor = [UIColor whiteColor];
//    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
//    pageControl.backgroundColor = [UIColor clearColor];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}
- (void)applicationWillEnterForeground:(UIApplication *)application
{
    defaults = [[NSUserDefaults alloc]init];
    
    NSLog(@"%hhd",[defaults boolForKey:@"returnVisit"]);
    
    if ([defaults boolForKey:@"alertSet"]) {
        UIViewController *controller = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"setView"];
        self.window.rootViewController = controller;
        
    }else{
        if ([defaults boolForKey:@"returnVisit"]) {
            UIViewController *controller = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"alertView"];
            self.window.rootViewController = controller;
        }else{
            
            UIViewController *controller = [self.window.rootViewController.storyboard instantiateViewControllerWithIdentifier:@"intro"];
            self.window.rootViewController = controller;
        }
    }

    
    UIPageControl *pageControl = [UIPageControl appearance];
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor blackColor];
    pageControl.backgroundColor = [UIColor whiteColor];

}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
   /* CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    [locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    
    
    [KCSPing pingKinveyWithBlock:^(KCSPingResult *result) {
        if (result.pingWasSuccessful == YES){
            NSLog(@"Kinvey Ping Success");
        } else {
            NSLog(@"Kinvey Ping Failed");
        }
    }];

    
    if ([CLLocationManager locationServicesEnabled]) {
        // Find the current location
        [locationManager startMonitoringSignificantLocationChanges];
        //rest of code...
    }*/
}
/*
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    // locations contains an array of recent locations, but this app only cares about the most recent
    // which is also "manager.location"
   // [self foundLocation:manager.location]; // update the user object in this method
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Location manager failed with error: %@", error);
    if ([error.domain isEqualToString:kCLErrorDomain] && error.code == kCLErrorDenied) {
        //user denied location services so stop updating manager
        [manager stopUpdatingLocation];
        //respect user privacy and remove stored location
        CLLocation* currentLocation = [[KCSUser activeUser] getValueForAttribute:KCSEntityKeyGeolocation];
        if (currentLocation != nil) {
            [[KCSUser activeUser] removeValueForAttribute:KCSEntityKeyGeolocation];
            [[KCSUser activeUser] saveWithCompletionBlock:^(NSArray *objectsOrNil, NSError *errorOrNil) {
                NSLog(@"saved user: %@ - %@", @(errorOrNil == nil), errorOrNil);
            }];
        }
    }*/
//}

//- (void)foundLocation:(CLLocation *)location
//{
    //[[KCSUser activeUser] setValue:location forAttribute:KCSEntityKeyGeolocation];
   // [[KCSUser activeUser] saveWithCompletionBlock:^(NSArray *objectsOrNil, NSError *errorOrNil) {
  //      NSLog(@"saved user: %@ - %@", @(errorOrNil == nil), errorOrNil);
  //  }];
    
   // NSLog(@"Found your location! It's %@",location);
//}




@end
