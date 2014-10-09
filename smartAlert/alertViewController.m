//
//  alertViewController.m
//  smartAlert
//
//  Created by Daniel Pape on 21/05/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "alertViewController.h"

@interface alertViewController ()

@end

@implementation alertViewController

#define   IS_IPHONE_5     ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

NSString *fromString;

@synthesize ibSwitch;

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
    defaults = [[NSUserDefaults alloc]init];
    [super viewDidLoad];
    
    [defaults setBool:YES forKey:@"returnVisit"];
    
    SevenSwitch *mySwitch = [[SevenSwitch alloc] initWithFrame:CGRectMake(10, 10, 320, 60)];
    if (!IS_IPHONE_5) {
         mySwitch.center = CGPointMake(160, 391);
    }else{
        mySwitch.center = CGPointMake(160, 479);
    }
    [mySwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    mySwitch.offImage = [UIImage imageNamed:@"swipeToPrime005.png"];
    mySwitch.onImage = [UIImage imageNamed:@"primed002.png"];
    mySwitch.onTintColor = [UIColor colorWithHue:3.50f saturation:0.89f brightness:0.79f alpha:1.00f];
    mySwitch.isRounded = NO;
    [self.view addSubview:mySwitch];
    [self.view sendSubviewToBack:mySwitch];
    
    // turn the switch on with animation
    if ([defaults boolForKey:@"alertSet"]){
        [mySwitch setOn:YES animated:NO];
    }
    
    //UIViewController *controller = [self.storyboard instantiateViewControllerWithIdentifier: @"intro"];
    
   // [self presentPopupViewController:controller animationType:nil];
    
    defaults = [[NSUserDefaults alloc]init];
    _contactNames = [defaults objectForKey:@"namesArray"];
    NSLog(@"contact name is : %@",[_contactNames objectAtIndex:0]);
    
    _contactNumbers = [defaults objectForKey:@"numbersArray"];
    NSLog(@"contact name is : %@",[_contactNumbers objectAtIndex:0]);
    
    [defaults synchronize];
    
}


- (void)switchChanged:(SevenSwitch *)sender {
    NSLog(@"Changed value to: %@", sender.on ? @"ON" : @"OFF");
    defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"alertSet"]) {
         [defaults setBool:NO forKey:@"alertSet"];
        NSLog(@"alert off");
    }else{
        [defaults setBool:YES forKey:@"alertSet"];
        NSLog(@"alert on");
    }
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapResetButton:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.alertHasBeenSentView.alpha = 0;
    self.ReturnButton.alpha = 0;
    [UIView commitAnimations];
}

-(void)setAlert{
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"alertSet"];
    [defaults synchronize];
}

- (IBAction) tapSetAlertButton{
    [self setAlert];
    
    defaults = [[NSUserDefaults alloc]init];
    
    _contactNumbers = [defaults objectForKey:@"numbersArray"];
    
    NSString *myName = [defaults objectForKey:@"myName"];
    NSString *myNumber = [defaults objectForKey:@"myNumber"];
    
    NSLog(@"my number is %@",myNumber);
    
    if ([[_contactNumbers objectAtIndex:0] hasPrefix:@"1"]){
        fromString = [NSString stringWithFormat:@"12084375123"];
    }else{
        fromString = [NSString stringWithFormat:@"SmartAlert"];
    }
    
    NSString *URL = [NSString stringWithFormat:@"http://rest.nexmo.com/sms/xml?api_key=3c87ded3&api_secret=75ff100e&from=%@&to=%@&text=From+%@,+please+contact+me+as+soon+as+possible+on+%@.+I+may+currently+be+in+an+emergency+situation+and+need+your+help.+Sent+via+Smart+Alert.", fromString,[_contactNumbers objectAtIndex:0],myName,myNumber];
    NSLog(@"ALERT SENT, TO URL %@", URL);
    
//    UIWebView *wv = [[UIWebView alloc] init];
    NSURL *textURL = [NSURL URLWithString:URL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:textURL];
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
    [connection start];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.4];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    self.alertHasBeenSentView.alpha = 1;
    self.ReturnButton.alpha = 1;
    [UIView commitAnimations];
}

@end
