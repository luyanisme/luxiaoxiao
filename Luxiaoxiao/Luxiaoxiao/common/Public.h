//
//  Public.h
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/31/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Public : NSObject

+ (BOOL) isCameraAvailable;

+ (BOOL) isRearCameraAvailable;

+ (BOOL) isFrontCameraAvailable;

+ (BOOL) doesCameraSupportTakingPhotos;

+ (BOOL) isPhotoLibraryAvailable;

+ (BOOL) canUserPickVideosFromPhotoLibrary;

+ (BOOL) canUserPickPhotosFromPhotoLibrary;

+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType;

@end
