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
    
    SevenSwitch *mySwitch = [[SevenSwitch alloc] initWithFrame:CGRectMake(10, 10, 320, 60)];
    mySwitch.center = CGPointMake(160, 479);
    [mySwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    mySwitch.offImage = [UIImage imageNamed:@"swipeToPrime002.png"];
    mySwitch.onImage = [UIImage imageNamed:@"primed002.png"];
    mySwitch.onTintColor = [UIColor colorWithHue:3.50f saturation:0.89f brightness:0.79f alpha:1.00f];
    mySwitch.isRounded = NO;
    [self.view addSubview:mySwitch];
    
    // turn the switch on with animation
    [mySwitch setOn:NO animated:YES];
    
}


- (void)switchChanged:(SevenSwitch *)sender {
    NSLog(@"Changed value to: %@", sender.on ? @"ON" : @"OFF");
    defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"alertSet"]) {
         [defaults setBool:NO forKey:@"alertSet"];
    }else{
        [defaults setBool:YES forKey:@"alertSet"];
    }
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setAlert{
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:YES forKey:@"alertSet"];
    [defaults synchronize];
}

- (IBAction) tapSetAlertButton{
    [self setAlert];
}

@end
