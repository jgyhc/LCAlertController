//
//  LCViewController.m
//  LCAlertController
//
//  Created by jgyhc on 05/07/2019.
//  Copyright (c) 2019 jgyhc. All rights reserved.
//

#import "LCViewController.h"
#import "LCAlertController.h"

@interface LCViewController ()

@end

@implementation LCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showEvent:(id)sender {
    LCAlertController *viewController = [[LCAlertController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

@end
