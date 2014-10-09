//
//  settingsViewController.m
//  smartAlert
//
//  Created by Daniel Pape on 17/07/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "settingsViewController.h"

@interface settingsViewController ()

@end

@implementation settingsViewController

#define kTutorialPointProductID @"com.zingapps.smartalert.donation1"

SKProductsRequest *productsRequest;
NSArray *validProducts;
BOOL purchased;

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
    [self setRoundedCorners:self.editContactsView toDiameter:10];
    
    defaults = [[NSUserDefaults alloc]init];
    ChosenContactNames = [defaults objectForKey:@"namesArray"];
    ChosenContactNumbers = [defaults objectForKey:@"numbersArray"];
    
    NSLog(@"Numbers are: %@",ChosenContactNumbers);
    NSLog(@"Names are: %@",ChosenContactNames);
    
    self.nameLabel1.text = [ChosenContactNames objectAtIndex:0];
    self.numberLabel1.text = [ChosenContactNumbers objectAtIndex:0];
    
    NSSet *products = [NSSet setWithArray:@[@"com.zingapps.smartalert.donation1", @"com.zingapps.smartalert.donation2", @"com.zingapps.smartalert.donation3"]];
    [[RMStore defaultStore] requestProducts:products success:^(NSArray *products, NSArray *invalidProductIdentifiers) {
        NSLog(@"Products loaded");
    } failure:^(NSError *error) {
        NSLog(@"Something went wrong");
    }];
    
//    if([ChosenContactNames objectAtIndex:0] != nil){
//        self.nameLabel1.alpha = 1;
//        self.switch1.alpha = 1;
//    self.nameLabel1.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:0]];
//    }else{
//        self.nameLabel1.alpha = 0;
//        self.switch1.alpha = 0;
//    }
//    
//    if([ChosenContactNames objectAtIndex:1] != nil){
//        self.nameLabel2.alpha = 1;
//        self.switch2.alpha = 1;
//        self.nameLabel2.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:1]];
//    }else{
//        self.nameLabel2.alpha = 0;
//        self.switch2.alpha = 0;
//    }
//    
//    if([ChosenContactNames objectAtIndex:2] != nil){
//        self.nameLabel3.alpha = 1;
//        self.switch3.alpha = 1;
//        self.nameLabel3.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:2]];
//    }else{
//        self.nameLabel3.alpha = 0;
//        self.switch3.alpha = 0;
//    }
//    
//    if([ChosenContactNames objectAtIndex:3] != nil){
//        self.nameLabel4.alpha = 1;
//        self.switch4.alpha = 1;
//        self.nameLabel4.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:3]];
//    }else{
//        self.nameLabel4.alpha = 0;
//        self.switch4.alpha = 0;
//    }
//    
//    if([ChosenContactNames objectAtIndex:4] != nil){
//        self.nameLabel5.alpha = 1;
//        self.switch5.alpha = 1;
//        self.nameLabel5.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:4]];
//    }else{
//        self.nameLabel5.alpha = 0;
//        self.switch5.alpha = 0;
//    }
    
//    [defaults setObject:self.nameLabel1 forKey:@"namesArray"];
//    [defaults setObject:self.numberLabel1 forKey:@"numbersArray"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapReturnButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
     
}

- (IBAction)tapEditContactsButton:(id)sender {
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGPoint center = [self.editContactsView center];
    center.x = self.view.bounds.size.width/2;
    center.y = self.view.bounds.size.height/2;
    [self.editContactsView setCenter:center];
    [UIView commitAnimations];
}

- (IBAction)tapContactUsButton:(id)sender {
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/us/app/smart-alert-an-app-for-life/id903103583"]];
}

- (IBAction)tapShareButton{
if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook]) {
    //2
    SLComposeViewController *FBSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeFacebook];
    //3
        [FBSheet setInitialText:@"Check Out Smart Alert, the emergency response app. Now available on the App Store http://bit.ly/1pTSwI4"];
    [FBSheet addImage:[UIImage imageNamed:@"appIcon001.png"]];
    //[tweetSheet addImage:image];
    //4
    [self presentViewController:FBSheet animated:YES completion:nil];
}
else {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please log in" message:@"Please log in to Facebook in the Settings app" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}
}

