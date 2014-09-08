//
//  alertViewController.h
//  smartAlert
//
//  Created by Daniel Pape on 21/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SevenSwitch.h"
#import "UIViewController+MJPopupViewController.h"
#import "ViewController.h"


@interface alertViewController : UIViewController{
    NSUserDefaults *defaults;
}

@property (nonatomic, strong) IBOutlet SevenSwitch *ibSwitch;
@property (strong, nonatomic) IBOutlet UIButton *pulseImage;
@property (strong, nonatomic) IBOutlet UIButton *settingsButton;
@property (strong, nonatomic) IBOutlet UIImageView *alertHasBeenSentView;
@property (strong, nonatomic) IBOutlet UIButton *ReturnButton;
@property (strong, nonatomic) ViewController *VC;

@property(strong, nonatomic) NSMutableArray *contactNames;
@property(strong, nonatomic) NSMutableArray *contactNumbers;


- (IBAction)tapResetButton:(id)sender;
-(void)setAlert;
- (IBAction) tapSetAlertButton;
@end
