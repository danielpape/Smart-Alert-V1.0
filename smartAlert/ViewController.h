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

@interface ViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate, UIPageViewControllerDataSource>{
    NSString *phoneNumber;
    NSString *contactName;
    NSString *message;
    NSMutableArray *ChosenContactNames;
    NSMutableArray *ChosenContactNumbers;
    NSDate *checkupTime;
    NSUserDefaults *defaults;
}

@property (nonatomic, strong) ABPeoplePickerNavigationController *addressBookController;
@property (nonatomic, strong) NSDictionary *dictContactDetails;
@property (nonatomic, strong) NSMutableArray *arrContactsData;
@property (strong, nonatomic) IBOutlet UITextView *contactsLabel;
@property (strong, nonatomic) UIPageViewController *pageController;

@property (strong, nonatomic) IBOutlet UIImageView *pulse1;
@property (strong, nonatomic) IBOutlet UIImageView *pulse2;

- (IBAction) sendTestText;
- (IBAction) showAddressBook;

@end
