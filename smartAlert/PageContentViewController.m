//
//  PageContentViewController.m
//  PageViewDemo
//
//  Created by Simon on 24/11/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "PageContentViewController.h"

@interface PageContentViewController ()

@end

@implementation PageContentViewController

#define   IS_IPHONE_5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if (!IS_IPHONE_5) {
        [self.backgroundImageView setFrame:CGRectMake(0, 0, 320, 480)];
        self.beginButton.center =CGPointMake(160, 324);
    }
    
    self.backgroundImageView.image = [UIImage imageNamed:self.imageFile];
    self.titleLabel.text = self.titleText;
    
    NSLog(@"%u",_pageIndex);
    
    
    if (_pageIndex == 1) {
        self.dataEntryView.alpha = 1;
    }
    
    if (_pageIndex >=1) {
        self.swipeLabel.alpha = 0;
    }
    
    if (_pageIndex == 2) {
        self.dataEntryView.alpha = 0;
        self.addContactButton.alpha = 1;
    }
    
    if (_pageIndex == 6) {
        self.slideArrowImageView.alpha = 0;
        if (!IS_IPHONE_5) {
            self.iPhone4BeginButton.alpha = 1;
        }else{
            self.beginButton.alpha = 1;
        }
    }
    if (_pageIndex >= 3) {
        self.slideArrowImageView.highlighted = YES;
    }
    
    dataEntryViewOrigin = [self.dataEntryView center];
    self.nameTextBox.returnKeyType = UIReturnKeyNext;
    self.numberTextBox.returnKeyType = UIReturnKeyDone;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapRemoveC1:(id)sender {
    [self showAddressBook];
}

- (IBAction)tapRemoveC2:(id)sender {
}

- (IBAction)tapRemoveC3:(id)sender {
}

- (IBAction)tapRemoveC4:(id)sender {
}

- (IBAction)tapRemoveC5:(id)sender {
}

- (IBAction)tapAdd2:(id)sender {
    [self showAddressBook];
}

- (IBAction)tapAdd3:(id)sender {
}

- (IBAction)tapAdd4:(id)sender {
}

- (IBAction)tapAdd5:(id)sender {
}
- (IBAction)tapBeginButton:(id)sender {
    UIViewController *purchaseContr = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"alertView"];
    //menu is only an example
    purchaseContr.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:purchaseContr animated:YES completion:nil];
}

- (IBAction)topReturnKeyPressed:(id)sender{
    [self.numberTextBox becomeFirstResponder];
    if (!IS_IPHONE_5) {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGPoint center = [self.dataEntryView center];
    center.y = dataEntryViewOrigin.y-100;
    [self.dataEntryView setCenter:center];
    [UIView commitAnimations];
    }
}


- (IBAction)returnKeyPressed:(id)sender {
     [sender resignFirstResponder];
    
    _nameString = [self formatName:[NSString stringWithFormat:self.nameTextBox.text]];
    _numberString = [self formatNumber:[NSString stringWithFormat:self.numberTextBox.text]];

    NSLog (@"My name string is %@",_nameString);
    NSLog (@"My number string is %@",_numberString);

    
    defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:_nameString forKey:@"myName"];
    [defaults setObject:_numberString forKey:@"myNumber"];
    [defaults synchronize];
    
    NSLog (@"My saved name is %@",[defaults objectForKey:@"myName"]);
    NSLog (@"My saved number is %@",[defaults objectForKey:@"myNumber"]);
    
    if (![_nameString isEqualToString:@""] && ![_numberString isEqualToString:@""]) {
        for(UIScrollView *view in self.parentViewController.view.subviews) {
            
            if ([view isKindOfClass:[UIScrollView class]]) {
                
                view.scrollEnabled = YES;
            }
        }

    }
    
    if (!IS_IPHONE_5) {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGPoint center = [self.dataEntryView center];
    center.y = dataEntryViewOrigin.y;
    [self.dataEntryView setCenter:center];
    [UIView commitAnimations];
    }
    
}

- (void)displaySlide2Content{
    self.backgroundImageView.alpha = 0;
    self.titleLabel.alpha = 0;
    self.addContactButton.alpha = 1;
}

