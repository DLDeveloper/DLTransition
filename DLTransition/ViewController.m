//
//  ViewController.m
//  DLTransition
//
//  Created by ssxt on 15/7/15.
//  Copyright (c) 2015年 developerzhang. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "DLTransitionFromFirstToSecond.h"

@interface ViewController ()<UINavigationControllerDelegate>

- (IBAction)btnClick:(id)sender;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.delegate = self;
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    
    if (fromVC == self && [toVC isKindOfClass:[SecondViewController class]]) {
        return [[DLTransitionFromFirstToSecond alloc] init];
    }else{
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClick:(id)sender {
    SecondViewController *secondVC = [[SecondViewController alloc] init];
    
    [self.navigationController pushViewController:secondVC animated:YES];
}
@end
