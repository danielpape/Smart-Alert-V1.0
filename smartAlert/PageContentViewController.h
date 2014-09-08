//
//  PageContentViewController.h
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface PageContentViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate>{
    NSString *phoneNumber;
    NSString *contactName;
    NSString *message;
    NSDate *checkupTime;
    NSUserDefaults *defaults;
}

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIImageView *slideArrowImageView;

@property (strong, nonatomic) NSMutableArray *ChosenContactNames;
@property (strong, nonatomic) NSMutableArray *ChosenContactNumbers;
@property (strong, nonatomic) IBOutlet UILabel *numberLabel;

@property (strong, nonatomic) IBOutlet UILabel *contact1label;
@property (strong, nonatomic) IBOutlet UILabel *contact2label;
@property (strong, nonatomic) IBOutlet UILabel *contact3label;
@property (strong, nonatomic) IBOutlet UILabel *contact4label;
@property (strong, nonatomic) IBOutlet UILabel *contact5label;

@property (strong, nonatomic) IBOutlet UIButton *removeC1;
@property (strong, nonatomic) IBOutlet UIButton *removeC2;
@property (strong, nonatomic) IBOutlet UIButton *removeC3;
@property (strong, nonatomic) IBOutlet UIButton *removeC4;
@property (strong, nonatomic) IBOutlet UIButton *removeC5;

- (IBAction)tapRemoveC1:(id)sender;
- (IBAction)tapRemoveC2:(id)sender;
- (IBAction)tapRemoveC3:(id)sender;
- (IBAction)tapRemoveC4:(id)sender;
- (IBAction)tapRemoveC5:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *add2;
@property (strong, nonatomic) IBOutlet UIButton *add3;
@property (strong, nonatomic) IBOutlet UIButton *add4;
@property (strong, nonatomic) IBOutlet UIButton *add5;

- (IBAction)tapAdd2:(id)sender;
- (IBAction)tapAdd3:(id)sender;
- (IBAction)tapAdd4:(id)sender;
- (IBAction)tapAdd5:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *addContactButton;
@property (strong, nonatomic) IBOutlet UIButton *beginButton;
- (IBAction)tapBeginButton:(id)sender;
- (IBAction)tapAddContactButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *iPhone4BeginButton;

@property NSUInteger pageIndex;
@property NSString *titleText;
@property NSString *imageFile;
//@property (strong, nonatomic) ViewController *VC;

@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;
@property (nonatomic, strong) NSDictionary *dictContactDetails;
@property (nonatomic, strong) NSMutableArray *arrContactsData;

- (void)displaySlide2Content;
@end