- (IBAction)tapAddContactButton:(id)sender {
    [self showAddressBook];
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
    
    self.addContactButton.alpha = 0;
    self.contact1label.alpha = 1;
    self.numberLabel.alpha = 1;
    self.removeC1.alpha = 1;
    self.add2.alpha = 1;
    self.contact1label.text = [NSString stringWithFormat:@"%@",[contactInfoDict objectForKey:@"firstName"]];
    self.numberLabel.text = [NSString stringWithFormat:@"%@",[contactInfoDict objectForKey:@"mobileNumber"]];

    
    NSLog(@"%@",contactName);
    NSLog(@"%@",phoneNumber);
    
//    ViewController * VC = [[ViewController alloc]init];
    
    if (self.ChosenContactNumbers == nil) {
        self.ChosenContactNames = [[NSMutableArray alloc]init];
        self.ChosenContactNumbers = [[NSMutableArray alloc]init];
    }
    
    [self.ChosenContactNames addObject:contactName];
    [self.ChosenContactNumbers addObject:phoneNumber];
    
    NSLog(@"%@,%@",self.ChosenContactNames,self.ChosenContactNumbers);
//    self.contactsLabel.text = [NSString stringWithFormat:@"%@,%@",self.ChosenContactNames,self.ChosenContactNumbers];
    
    defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:self.ChosenContactNames forKey:@"namesArray"];
    [defaults setObject:self.ChosenContactNumbers forKey:@"numbersArray"];
    [defaults synchronize];
    
    NSLog(@"Contacts Names Data is: %@",[self.ChosenContactNames objectAtIndex:0]);
    NSLog(@"Contacts Numbers Data is: %@",[self.ChosenContactNumbers objectAtIndex:0]);
    
    self.titleLabel.text = [NSString stringWithFormat:@"Thanks, %@. Please swipe to continue.",[defaults objectForKey:@"myName"]];
    
    
    for(UIScrollView *view in self.parentViewController.view.subviews) {
        
        if ([view isKindOfClass:[UIScrollView class]]) {
            
            view.scrollEnabled = YES;
        }
    }
    
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Country Code" message:@"Please use a country code in your number" delegate:self cancelButtonTitle:@"Continue" otherButtonTitles:nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    UITextField * alertTextField = [alert textFieldAtIndex:0];
    alertTextField.keyboardType = UIKeyboardTypePhonePad;
    alertTextField.text = [self.ChosenContactNumbers objectAtIndex:0];
    [alert show];
    return NO;
   
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *number = [[alertView textFieldAtIndex:0] text];
    NSString *formattedNumber = [self formatNumber:number];
    defaults = [[NSUserDefaults alloc]init];
    [self.ChosenContactNumbers removeAllObjects];
    [self.ChosenContactNumbers addObject:formattedNumber];
    [defaults setObject:self.ChosenContactNumbers forKey:@"numbersArray"];
    [defaults synchronize];
    NSLog(@"number changed to: %@",[self.ChosenContactNumbers objectAtIndex:0]);
    
    self.numberLabel.text = [NSString stringWithFormat:@"%@",[self.ChosenContactNumbers objectAtIndex:0]];
}

-(BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier{
    return NO;
}

-(NSString*)formatNumber:(NSString*)number{
    NSString *string = number;
    NSLog(@"number was %@",number);
    
    NSString *formattedNumberString = [[string componentsSeparatedByCharactersInSet:
                            [[NSCharacterSet decimalDigitCharacterSet] invertedSet]]
                           componentsJoinedByString:@""];
    NSLog(@"new number is %@",formattedNumberString);
    
    return formattedNumberString;
}

-(NSString*)formatName:(NSString*)name{
    NSString *string = name;
    NSLog(@"name was %@",name);
    
    NSString *formattedNameString = [[string componentsSeparatedByCharactersInSet:
                                        [[NSCharacterSet alphanumericCharacterSet] invertedSet]]
                                       componentsJoinedByString:@""];
    NSLog(@"new name is %@",formattedNameString);
    
    return formattedNameString;
}


@end