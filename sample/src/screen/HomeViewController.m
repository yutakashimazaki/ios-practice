//
//  HomeViewController.m
//  sample
//
//  Created by Yutaka Shimazaki on 2020/09/04.
//  Copyright © 2020 sample. All rights reserved.
//

#import "HomeViewController.h"
#import "LabelDefine.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet UILabel *mainLabel;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mainLabel.text = LABEL_HOME_TITLE;
}

@end
