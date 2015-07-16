//
//  DSLTransitionFromSecondToFirst.m
//  DLTransition
//
//  Created by ssxt on 15/7/15.
//  Copyright (c) 2015年 developerzhang. All rights reserved.
//



#import "DLTransitionFromSecondToFirst.h"

static CGFloat const TRANSITION_DURATION = 0.3;

@implementation DLTransitionFromSecondToFirst
- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return TRANSITION_DURATION;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    [transitionContext.containerView insertSubview:toVC.view aboveSubview:fromVC.view];
    
    toVC.view.frame = CGRectMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2, 0, 0);;
    
    [UIView animateWithDuration:TRANSITION_DURATION animations:^{
        toVC.view.frame = transitionContext.containerView.bounds;
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
}
@end
