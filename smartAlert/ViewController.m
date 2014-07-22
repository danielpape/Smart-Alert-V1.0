//
//  ViewController.m
//  smartAlert
//
//  Created by Daniel Pape on 20/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "ViewController.h"
#import "APPChildViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    APPChildViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
    defaults = [[NSUserDefaults alloc]init];
    
    if(ChosenContactNumbers != nil){
        ChosenContactNames = [[NSMutableArray alloc]init];
        ChosenContactNumbers = [[NSMutableArray alloc]init];
        self.contactsLabel.text = [NSString stringWithFormat:@"%@,%@",ChosenContactNames,ChosenContactNumbers];
        NSLog(@"numbers Array is %@",[defaults objectForKey:@"numbersArray"]);
        ChosenContactNumbers = [defaults objectForKey:@"numbersArray"];
        ChosenContactNames = [defaults objectForKey:@"namesArray"];
        [defaults synchronize];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) sendTestText{
    
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = ChosenContactNumbers[0];
    for (int i = 0; i < [str length]; i++) {
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
    }
    
    NSLog(@"old number:%@",array[0]);
    
    if ([array[0] isEqualToString:@"0"]) {
        [array removeObjectAtIndex:0];
        [array insertObject:@"44" atIndex:0];
    }
    
    NSLog(@"new number: %@",array);
    
    NSString *contactnumber = [[array valueForKey:@"description"] componentsJoinedByString:@""];
    
    NSLog(@"contactNumber= %@",contactnumber);

    
    NSString *URL = [NSString stringWithFormat:@"http://rest.nexmo.com/sms/xml?api_key=ac8488f3&api_secret=e30532b5&from=SmartAlert&to=%@&text=ThisIsATest!",contactnumber];
   
    NSURL *textURL = [NSURL URLWithString:URL];
    
    [[UIApplication sharedApplication] openURL: textURL];

}

-(void)showAddressBook{
    _addressBookController = [[ABPeoplePickerNavigationController alloc] init];
    [_addressBookController setPeoplePickerDelegate:self];
    _addressBookController.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:_addressBookController animated:YES completion:nil];
}

-(void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker{
    [_addressBookController dismissViewControllerAnimated:YES completion:nil];
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person{
    
    NSMutableDictionary *contactInfoDict = [[NSMutableDictionary alloc]
                                            initWithObjects:@[@"", @"", @"", @"", @"", @"", @"", @"", @""]
                                            forKeys:@[@"firstName", @"lastName", @"mobileNumber", @"homeNumber", @"homeEmail", @"workEmail", @"address", @"zipCode", @"city"]];
    
    CFTypeRef generalCFObject = ABRecordCopyValue(person, kABPersonFirstNameProperty);
    
    if (generalCFObject) {
        [contactInfoDict setObject:(__bridge NSString *)generalCFObject forKey:@"firstName"];
        CFRelease(generalCFObject);
    }
    
    generalCFObject = ABRecordCopyValue(person, kABPersonLastNameProperty);
    if (generalCFObject) {
        [contactInfoDict setObject:(__bridge NSString *)generalCFObject forKey:@"lastName"];
        CFRelease(generalCFObject);
    }
    
    
    ABMultiValueRef phonesRef = ABRecordCopyValue(person, kABPersonPhoneProperty);
    for (int i=0; i<ABMultiValueGetCount(phonesRef); i++) {
        CFStringRef currentPhoneLabel = ABMultiValueCopyLabelAtIndex(phonesRef, i);
        CFStringRef currentPhoneValue = ABMultiValueCopyValueAtIndex(phonesRef, i);
        
        if (CFStringCompare(currentPhoneLabel, kABPersonPhoneMobileLabel, 0) == kCFCompareEqualTo) {
            [contactInfoDict setObject:(__bridge NSString *)currentPhoneValue forKey:@"mobileNumber"];
        }
        
        if (CFStringCompare(currentPhoneLabel, kABHomeLabel, 0) == kCFCompareEqualTo) {
            [contactInfoDict setObject:(__bridge NSString *)currentPhoneValue forKey:@"homeNumber"];
        }
        
        CFRelease(currentPhoneLabel);
        CFRelease(currentPhoneValue);
    }
    CFRelease(phonesRef);
    
    
    if (_arrContactsData == nil) {
        _arrContactsData = [[NSMutableArray alloc] init];
    }
    [_arrContactsData addObject:contactInfoDict];
    [_addressBookController dismissViewControllerAnimated:YES completion:nil];
    
    phoneNumber = [NSString stringWithFormat:@"%@",[contactInfoDict objectForKey:@"mobileNumber"]];
    contactName = [NSString stringWithFormat:@"%@ %@",[contactInfoDict objectForKey:@"firstName"],[contactInfoDict objectForKey:@"lastName"]];
    
    NSLog(@"%@",contactName);
    NSLog(@"%@",phoneNumber);
    
    if (ChosenContactNumbers == nil) {
        ChosenContactNames = [[NSMutableArray alloc]init];
        ChosenContactNumbers = [[NSMutableArray alloc]init];
    }
    
    [ChosenContactNames addObject:contactName];
    [ChosenContactNumbers addObject:phoneNumber];
    
    NSLog(@"%@,%@",ChosenContactNames,ChosenContactNumbers);
    self.contactsLabel.text = [NSString stringWithFormat:@"%@,%@",ChosenContactNames,ChosenContactNumbers];
    
    return NO;
    
    defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:ChosenContactNames forKey:@"namesArray"];
    [defaults setObject:ChosenContactNumbers forKey:@"numbersArray"];
    [defaults synchronize];
    
    
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}



//Background Timer


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
    [NSTimer scheduledTimerWithTimeInterval:300.0 target:self selector:@selector(makeNotificationRequest:) userInfo:nil repeats:YES];
}

-(void)makeNotificationRequest:(UILocalNotification *)timer
{
    
    // NSComparisonResult result = [checkupTime compare:[NSDate date]];
    
    //if (result==NSOrderedAscending) {
        
        
        UILocalNotification *checkupAlarm = [[UILocalNotification alloc]init];
        checkupAlarm.fireDate = [NSDate date];
        checkupAlarm.alertBody = @"Test Notification";
        
        [checkupAlarm setHasAction:YES];
        [[UIApplication sharedApplication] scheduleLocalNotification:checkupAlarm];
    //}else{
        
    //}
    
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
    
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        
        
        
        
    }
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"goToAlarm"]) {
        
        //NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSString *string = [feeds[indexPath.row] objectForKey: @"link"];
       // [[segue destinationViewController] setUrl:string];
        
    }
}

- (APPChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    APPChildViewController *childViewController = [[APPChildViewController alloc] initWithNibName:@"APPChildViewController" bundle:nil];
    childViewController.index = index;
    
    return childViewController;
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(APPChildViewController *)viewController index];
    
    if (index == 0) {
        return nil;
    }
    
    // Decrease the index by 1 to return
    index--;
    
    return [self viewControllerAtIndex:index];
    
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSUInteger index = [(APPChildViewController *)viewController index];
    
    index++;
    
    if (index == 5) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}


@end
