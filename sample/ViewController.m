//
//  ViewController.m
//  sample
//
//  Created by Yutaka Shimazaki on 2020/08/17.
//  Copyright © 2020 sample. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textContent = _textContent;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)changeLabel:(id)sender {
    self.textContent = self.textField.text;
    NSString *textContentString = self.textContent;
    if ([textContentString length] == 0) {
    textContentString = @"Hello World";
    }
    self.label.text = textContentString;
}
@end
