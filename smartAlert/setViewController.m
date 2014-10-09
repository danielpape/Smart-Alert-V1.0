//
//  setViewController.m
//  smartAlert
//
//  Created by Daniel Pape on 25/06/2014.
//  Copyright (c) 2014 Daniel Pape. All rights reserved.
//

#import "setViewController.h"

@interface setViewController ()

@end

@implementation setViewController

    int hours, minutes,seconds;
    int secondsLeft;
    NSTimer *timer;
    NSTimer *limiter;
    BOOL countdownRunning;
    BOOL sent;

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
    [self countdownTimer];
    countdownRunning = YES;
    ChosenContactNames = [NSMutableArray arrayWithObjects:@"Dan",@"John",@"Katy",@"David", @"Betty", nil];
    sent = NO;
    [super viewDidLoad];
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

- (IBAction)tapResetButton{
    [self resetAlert];
}

- (void)resetAlert{
    defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:NO forKey:@"alertSet"];
    [defaults synchronize];
}

- (void)updateCounter:(NSTimer *)theTimer {
    float animationDuration = 0.3;
    
    if(secondsLeft > 0 ){
        secondsLeft--;
        self.timerLabel.text = [NSString stringWithFormat:@"Alert is sent in %d seconds", secondsLeft];
        
        if (secondsLeft == 10) {
            self.CDView10.alpha = 1;
            self.CDView9.alpha = 1;
            self.CDView8.alpha = 1;
            self.CDView7.alpha = 1;
            self.CDView6.alpha = 1;
            self.CDView5.alpha = 1;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            
        }else if(secondsLeft == 9){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 1;
            self.CDView8.alpha = 1;
            self.CDView7.alpha = 1;
            self.CDView6.alpha = 1;
            self.CDView5.alpha = 1;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 8){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 1;
            self.CDView7.alpha = 1;
            self.CDView6.alpha = 1;
            self.CDView5.alpha = 1;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 7){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 1;
            self.CDView6.alpha = 1;
            self.CDView5.alpha = 1;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 6){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 1;
            self.CDView5.alpha = 1;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 5){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 0;
            self.CDView5.alpha = 1;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 4){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 0;
            self.CDView5.alpha = 0;
            self.CDView4.alpha = 1;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 3){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 0;
            self.CDView5.alpha = 0;
            self.CDView4.alpha = 0;
            self.CDView3.alpha = 1;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 2){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 0;
            self.CDView5.alpha = 0;
            self.CDView4.alpha = 0;
            self.CDView3.alpha = 0;
            self.CDView2.alpha = 1;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 1){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 0;
            self.CDView5.alpha = 0;
            self.CDView4.alpha = 0;
            self.CDView3.alpha = 0;
            self.CDView2.alpha = 0;
            self.CDView1.alpha = 1;
            [UIView commitAnimations];
        }else if(secondsLeft == 0){
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:animationDuration];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
            self.CDView10.alpha = 0;
            self.CDView9.alpha = 0;
            self.CDView8.alpha = 0;
            self.CDView7.alpha = 0;
            self.CDView6.alpha = 0;
            self.CDView5.alpha = 0;
            self.CDView4.alpha = 0;
            self.CDView3.alpha = 0;
            self.CDView2.alpha = 0;
            self.CDView1.alpha = 0;
            [UIView commitAnimations];
        }
        
    }
    else if(secondsLeft == 0){
        self.timerLabel.text = [NSString stringWithFormat:@"Alert Sent"];
        [self.cancelButton setTitle:[NSString stringWithFormat:@"Return to Smart Alert Button"] forState:UIControlStateNormal];
        if (!sent) {
            [self sendAlert];
        }
        sent = YES;
        [timer invalidate];
        countdownRunning = NO;
    }
}

-(void)countdownTimer{
    
    secondsLeft = 10;
    self.timerLabel.text = [NSString stringWithFormat:@"Alert is sent in %d seconds", secondsLeft];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
    
}

- (IBAction) cancelAlert{
    if (countdownRunning) {
        [self cancelAlertAction];
    }else{
        UIViewController *alertContr = (UIViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"alertView"];
        //menu is only an example
        alertContr.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:alertContr animated:YES completion:nil];
    }
}

-(void)cancelAlertAction{
    if (secondsLeft > 0) {
        self.timerLabel.text = [NSString stringWithFormat:@"Alert Cancelled"];
        [timer invalidate];
        [self.cancelButton setTitle:@"Return to Smart Alert Button" forState:UIControlStateNormal];
        countdownRunning = NO;
    }
}

-(void)sendAlert{
    defaults = [[NSUserDefaults alloc]init];
        
    _contactNumbers = [defaults objectForKey:@"numbersArray"];
    
    NSString *myName = [defaults objectForKey:@"myName"];
    NSString *myNumber = [defaults objectForKey:@"myNumber"];
    NSString *fromString;
    
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
}

@end
