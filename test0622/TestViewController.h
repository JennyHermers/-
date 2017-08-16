//
//  TestViewController.h
//  test0622
//
//  Created by xujinjie on 2017/8/7.
//  Copyright © 2017年 tele-hot. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ClipPhotoDelegate <NSObject>

- (void)clipPhoto:(UIImage *)image;

@end

@interface TestViewController : UIViewController

@property (strong, nonatomic) UIImage *image;

@property (nonatomic, strong) UIImagePickerController *picker;

@property (nonatomic, strong) UIViewController *controller;

@property (nonatomic, weak) id<ClipPhotoDelegate> delegate;


@end
