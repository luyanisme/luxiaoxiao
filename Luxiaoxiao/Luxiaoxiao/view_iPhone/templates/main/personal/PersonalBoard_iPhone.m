//
//	 ______    ______    ______    
//	/\  __ \  /\  ___\  /\  ___\   
//	\ \  __<  \ \  __\_ \ \  __\_ 
//	 \ \_____\ \ \_____\ \ \_____\ 
//	  \/_____/  \/_____/  \/_____/ 
//
//	Powered by BeeFramework
//
//
//  PersonalBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/31/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "PersonalBoard_iPhone.h"
#import "PersonalBoardCell_iPhone.h"
#import "VPImageCropperViewController.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import "PlayTools.h"
#import "Public.h"

#pragma mark -

@interface PersonalBoard_iPhone()<VPImageCropperDelegate,UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    UIImage *_avater;
}
@end

@implementation PersonalBoard_iPhone

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
    
    self.navigationBarShown = YES;
    self.navigationBarTitle = @"账号";
    self.navigationBarLeft = [UIImage imageNamed:@"navigation-back.png"];
    
    @weakify(self);
    self.list.lineCount = 1;
    self.list.animationDuration = 0.25;
    
    self.list.whenReloading = ^{
    
        @normalize(self);
        self.list.total = 1;
        
        BeeUIScrollItem *item = self.list.items[0];
        item.clazz = [PersonalBoardCell_iPhone class];
        item.size = self.list.size;
        item.data = _avater;
    
    };
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
}

ON_WILL_APPEAR( signal )
{
    bee.ui.playTools.hidden = YES;
}

ON_DID_APPEAR( signal )
{
}

ON_WILL_DISAPPEAR( signal )
{
}

ON_DID_DISAPPEAR( signal )
{
}

ON_SIGNAL3( BeeUINavigationBar, LEFT_TOUCHED, signal )
{
    [self.stack popBoardAnimated:YES];
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

//更换头像
ON_SIGNAL3(PersonalBoardCell_iPhone, photoClick, signal){
    NSLog(@"更换头像");
    UIActionSheet *choiceSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"取消"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"拍照", @"从相册中选取", nil];
    [choiceSheet showInView:self.view];
}

//账号修改
ON_SIGNAL3(PersonalBoardCell_iPhone, accountClick, signal){
    NSLog(@"账号修改");
}

//昵称修改
ON_SIGNAL3(PersonalBoardCell_iPhone, nameClick, signal){
    NSLog(@"昵称修改");
}

//更换密码
ON_SIGNAL3(PersonalBoardCell_iPhone, passwordClick, signal){
    NSLog(@"更换密码");
}

//绑定设备
ON_SIGNAL3(PersonalBoardCell_iPhone, bindingClick, signal){
    NSLog(@"绑定设备");
}

//用户退出
ON_SIGNAL3(PersonalBoardCell_iPhone, quit, signal){
    NSLog(@"用户退出");
}

#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSString *mediaType = AVMediaTypeVideo;
        AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:mediaType];
        if(authStatus == ALAuthorizationStatusRestricted || authStatus == ALAuthorizationStatusDenied){
            [[[UIAlertView alloc] initWithTitle:@"无法使用相机"
                                        message:@"请在iPhone的\"设置-隐私-相机\"选项中，允许路小小访问你的手机相机。"
                                       delegate:nil
                              cancelButtonTitle:@"确定"
                              otherButtonTitles:nil]show];
        }
        else
        {
            // 拍照
            if ([Public isCameraAvailable] && [Public doesCameraSupportTakingPhotos]) {
                UIImagePickerController *controller = [[UIImagePickerController alloc] init];
                controller.sourceType = UIImagePickerControllerSourceTypeCamera;
                if ([Public isFrontCameraAvailable]) {
                    controller.cameraDevice = UIImagePickerControllerCameraDeviceFront;
                }
                NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
                [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
                controller.mediaTypes = mediaTypes;
                controller.delegate = self;
                [self presentViewController:controller
                                   animated:YES
                                 completion:^(void){
                                     NSLog(@"Picker View Controller is presented");
                                 }];
            }
        }
    } else if (buttonIndex == 1) {
        // 从相册中选取
        if ([Public isPhotoLibraryAvailable]) {
            UIImagePickerController *controller = [[UIImagePickerController alloc] init];
            controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
            NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
            [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
            controller.mediaTypes = mediaTypes;
            controller.delegate = self;
            [self presentViewController:controller
                               animated:YES
                             completion:^(void){
                                 NSLog(@"Picker View Controller is presented");
                             }];
        }
    }
}

#pragma mark -- 相册选择代理
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [picker dismissViewControllerAnimated:YES completion:^() {
        UIImage *portraitImg = [info objectForKey:@"UIImagePickerControllerOriginalImage"];
        portraitImg = [self scaleImage:portraitImg toScale:0.3];
        // 裁剪
        VPImageCropperViewController *imgEditorVC = [[VPImageCropperViewController alloc] initWithImage:portraitImg cropFrame:CGRectMake(0, 100.0f, self.view.frame.size.width, self.view.frame.size.width) limitScaleRatio:3.0];
        imgEditorVC.delegate = self;
        [self presentViewController:imgEditorVC animated:YES completion:^{
            // TO DO
        }];
    }];
}

#pragma mark VPImageCropperDelegate
- (void)imageCropper:(VPImageCropperViewController *)cropperViewController didFinished:(UIImage *)editedImage {
    _avater = editedImage;
//    NSData* data;
//    NSString* imageFormat = @"";
//    if(nil == UIImagePNGRepresentation(editedImage))
//    {
//        //将图片转换为JPG格式的二进制数据
//        data = UIImageJPEGRepresentation(editedImage, 0.4);
//        imageFormat = @"jpeg";
//    }
//    else
//    {
//        //将图片转换为PNG格式的二进制数据
//        data = UIImagePNGRepresentation(editedImage);
//        imageFormat = @"png";
//    }
//    
//    NSString* url = [NSString stringWithFormat:@"personal/v2/upload/%@",self.currMediaType];
//    NSString* requestURL = [NSString stringWithFormat:@"%@%@",[ServerConfig sharedInstance].url,url];
//    
//    ASIFormDataRequest* request = [ASIFormDataRequest requestWithURL:[[NSURL alloc]initWithString:requestURL]];
//    [request setRequestMethod:@"POST"];
//    [request addRequestHeader:@"Content-Type" value:@"image/jpeg"];
//    
//    //上传二进制数据、或者文件
//    [request setData:data withFileName:[NSString stringWithFormat:@"file.%@",imageFormat] andContentType:@"application/json;charset=UTF-8" forKey:@"uploadFile"];
//    
//    [request setDelegate:self];
//    [request setTimeOutSeconds:10];
//    [request setDidFailSelector:@selector(uploadFailed:)];
//    [request setDidFinishSelector:@selector(uploadFinished:)];
//    [request startSynchronous];
    [self.list reloadData];
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
    
}

- (void)imageCropperDidCancel:(VPImageCropperViewController *)cropperViewController {
    [cropperViewController dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark- 缩放图片
-(UIImage *)scaleImage:(UIImage *)image toScale:(float)scaleSize
{
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width*scaleSize,image.size.height*scaleSize));
    [image drawInRect:CGRectMake(0, 0, image.size.width * scaleSize, image.size.height *scaleSize)];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
