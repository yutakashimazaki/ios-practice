//
//  StartingViewController.h
//  sample
//
//  Created by Yutaka Shimazaki on 2020/09/03.
//  Copyright © 2020 sample. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@class StartingViewController;

@protocol StartingViewControllerDelegate <NSObject>

- (void)didFinishLaunchApplication:(StartingViewController *) startingViewController;

@end

@interface StartingViewController : BaseViewController

@property (nonatomic,weak) id<StartingViewControllerDelegate> delegate;

- (void)startApplication;

@end
