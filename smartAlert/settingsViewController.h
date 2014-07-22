//
//  settingsViewController.h
//  smartAlert
//
//  Created by Daniel Pape on 17/07/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>

@interface settingsViewController : UIViewController{
    NSMutableArray *ChosenContactNames;
    NSMutableArray *ChosenContactNumbers;
}
@property (strong, nonatomic) IBOutlet UIView *editContactsView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel1;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel2;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel3;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel4;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel5;
@property (strong, nonatomic) IBOutlet UISwitch *switch1;
@property (strong, nonatomic) IBOutlet UISwitch *switch2;
@property (strong, nonatomic) IBOutlet UISwitch *switch3;
@property (strong, nonatomic) IBOutlet UISwitch *switch4;
@property (strong, nonatomic) IBOutlet UISwitch *switch5;

- (IBAction)tapReturnButton:(id)sender;
- (IBAction)tapEditContactsButton:(id)sender;
- (IBAction)tapContactUsButton:(id)sender;
- (IBAction)tapShareButton;
- (void)setRoundedCorners:(UIView *)roundedView toDiameter:(float)newSize;
- (IBAction)tapEditContactsReturnButton:(id)sender;


@end
