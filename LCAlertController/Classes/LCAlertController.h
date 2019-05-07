//
//  LCAlertController.h
//  LCAlertController_Example
//
//  Created by 刘聪 on 2019/5/7.
//  Copyright © 2019 jgyhc. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LCAlertController : UIViewController
@property (nonatomic, strong) UIView *containerView;


- (void)hide;


/** 子类重写 */
- (BOOL)isModal;
- (CGFloat)containerCircular;
- (CGFloat)horizontalEdge;
@end

NS_ASSUME_NONNULL_END
