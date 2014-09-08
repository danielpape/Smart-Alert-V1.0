//
//  setViewController.h
//  smartAlert
//
//  Created by Daniel Pape on 25/06/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface setViewController : UIViewController{
    NSMutableArray *ChosenContactNames;
    NSMutableArray *ChosenContactNumbers;
    NSUserDefaults *defaults;
}

@property (strong, nonatomic) IBOutlet UILabel *timerLabel;
@property (strong, nonatomic) IBOutlet UIView *CDView10;
@property (strong, nonatomic) IBOutlet UIView *CDView9;
@property (strong, nonatomic) IBOutlet UIView *CDView8;
@property (strong, nonatomic) IBOutlet UIView *CDView7;
@property (strong, nonatomic) IBOutlet UIView *CDView6;
@property (strong, nonatomic) IBOutlet UIView *CDView5;
@property (strong, nonatomic) IBOutlet UIView *CDView4;
@property (strong, nonatomic) IBOutlet UIView *CDView3;
@property (strong, nonatomic) IBOutlet UIView *CDView2;
@property (strong, nonatomic) IBOutlet UIView *CDView1;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property(strong, nonatomic) NSMutableArray *contactNumbers;

- (IBAction)tapResetButton;
- (IBAction) cancelAlert;

@end
