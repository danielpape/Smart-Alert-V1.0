//
//  ViewController.m
//  smartAlert
//
//  Created by Daniel Pape on 20/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

#define   IS_IPHONE_5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    _ChosenContactNames = [[NSMutableArray alloc] initWithObjects:@"Dan",@"John",@"Katy",@"David", @"Betty", nil];
//    _ChosenContactNames = [NSMutableArray arrayWithObjects:@"Dan",@"John",@"Katy",@"David", @"Betty", nil];
    
    defaults = [[NSUserDefaults alloc]init];
    
    if(_ChosenContactNumbers != nil){
        _ChosenContactNames = [[NSMutableArray alloc]init];
        _ChosenContactNumbers = [[NSMutableArray alloc]init];
        self.contactsLabel.text = [NSString stringWithFormat:@"%@,%@",_ChosenContactNames,_ChosenContactNumbers];
        NSLog(@"numbers Array is %@",[defaults objectForKey:@"numbersArray"]);
        _ChosenContactNumbers = [defaults objectForKey:@"numbersArray"];
        _ChosenContactNames = [defaults objectForKey:@"namesArray"];
        [defaults synchronize];
    }
    
    // Create the data model
    if (IS_IPHONE_5) {
         _pageTitles = @[@"Welcome to Smart Alert. This is your emergency response app in case you need help.", @"First we'll need to know who you want to contact in an emergency, select the names from your address book by tapping above.", @"This is the main page. If you press the Send Alert button once at any time it will instantly send an emergency message to the contact(s) that you just selected.", @"Here you can prime the app so that the next time it's opened, it will automatically start counting down to send an emergency message.", @"If you use Prime, we recommend you move the Smart Alert onto your favourites bar for easy access. Hold down on the icon until it wiggles to move it here.", @"You're ready to go! You can replay this tutorial, change your contacts or make a donation to keep us going at any time using on the settings page."];
    }else if(!IS_IPHONE_5){
    _pageTitles = @[@"Welcome to Smart Alert. This is your emergency response app in case you need help.", @"First we'll need to know who you want to contact in an emergency, select the names from your address book by tapping above.", @"", @"", @"", @""];
    }
        
    if (IS_IPHONE_5) {
        _pageImages = @[@"appIconIntroScreen.png", @"addContactImage.png", @"overlay2.png", @"overlay3.png", @"movetodock.png", @"overlay4.png"];
    }else if (!IS_IPHONE_5){
    _pageImages = @[@"appIconIntroScreen.png", @"addContactImage.png", @"overlay2-4.png", @"overlay3-4.png", @"movetodock-4.png", @"overlay4-4.png"];
    }
    
    if (!IS_IPHONE_5) {
        self.backgroundImage.image = [UIImage imageNamed:@"iPhone4Screen.png"];
    }

    // Create page view controller
    self.pageViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.pageViewController.dataSource = self;
    
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    // Change the size of page view controller
    self.pageViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [self addChildViewController:_pageViewController];
    [self.view addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) sendTestText{
    
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = _ChosenContactNumbers[0];
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

    
    NSString *URL = [NSString stringWithFormat:@"http://rest.nexmo.com/sms/xml?api_key=ac8488f3&api_secret=e30532b5&from=SmartAlert&to=%@&text=From%20%@%20please%20contact%20me%20ASAP%20I%20may%20currently%20be%20in%20an%20emergency%20situation%20and%20need%20your%20help.%20Sent%20via%20Smart%20Alert",[[UIDevice currentDevice] name],contactnumber];
   
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
    
    _phoneNumber = [NSString stringWithFormat:@"%@",[contactInfoDict objectForKey:@"mobileNumber"]];
    contactName = [NSString stringWithFormat:@"%@ %@",[contactInfoDict objectForKey:@"firstName"],[contactInfoDict objectForKey:@"lastName"]];
    
    NSLog(@"%@",contactName);
    NSLog(@"%@",_phoneNumber);
    
    if (_ChosenContactNumbers == nil) {
        _ChosenContactNames = [[NSMutableArray alloc]init];
        _ChosenContactNumbers = [[NSMutableArray alloc]init];
    }
    
    [_ChosenContactNames addObject:contactName];
    [_ChosenContactNumbers addObject:_phoneNumber];
    
    NSLog(@"%@,%@",_ChosenContactNames,_ChosenContactNumbers);
    self.contactsLabel.text = [NSString stringWithFormat:@"%@,%@",_ChosenContactNames,_ChosenContactNumbers];
    
    defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:_ChosenContactNames forKey:@"namesArray"];
    [defaults setObject:_ChosenContactNumbers forKey:@"numbersArray"];
    [defaults synchronize];
    
    NSLog(@"chosen names count = %ul",_ChosenContactNames.count);
    
    return NO;
    

    
    
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

- (IBAction)startWalkthrough:(id)sender {
    PageContentViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.pageViewController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (PageContentViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }

    
    // Create a new view controller and pass suitable data.
    PageContentViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    pageContentViewController.imageFile = self.pageImages[index];
    pageContentViewController.titleText = self.pageTitles[index];
//    pageContentViewController.titleText = [NSString stringWithFormat:@"%lu",(unsigned long)index];
    pageContentViewController.pageIndex = index;
    
    if (pageContentViewController.pageIndex==1) {
        self.backgroundImage.alpha = 0;
    }
    
    if (pageContentViewController.pageIndex==2) {
        self.backgroundImage.alpha = 0;
        
        if(_ChosenContactNames.count == 0){
            for (UIScrollView *view in self.pageViewController.view.subviews) {
                
                if ([view isKindOfClass:[UIScrollView class]]) {
                    
                    view.scrollEnabled = NO;
                }
            }
        }
    }
    
    if (pageContentViewController.pageIndex==3) {
        self.backgroundImage.alpha = 1;
        
        if(_ChosenContactNames.count == 0){
            
        }
    }
    
    if (pageContentViewController.pageIndex==4) {
        self.backgroundImage.alpha = 1;
    }
    
    if (pageContentViewController.pageIndex==5) {
        self.backgroundImage.alpha = 1;
    }
    
    if (pageContentViewController.pageIndex==6) {
        self.backgroundImage.alpha = 1;
        pageContentViewController.beginButton.alpha = 1;
    }


    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((PageContentViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
        
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
        
}
    return [self viewControllerAtIndex:index];

    
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

@end
