//
//  AppDelegate.h
//  smartAlert
//
//  Created by Daniel Pape on 20/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
//#import <KinveyKit/KinveyKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate,CLLocationManagerDelegate>{
    NSUserDefaults *defaults;
}

@property (strong, nonatomic) UIWindow *window;

@end
