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
//  PosterCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "PosterCell_iPhone.h"
#import "PosterImageCell_iPhone.h"

#pragma mark -

@implementation PosterCell_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    
    NSArray *testArray = @[@"banner_bg1.png",@"banner_bg2.png",@"banner_bg3.png"];
    @weakify(self);

    self.pager.currentPageIndicatorTintColor = [UIColor colorWithRed:0.05f green:0.72f blue:0.94f alpha:1.00f];
    self.pager.pageIndicatorTintColor = [UIColor whiteColor];
    
    self.list.lineCount = 1;
    self.list.animationDuration = 0.25f;
    
    self.list.bounces = NO;
    
    self.list.whenReloading = ^
    {
        @normalize(self);
        
        self.list.total = 3;
        for (int i =0; i<self.list.total; i++) {
            BeeUIScrollItem *posterItem = self.list.items[i];
            posterItem.clazz = [PosterImageCell_iPhone class];
            posterItem.size = self.list.size;
            posterItem.data = testArray[i];
        }
    };
    
    self.list.whenReloaded = ^
    {
        self.pager.numberOfPages = self.list.total;
        self.pager.currentPage = self.list.pageIndex;
    };
    self.list.whenStop = ^
    {
        self.pager.numberOfPages = self.list.total;
        self.pager.currentPage = self.list.pageIndex;
    };
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
