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
    
    ChosenContactNames = [NSMutableArray arrayWithObjects:@"Dan",@"John",@"Katy",@"David", @"Betty", nil];
    
    if([ChosenContactNames objectAtIndex:0] != nil){
        self.nameLabel1.alpha = 1;
        self.switch1.alpha = 1;
    self.nameLabel1.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:0]];
    }else{
        self.nameLabel1.alpha = 0;
        self.switch1.alpha = 0;
    }
    
    if([ChosenContactNames objectAtIndex:1] != nil){
        self.nameLabel2.alpha = 1;
        self.switch2.alpha = 1;
        self.nameLabel2.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:1]];
    }else{
        self.nameLabel2.alpha = 0;
        self.switch2.alpha = 0;
    }
    
    if([ChosenContactNames objectAtIndex:2] != nil){
        self.nameLabel3.alpha = 1;
        self.switch3.alpha = 1;
        self.nameLabel3.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:2]];
    }else{
        self.nameLabel3.alpha = 0;
        self.switch3.alpha = 0;
    }
    
    if([ChosenContactNames objectAtIndex:3] != nil){
        self.nameLabel4.alpha = 1;
        self.switch4.alpha = 1;
        self.nameLabel4.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:3]];
    }else{
        self.nameLabel4.alpha = 0;
        self.switch4.alpha = 0;
    }
    
    if([ChosenContactNames objectAtIndex:4] != nil){
        self.nameLabel5.alpha = 1;
        self.switch5.alpha = 1;
        self.nameLabel5.text = [NSString stringWithFormat:@"%@",[ChosenContactNames objectAtIndex:4]];
    }else{
        self.nameLabel5.alpha = 0;
        self.switch5.alpha = 0;
    }
    
    
    
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
}
- (IBAction)tapShareButton{
if ([SLComposeViewController isAvailableForServiceType:SLServiceTypeTwitter]) {
    //2
    SLComposeViewController *tweetSheet = [SLComposeViewController composeViewControllerForServiceType:SLServiceTypeTwitter];
    //3
        [tweetSheet setInitialText:@"Check Out Smart Alert"];
    //[tweetSheet addImage:image];
    //4
    [self presentViewController:tweetSheet animated:YES completion:nil];
}
else {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Please log in" message:@"Please log in to Twitter in the Settings app" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
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

@end
