//
//  TestViewController.m
//  test0622
//
//  Created by xujinjie on 2017/8/7.
//  Copyright © 2017年 tele-hot. All rights reserved.
//

#import "TestViewController.h"
#import "MLImageCrop.h"

@interface TestViewController ()<MLImageCropDelegate>

@property (nonatomic,strong) UIImage *testImage;


@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setPhoto];
    
}

- (void)setPhoto{
    
    MLImageCrop *imageCrop = [[MLImageCrop alloc]init];
    imageCrop.delegate = self;
    imageCrop.ratioOfWidthAndHeight = 375.0/131.0f;
    imageCrop.image = self.image;
    [imageCrop showWithAnimation:YES];
    
}



- (void)cropImage:(UIImage *)cropImage forOriginalImage:(UIImage *)originalImage{
    self.testImage = cropImage;
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(clipPhoto:)]) {
    
        [self.delegate clipPhoto:cropImage];
    }
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.picker dismissViewControllerAnimated:YES completion:nil];
    [self.controller dismissViewControllerAnimated:YES completion:nil];
   

}
@end
