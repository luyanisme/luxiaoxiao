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
//  MainBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "MainBoard_iPhone.h"
#import "PosterCell_iPhone.h"
#import "FunctionCell_iPhone.h"
#import "AlbumListCell_iPhone.h"
#import "StudyOfRoadBoard_iPhone.h"

#pragma mark -

@interface MainBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation MainBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

DEF_OUTLET(BeeUIScrollView, list)

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
    self.navigationBarTitle = @"路小小";
    
    @weakify(self);
    
    self.list.animationDuration = 0.25;
    self.list.lineCount = 1;
    self.list.baseInsets = UIEdgeInsetsMake( 0.0f, 0.0f, bee.ui.playTools.size.height , 0.0f);
    
    self.list.whenReloading = ^{
        
        @normalize(self);
        self.list.total = 5;
        
        BeeUIScrollItem *posterItem = self.list.items[0];
        posterItem.clazz = [PosterCell_iPhone class];
        posterItem.size = CGSizeMake(self.list.width, self.view.bounds.size.height*0.3);
        posterItem.data = nil;
        
        BeeUIScrollItem *functionItem = self.list.items[1];
        functionItem.clazz = [FunctionCell_iPhone class];
        functionItem.size = CGSizeMake(self.list.width, 120.0f+10.0f);
        functionItem.data = nil;
        
        BeeUIScrollItem *albumItem_1 = self.list.items[2];
        albumItem_1.clazz = [AlbumListCell_iPhone class];
        albumItem_1.size = IS_IPHONE_5 ? CGSizeMake(self.list.width, 160.0f+10.0f) : CGSizeMake(self.list.width, 200.0f+10.0f);
        albumItem_1.data = nil;
        
        BeeUIScrollItem *albumItem_2 = self.list.items[3];
        albumItem_2.clazz = [AlbumListCell_iPhone class];
        albumItem_2.size = IS_IPHONE_5 ? CGSizeMake(self.list.width, 160.0f+10.0f) : CGSizeMake(self.list.width, 200.0f+10.0f);
        albumItem_2.data = nil;
        
        BeeUIScrollItem *albumItem_3 = self.list.items[4];
        albumItem_3.clazz = [AlbumListCell_iPhone class];
        albumItem_3.size = IS_IPHONE_5 ? CGSizeMake(self.list.width, 160.0f+10.0f) : CGSizeMake(self.list.width, 200.0f+10.0f);
        albumItem_3.data = nil;
        
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
    bee.ui.playTools.hidden = NO;
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
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

//功能列表
ON_SIGNAL3( PlayTools, function, signal )
{
    NSLog(@"功能列表");
}

//前一首
ON_SIGNAL3( PlayTools, previous, signal )
{
    NSLog(@"前一首");
}

//开始播放
ON_SIGNAL3( PlayTools, play, signal )
{
    NSLog(@"开始播放");
}

//后一首
ON_SIGNAL3( PlayTools, next, signal )
{
    NSLog(@"后一首");
}

//功能点击事件
ON_SIGNAL2(FunctionSingleCell_iPhone, signal){
    FUNCTION_ITEM *item = signal.sourceCell.data;
    if ([item.title isEqualToString:@"路学"]) {
        [self.stack pushBoard:[StudyOfRoadBoard_iPhone board] animated:YES];
    }
    
    if ([item.title isEqualToString:@"路听"]) {
        
    }
    
    if ([item.title isEqualToString:@"路游"]) {
        
    }
    
    if ([item.title isEqualToString:@"账户"]) {
        
    }
}

//功能点击事件
ON_SIGNAL2(AlbumCell_iPhone, signal){
    NSLog(@"专辑封面被点击");
}

@end