-(void)setRoundedCorners:(UIView *)roundedView toDiameter:(float)newSize{
    CGPoint saveCenter = roundedView.center;
    CGRect newFrame = CGRectMake(roundedView.frame.origin.x, roundedView.frame.origin.y, newSize, newSize);
    roundedView.frame = newFrame;
    roundedView.layer.cornerRadius = newSize;
    roundedView.center = saveCenter;
}

- (IBAction)tapEditContactsReturnButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGPoint center = [self.editContactsView center];
    center.x = self.view.bounds.size.width/2;
    center.y = 900;
    [self.editContactsView setCenter:center];
    [UIView commitAnimations];
}

///

//-(void)fetchAvailableProducts{
//    NSSet *productIdentifiers = [NSSet
//                                 setWithObjects:kTutorialPointProductID,nil];
//    productsRequest = [[SKProductsRequest alloc]
//                       initWithProductIdentifiers:productIdentifiers];
//    productsRequest.delegate = self;
//    [productsRequest start];
//}
//
//- (BOOL)canMakePurchases
//{
//    return [SKPaymentQueue canMakePayments];
//}
//- (void)purchaseMyProduct:(SKProduct*)product{
//    if ([self canMakePurchases]) {
//        SKPayment *payment = [SKPayment paymentWithProduct:product];
//        [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
//        [[SKPaymentQueue defaultQueue] addPayment:payment];
//    }
//    else{
//        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//                                  @"Purchases are disabled in your device" message:nil delegate:
//                                  self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//        [alertView show];
//    }
//}
//-(IBAction)purchase:(id)sender{
//    [self purchaseMyProduct:[validProducts objectAtIndex:0]];
//    //self.purchaseButton.enabled = NO;
//}
//
//#pragma mark StoreKit Delegate
//
//-(void)paymentQueue:(SKPaymentQueue *)queue
//updatedTransactions:(NSArray *)transactions {
//    for (SKPaymentTransaction *transaction in transactions) {
//        switch (transaction.transactionState) {
//            case SKPaymentTransactionStatePurchasing:
//                //self.activityIndicator.alpha = 1;
//                //[self.activityIndicator startAnimating];
//                NSLog(@"Purchasing");
//                break;
//            case SKPaymentTransactionStatePurchased:
//                if ([transaction.payment.productIdentifier
//                     isEqualToString:kTutorialPointProductID]) {
//                    NSLog(@"Purchased ");
//                    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:
//                                              @"Purchase is completed succesfully" message:nil delegate:
//                                              self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
//                    [alertView show];
//                    //self.activityIndicator.alpha = 0;
//                    //[self.activityIndicator startAnimating];
//              
////                    purchased = YES;
////                    defaults = [[NSUserDefaults alloc]init];
////                    [defaults setBool:YES forKey:@"purchasedDefaults"];
////                    [defaults synchronize];
//                }
//                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
//                break;
//            case SKPaymentTransactionStateRestored:
////                self.activityIndicator.alpha = 0;
////                [self.activityIndicator startAnimating];
//                NSLog(@"Restored ");
//                [UIView beginAnimations:nil context:NULL];
//                [UIView setAnimationDuration:0.5];
//                [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
////                [self.purchaseView setCenter:CGPointMake(160, 1000)];
////                [UIView commitAnimations];
////                [self removeButtonImages];
////                purchased = YES;
////                defaults = [[NSUserDefaults alloc]init];
////                [defaults setBool:YES forKey:@"purchasedDefaults"];
////                [defaults synchronize];
////                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
//                break;
//            case SKPaymentTransactionStateFailed:
////                self.activityIndicator.alpha = 0;
////                [self.activityIndicator startAnimating];
//                NSLog(@"Purchase failed ");
//                break;
//            default:
//                break;
//        }
//    }
//}
//
//-(void)productsRequest:(SKProductsRequest *)request
//    didReceiveResponse:(SKProductsResponse *)response
//{
//    SKProduct *validProduct = nil;
//    int count = [response.products count];
//    if (count>0) {
//        validProducts = response.products;
//        validProduct = [response.products objectAtIndex:0];
//        if ([validProduct.productIdentifier
//             isEqualToString:kTutorialPointProductID]) {
//            //[self.productTitleLabel setText:[NSString stringWithFormat:
////                                             @"Product Title: %@",validProduct.localizedTitle]];
////            self.productPriceLabel.text = [NSString stringWithFormat:@"Buy now for just %@",validProduct.priceAsString];
//            [UIView commitAnimations];
//        }
//    } else {
//        UIAlertView *tmp = [[UIAlertView alloc]
//                            initWithTitle:@"Not Available"
//                            message:@"No products to purchase"
//                            delegate:self
//                            cancelButtonTitle:nil
//                            otherButtonTitles:@"Ok", nil];
//        [tmp show];
//    }
////    [self.activityIndicator stopAnimating];
////    self.purchaseButton.hidden = NO;
//}
//
/////

