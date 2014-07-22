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
    BOOL countdownRunning;

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
    else{
        self.timerLabel.text = [NSString stringWithFormat:@"Alert Sent"];
        [self sendAlert];
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
       // Present Alert View
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
    
}

@end
