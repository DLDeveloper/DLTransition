//
//  SecondViewController.m
//  DLTransition
//
//  Created by ssxt on 15/7/15.
//  Copyright (c) 2015年 developerzhang. All rights reserved.
//

#import "SecondViewController.h"
#import "DLTransitionFromSecondToFirst.h"
#import "ViewController.h"

@interface SecondViewController ()<UINavigationControllerDelegate>

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationController.delegate = self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (self.navigationController.delegate == self) {
        self.navigationController.delegate = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (fromVC == self && [toVC isKindOfClass:[ViewController class]]) {
        return [[DLTransitionFromSecondToFirst alloc] init];
    }else{
        return nil;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
