//
//  settingsViewController.h
//  smartAlert
//
//  Created by Daniel Pape on 17/07/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Twitter/Twitter.h>
#import <StoreKit/StoreKit.h>
#import <MessageUI/MessageUI.h>
#import "ViewController.h"
#import "RMStore.h"

@interface settingsViewController : UIViewController<MFMailComposeViewControllerDelegate,ABPeoplePickerNavigationControllerDelegate,SKProductsRequestDelegate,SKPaymentTransactionObserver>{
    NSMutableArray *ChosenContactNames;
    NSMutableArray *ChosenContactNumbers;
    NSUserDefaults *defaults;
    NSString *phoneNumber;
    NSString *contactName;
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
@property (strong, nonatomic) IBOutlet UILabel *numberLabel1;
@property (strong, nonatomic) IBOutlet UIButton *tapEditButton;

@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;
@property (nonatomic, strong) NSDictionary *dictContactDetails;
@property (nonatomic, strong) NSMutableArray *arrContactsData;

@property (strong, nonatomic) NSMutableArray *ChosenContactNames;
@property (strong, nonatomic) NSMutableArray *ChosenContactNumbers;


- (IBAction)tapReturnButton:(id)sender;
- (IBAction)tapEditContactsButton:(id)sender;
- (IBAction)tapContactUsButton:(id)sender;
- (IBAction)tapShareButton;
- (void)setRoundedCorners:(UIView *)roundedView toDiameter:(float)newSize;
- (IBAction)tapEditContactsReturnButton:(id)sender;
-(IBAction)sendEmail:(id)sender;
- (IBAction)tapEditInPopover:(id)sender;
- (IBAction)tapReturnInPopover:(id)sender;
- (IBAction)tapSmallDonationButton:(id)sender;
- (IBAction)tapMediumDonationButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *tapLargeDonationButton;
- (IBAction)tapLargeDonationButton:(id)sender;


@end
