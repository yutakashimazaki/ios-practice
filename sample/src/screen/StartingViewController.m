//
//  StartingViewController.m
//  sample
//
//  Created by Yutaka Shimazaki on 2020/09/03.
//  Copyright © 2020 sample. All rights reserved.
//

#import "StartingViewController.h"

@interface StartingViewController ()

@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation StartingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)startApplication {
    [NSThread sleepForTimeInterval:1.0];
    [self.delegate didFinishLaunchApplication:self];
}

@end
