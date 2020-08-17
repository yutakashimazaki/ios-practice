//
//  ViewController.h
//  sample
//
//  Created by Yutaka Shimazaki on 2020/08/17.
//  Copyright © 2020 sample. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *label;

@property (copy, nonatomic) NSString *textContent;
- (IBAction)changeLabel:(id)sender;

@end

