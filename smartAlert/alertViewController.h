//
//  alertViewController.h
//  smartAlert
//
//  Created by Daniel Pape on 21/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenSwitch.h"


@interface alertViewController : UIViewController{
    NSUserDefaults *defaults;
}

@property (nonatomic, strong) IBOutlet SevenSwitch *ibSwitch;
@property (strong, nonatomic) IBOutlet UIButton *pulseImage;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;

-(void)setAlert;
- (IBAction) tapSetAlertButton;
@end
