//
//  ViewController.h
//  smartAlert
//
//  Created by Daniel Pape on 20/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBook/AddressBook.h>
#import <AddressBookUI/AddressBookUI.h>
#import <CoreLocation/CoreLocation.h>
#import "UIViewController+MJPopupViewController.h"
#import "PageContentViewController.h"



@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate,UIPageViewControllerDataSource>{
    NSString *contactName;
    NSString *message;
    NSDate *checkupTime;
    NSUserDefaults *defaults;
}

@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;
@property (nonatomic, strong) NSDictionary *dictContactDetails;
@property (nonatomic, strong) NSMutableArray *arrContactsData;
@property (strong, nonatomic) IBOutlet UITextView *contactsLabel;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (strong, nonatomic) NSString *phoneNumber;
@property (strong, nonatomic) NSMutableArray *ChosenContactNames;
@property (strong, nonatomic) NSMutableArray *ChosenContactNumbers;


@property (strong, nonatomic) UIPageViewController *pageViewController;
//@property (strong, nonatomic) PageContentViewController *PCVC;
@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageImages;

@property (strong, nonatomic) IBOutlet UIImageView *pulse1;
@property (strong, nonatomic) IBOutlet UIImageView *pulse2;

- (IBAction) sendTestText;
- (IBAction) showAddressBook;

@end
