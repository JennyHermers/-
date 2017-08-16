//
//  ViewController.m
//  test0622  相册自定义比例截图
//
//  Created by xujinjie on 2017/6/22.
//  Copyright © 2017年 tele-hot. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"


@interface ViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,ClipPhotoDelegate>


@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic, strong) UIImagePickerController *imgPicker;



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 40)];
    btn.backgroundColor = [UIColor greenColor];
    [btn setTitle:@"自定义截图" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 170, 375, 131)];
    [self.view addSubview:self.imageView];
    
}

- (void)share
{
    
    UIActionSheet *sheet = [[UIActionSheet alloc]
                            initWithTitle:nil
                            delegate:self
                            cancelButtonTitle:@"取消"
                            destructiveButtonTitle:nil
                            otherButtonTitles:@"相机",@"相册",nil];
    [sheet showInView:self.view];


    
}


#pragma mark - actionsheet delegate
-(void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    switch (buttonIndex){
        case 0:
            //打开照相机拍照
            [self takePhoto];
            break;
        case 1:
            //打开本地相册
            [self LocalPhoto];
            break;
    }
    
}

/**
 开始拍照
 */
-(void)takePhoto{
    
    
    UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
    if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = sourceType;
        [self presentViewController:picker animated:YES completion:nil];
    }else{
        NSLog(@"模拟器中无法打开照相机,请在真机中使用");
    }
}

#pragma mark 打开本地相册
-(void)LocalPhoto{
    
    _imgPicker = [[UIImagePickerController alloc] init];
    _imgPicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    _imgPicker.delegate = self;
    _imgPicker.allowsEditing = NO;
    [self presentViewController:_imgPicker animated:YES completion:nil];

}



// 选择照片之后
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    UIImage * image = [info objectForKey:UIImagePickerControllerOriginalImage];

    [self cropImage:image];
   
}

- (void)cropImage: (UIImage *)image {
    
    TestViewController *viewController = [[TestViewController alloc] init];
    viewController.image = image;
    viewController.picker = _imgPicker;
    viewController.controller = self;
    viewController.delegate = self;
    [_imgPicker presentViewController:viewController animated:NO completion:nil];
    
}

- (void)clipPhoto:(UIImage *)image{
    self.imageView.image = image;

}


@end
