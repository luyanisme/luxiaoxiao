//
//  MetaData.h
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FUNCTION_ITEM;
@class ALBUM_ITEM;

#pragma mark - 功能按钮
@interface FUNCTION_ITEM : NSObject

@property (nonatomic, strong) NSString *title;     //按钮功能
@property (nonatomic, strong) NSString *imagePath; //图片路径

@end

#pragma mark - 专辑
@interface ALBUM_ITEM : NSObject

@property (nonatomic, strong) NSString *title;     //按钮功能
@property (nonatomic, strong) NSString *imagePath; //图片路径

@end

