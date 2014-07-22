//
//  APPChildViewController.m
//  PageApp
//
//  Created by Rafael Garcia Leiva on 10/06/13.
//  Copyright (c) 2013 Appcoda. All rights reserved.
//

#import "APPChildViewController.h"

@interface APPChildViewController ()

@end

@implementation APPChildViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Custom initialization
    }
    
    return self;
    
}

- (void)viewDidLoad {
    
    self.introTextArray = [NSArray arrayWithObjects:@"Welcome to Smart Alert",@"First, Please choose a contact from your address book",@"Third",@"Fourth",@"Fifth",nil];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSString *imageName = [NSString stringWithFormat:@"image%i",self.index+1];
    
    self.screenNumber.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    [self.backgroundImage  setImage:[UIImage imageNamed:imageName]];
    self.textView.text = self.introTextArray[self.index];
    
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
