//
//  LCAlertController.m
//  LCAlertController_Example
//
//  Created by 刘聪 on 2019/5/7.
//  Copyright © 2019 jgyhc. All rights reserved.
//

#import "LCAlertController.h"
#import "Masonry.h"

@interface LCAlertController ()
@property (nonatomic, strong) UIControl *backgroundView;
@end

@implementation LCAlertController



- (instancetype)init {
    self = [super init];
    if (self) {
        self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        self.modalPresentationStyle = UIModalPresentationOverFullScreen;
    }
    return self;
}

- (UIModalPresentationStyle)modalPresentationStyle {
    return UIModalPresentationOverCurrentContext;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.4];

    if (![self isModal]) {
        [self.view addSubview:self.backgroundView];
        [self.backgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(UIEdgeInsetsZero);
        }];
    }
    [self.view addSubview:self.containerView];
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view);
        make.left.mas_equalTo([self horizontalEdge]);
        make.right.mas_equalTo(-[self horizontalEdge]);
    }];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self show];
}

- (CGFloat)horizontalEdge {
    return 30;
}

- (BOOL)isModal {
    return NO;
}

- (CGFloat)containerCircular {
    return 5.0;
}

- (void)show {
    self.containerView.alpha = 0;
    self.containerView.transform = CGAffineTransformScale(self.containerView.transform, 0.5, 0.5);
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.6 initialSpringVelocity:1 options:UIViewAnimationOptionTransitionNone animations:^{
        self.containerView.transform = CGAffineTransformScale(self.containerView.transform, 1/0.5, 1/0.5);
        self.containerView.alpha = 1;
    } completion:^(BOOL finished) {
    }];
}

- (void)hide {
    [UIView animateWithDuration:0.3 animations:^{
        self.containerView.transform = CGAffineTransformScale(self.containerView.transform, 0.5, 0.5);
        self.containerView.alpha = 0;
    } completion:^(BOOL finished) {
        self.containerView.transform = CGAffineTransformScale(self.containerView.transform, 1/0.5, 1/0.5);
        [self dismissViewControllerAnimated:YES completion:nil];
    }];
}

- (UIView *)containerView {
    if (!_containerView) {
        _containerView = [[UIView alloc] init];
        [_containerView setBackgroundColor:[UIColor whiteColor]];
        _containerView.layer.cornerRadius = [self containerCircular];
    }
    return _containerView;
}

- (UIControl *)backgroundView {
    if (!_backgroundView) {
        _backgroundView = [[UIControl alloc] init];
        [_backgroundView addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backgroundView;
}

@end
