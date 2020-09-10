//
//  ViewController.m
//  sample
//
//  Created by Yutaka Shimazaki on 2020/08/17.
//  Copyright © 2020 sample. All rights reserved.
//

#import "RootViewController.h"
#import "StartingViewController.h"
#import "HomeViewController.h"

@interface RootViewController ()<StartingViewControllerDelegate>

@property (nonatomic, strong) NSMutableDictionary *currentViewControllersAtContainerView;

@end

@implementation RootViewController

+ (instancetype)sharedInstance
{
    static RootViewController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[RootViewController alloc] init];
    });
    return sharedInstance;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    StartingViewController *startingViewController = [[StartingViewController alloc] init];
    startingViewController.delegate = self;
    [self transitionFromViewController:nil toViewController:startingViewController containerView:self.view shouldAutomaticallyForwardAppearanceMethods:NO duration:0 options:0 completion:^(BOOL finished) {
        [startingViewController startApplication];
    }];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIViewController *currentViewController in _currentViewControllersAtContainerView.allValues) {
        [currentViewController beginAppearanceTransition:YES animated:animated];
    }
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    for (UIViewController *currentViewController in _currentViewControllersAtContainerView.allValues) {
        [currentViewController endAppearanceTransition];
    }
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    for (UIViewController *currentViewController in _currentViewControllersAtContainerView.allValues) {
        [currentViewController beginAppearanceTransition:NO animated:animated];
    }
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    for (UIViewController *currentViewController in _currentViewControllersAtContainerView.allValues) {
        [currentViewController endAppearanceTransition];
    }
}

- (void)didFinishLaunchApplication:(StartingViewController *) startingViewController
{
    NSLog(@"起動完了");
    [self transitionFromViewController:startingViewController toViewController:[[HomeViewController alloc] init] containerView:self.view shouldAutomaticallyForwardAppearanceMethods:YES duration:0 options:0 completion:nil];
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
    return NO;
}

- (void)transitionFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController containerView:(UIView *)containerView shouldAutomaticallyForwardAppearanceMethods:(BOOL)shouldAutomaticallyAppearance duration:(NSTimeInterval)duration options:(UIViewAnimationOptions)options completion:(void (^)(BOOL))completion
{
    if(toViewController) {
        [self addChildViewController:toViewController];
    }
    if(!containerView) {
        containerView = self.view;
    }
    toViewController.view.frame = containerView.bounds;
    
    [toViewController.view layoutIfNeeded];
    [fromViewController willMoveToParentViewController:nil];
    
    NSString *key = [self hashStringForkey:containerView];
    [_currentViewControllersAtContainerView removeObjectForKey:key];
    _currentViewControllersAtContainerView[key] = toViewController;
    
    __block __weak typeof(self) blockSelf = self;
    if([fromViewController.parentViewController isEqual:self]) {
        if(shouldAutomaticallyAppearance) {
            [fromViewController beginAppearanceTransition:NO animated:NO];
            [toViewController beginAppearanceTransition:YES animated:NO];
        }
        [UIView transitionFromView:fromViewController.view toView:toViewController.view duration:duration options:options completion:^(BOOL finished) {
            
            if(shouldAutomaticallyAppearance) {
                [fromViewController endAppearanceTransition];
                [toViewController endAppearanceTransition];
            }
            [toViewController didMoveToParentViewController:blockSelf];
            [fromViewController removeFromParentViewController];
        }];
    } else {
        if(shouldAutomaticallyAppearance) {
            [toViewController beginAppearanceTransition:YES animated:NO];
        }
        [UIView transitionWithView:self.view duration:duration options:options animations:^{
            [containerView addSubview:toViewController.view];
        } completion:^(BOOL finished) {
            if(shouldAutomaticallyAppearance) {
                [toViewController endAppearanceTransition];
            }
            [toViewController didMoveToParentViewController:blockSelf];
            if(completion) {
                completion(finished);
            }
        }];
    }
}

#pragma mark - private methods
-(NSString *)hashStringForkey:(UIView *)view
{
    return [NSString stringWithFormat:@"%tu", view.hash];
}

@end
