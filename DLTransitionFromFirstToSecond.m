//
//  DLTransitionFromFirstToSecond.m
//  DLTransition
//
//  Created by ssxt on 15/7/15.
//  Copyright (c) 2015年 developerzhang. All rights reserved.
//

#import "DLTransitionFromFirstToSecond.h"
#import "ViewController.h"
#import "SecondViewController.h"




static CGFloat const TRANSITION_DURATION = 0.3;

@implementation DLTransitionFromFirstToSecond
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return TRANSITION_DURATION;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    
    UIViewController * fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [transitionContext.containerView insertSubview:toViewController.view aboveSubview:fromViewController.view];
            toViewController.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2, 0, 0);
    
    [UIView animateWithDuration:TRANSITION_DURATION animations:^{
        toViewController.view.frame = transitionContext.containerView.bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];

    
}
@end
