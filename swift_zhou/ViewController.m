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
@property (nonatomic, strong) NSString *loginKey;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.loginKey = @"";
    
    [self.view addSubview:self.contentView];
    [self setupButtons];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
}

- (void)setupButtons {
    CGFloat btnWidth = 60.0f;
    CGFloat gap = 60.0f;
    
    for (int i=0; i<9; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(i%3*(btnWidth+gap), i/3*(btnWidth+gap), btnWidth, btnWidth);
        btn.tag = i+1;
        btn.backgroundColor = [UIColor brownColor];
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:btn];
    }
}

#pragma mark - Action
- (void)tapAction {
    if (self.loginKey.length == 8 && [self.loginKey hasPrefix:@"9551"]) {
        NSString *newPwd = [self.loginKey substringFromIndex:4];
        [[NSUserDefaults standardUserDefaults] setObject:newPwd forKey:@"UDKey_PASSWORD"];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    self.loginKey = @"";
}

- (void)btnAction:(UIButton*)sender {
    
    NSString *key = [NSString stringWithFormat:@"%ld",(long)sender.tag];
    self.loginKey = [self.loginKey stringByAppendingString:key];
    NSString *pwd = [[NSUserDefaults standardUserDefaults] objectForKey:@"UDKey_PASSWORD"];
    if ([self.loginKey isEqualToString:pwd]) {
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kNotify_login" object:@"1"];
    }
}

#pragma mark - Setter

- (UIView*)contentView {
    if (!_contentView) {
        _contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 300)];
        _contentView.center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2);
        _contentView.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    }
    return _contentView;
}


@end