-(IBAction)sendEmail:(id)sender{
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc]init];
    mc.mailComposeDelegate = self;
    [mc setSubject:[NSString stringWithFormat:@"Smart Alert Feedback"]];
    [mc setToRecipients:[NSArray arrayWithObject:@"support@smartalert.me"]];
    [self presentViewController:mc animated:YES completion:NULL];
}

- (IBAction)tapEditInPopover:(id)sender {
    [self showAddressBook];
}

- (IBAction)tapReturnInPopover:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    CGPoint center = [self.editContactsView center];
    center.x = self.view.bounds.size.width/2;
    center.y = 900;
    [self.editContactsView setCenter:center];
    [UIView commitAnimations];
}

- (IBAction)tapSmallDonationButton:(id)sender {
    [[RMStore defaultStore] addPayment:@"com.zingapps.smartalert.donation1" success:^(SKPaymentTransaction *transaction) {
        NSLog(@"Product purchased");
    } failure:^(SKPaymentTransaction *transaction, NSError *error) {
        NSLog(@"Something went wrong");
    }];
}

- (IBAction)tapMediumDonationButton:(id)sender {
    [[RMStore defaultStore] addPayment:@"com.zingapps.smartalert.donation2" success:^(SKPaymentTransaction *transaction) {
        NSLog(@"Product purchased");
    } failure:^(SKPaymentTransaction *transaction, NSError *error) {
        NSLog(@"Something went wrong");
    }];
}

- (void) mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Saved");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Failed: %@", [error localizedDescription]);
            break;
        case MFMailComposeResultSent:
            NSLog(@"sent");
            break;
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma edit contact

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
    
    //    ViewController * VC = [[ViewController alloc]init];
    
    if (self.ChosenContactNumbers == nil) {
        self.ChosenContactNames = [[NSMutableArray alloc]init];
        self.ChosenContactNumbers = [[NSMutableArray alloc]init];
    }
    
    [self.ChosenContactNames removeAllObjects];
    [self.ChosenContactNumbers removeAllObjects];
    [self.ChosenContactNames addObject:contactName];
    [self.ChosenContactNumbers addObject:phoneNumber];
    
    NSLog(@"%@,%@",self.ChosenContactNames,self.ChosenContactNumbers);
    
    defaults = [[NSUserDefaults alloc]init];
    [defaults setObject:self.ChosenContactNames forKey:@"namesArray"];
    [defaults setObject:self.ChosenContactNumbers forKey:@"numbersArray"];
    [defaults synchronize];
    
    NSLog(@"Contacts Names Data is: %@",[self.ChosenContactNames objectAtIndex:0]);
    NSLog(@"Contacts Numbers Data is: %@",[self.ChosenContactNumbers objectAtIndex:0]);
    
    self.nameLabel1.text = [NSString stringWithFormat:@"%@",[self.ChosenContactNames objectAtIndex:0]];
    self.numberLabel1.text = [NSString stringWithFormat:@"%@",[self.ChosenContactNumbers objectAtIndex:0]];

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

- (IBAction)tapLargeDonationButton:(id)sender {
    [[RMStore defaultStore] addPayment:@"com.zingapps.smartalert.donation3" success:^(SKPaymentTransaction *transaction) {
        NSLog(@"Product purchased");
    } failure:^(SKPaymentTransaction *transaction, NSError *error) {
        NSLog(@"Something went wrong");
    }];
}
@end
