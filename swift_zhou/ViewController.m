//
//  ViewController.m
//  swift_zhou
//
//  Created by taiji_zq on 2019/5/9.
//  Copyright © 2019 taiji_zq. All rights reserved.
//

#import "ViewController.h"
#import "swift_zhou-Swift.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [btn setTitle:@"Click" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    btn.center = CGPointMake(100, 100);
    [self.view addSubview:btn];
}

- (void)btnAction {
    HomeViewController *vc = [[HomeViewController alloc] init];
    [self presentViewController:vc animated:YES completion:nil];
}


@end
