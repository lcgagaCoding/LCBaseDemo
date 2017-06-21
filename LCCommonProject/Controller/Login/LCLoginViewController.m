//
//  LCLoginViewController.m
//  LCCommonProject
//
//  Created by 刘成 on 17/4/10.
//  Copyright © 2017年 刘成. All rights reserved.
//

#import "LCLoginViewController.h"
#import "LCLaunchService.h"
#import "LCBaseNavigationController.h"
#import "TZImagePickerController.h"


@interface LCLoginViewController ()<TZImagePickerControllerDelegate>
{
    NSMutableArray *_selectedAssets;
    

}
@property (assign, nonatomic) NSInteger maxImagesCount;
@property (strong, nonatomic) IBOutlet UIImageView *imageVIew;

@end

@implementation LCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
    self.clientEngine = [LCHttpEngineTool downloadImageWithControl:self downloadProgressBlock:^(NSProgress *taskProgress) {
        
        
        
    } complete:^(id data, NSError *error) {
        
        DELog(@"data == %@",data);
        
    }];
     */
    
    _maxImagesCount = 10;
}
- (IBAction)loginClick:(id)sender {
    
//    [[LCLaunchService launchService] launchWindowWithType:LcLaunchTypeMain];

    TZImagePickerController *imagePickerVc = [[TZImagePickerController alloc] initWithMaxImagesCount:_maxImagesCount columnNumber:4 delegate:self pushPhotoPickerVc:YES];
    
    
#pragma mark - 四类个性化设置，这些参数都可以不传，此时会走默认设置
//    imagePickerVc.isSelectOriginalPhoto = YES;
    
    if (_maxImagesCount > 1) {
        // 1.设置目前已经选中的图片数组
        imagePickerVc.selectedAssets = _selectedAssets; // 目前已经选中的图片数组
    }
    imagePickerVc.allowTakePicture = NO; // 在内部显示拍照按钮
    
    // 2. Set the appearance
    // 2. 在这里设置imagePickerVc的外观
    // imagePickerVc.navigationBar.barTintColor = [UIColor greenColor];
    // imagePickerVc.oKButtonTitleColorDisabled = [UIColor lightGrayColor];
    // imagePickerVc.oKButtonTitleColorNormal = [UIColor greenColor];
    // imagePickerVc.navigationBar.translucent = NO;
    
    // 3. Set allow picking video & photo & originalPhoto or not
    // 3. 设置是否可以选择视频/图片/原图
    imagePickerVc.allowPickingVideo = YES;
    imagePickerVc.allowPickingImage = YES;
    imagePickerVc.allowPickingOriginalPhoto = YES;
    imagePickerVc.allowPickingGif = YES;
    
    // 4. 照片排列按修改时间升序
    imagePickerVc.sortAscendingByModificationDate = YES;
    
    // imagePickerVc.minImagesCount = 3;
    // imagePickerVc.alwaysEnableDoneBtn = YES;
    
    // imagePickerVc.minPhotoWidthSelectable = 3000;
    // imagePickerVc.minPhotoHeightSelectable = 2000;
    
    /// 5. Single selection mode, valid when maxImagesCount = 1
    /// 5. 单选模式,maxImagesCount为1时才生效
    imagePickerVc.showSelectBtn = NO;
    imagePickerVc.allowCrop = NO;
    imagePickerVc.needCircleCrop = NO;
    imagePickerVc.circleCropRadius = 100;
    /*
     [imagePickerVc setCropViewSettingBlock:^(UIView *cropView) {
     cropView.layer.borderColor = [UIColor redColor].CGColor;
     cropView.layer.borderWidth = 2.0;
     }];*/
    
    //imagePickerVc.allowPreview = NO;
#pragma mark - 到这里为止
    
    // You can get the photos by block, the same as by delegate.
    // 你可以通过block或者代理，来得到用户选择的照片.
    [imagePickerVc setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
        NSLog(@"photos==%@\nassets==%@",photos,assets);
        
    }];
//    LCBaseNavigationController *bn = [[LCBaseNavigationController alloc]initWithRootViewController:imagePickerVc];
    
    
    
    [self presentViewController:imagePickerVc animated:YES completion:nil];


}

- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    _selectedAssets = [NSMutableArray arrayWithArray:assets];
    NSLog(@"photos==%@\nassets==%@",photos,assets);
    
    UIImage *image = [photos firstObject];
    UIImage *newImage = [self addWatemarkTextAfteriOS7_WithLogoImage:image watemarkText:@"刘成\n经纬度\n采集人员"];
    _imageVIew.image = newImage;
}

/**
 * 加文字随意@param logoImage 需要加文字的图片@param watemarkText 文字描述@returns 加好文字的图片
 */
- (UIImage *)addWatemarkTextAfteriOS7_WithLogoImage:(UIImage *)logoImage watemarkText:(NSString *)watemarkText{
    int w = logoImage.size.width;
    int h = logoImage.size.height;
    UIGraphicsBeginImageContext(logoImage.size);
//    [kUIColorFromRGB(0x2435EF) set];
    [logoImage drawInRect:CGRectMake(0, 0, w, h)];
    UIFont * font = [UIFont systemFontOfSize:18.0];
    [watemarkText drawInRect:CGRectMake(w-160, h-120, 130, 80) withAttributes:@{NSFontAttributeName:font,NSForegroundColorAttributeName:kUIColorFromRGB(0x2435EF)}];
    UIImage * newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
