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
//  AlbumListCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/28/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "AlbumListCell_iPhone.h"
#import "AlbumCell_iPhone.h"

#pragma mark -

#define IMAGE_WIDTH ((SCREEN_WIDTH-20)/3)
@implementation AlbumListCell_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    [self initScrollView];
}

- (void)unload
{
}

- (void)initScrollView{
    self.list = [[UIScrollView alloc] init];
    self.list.frame = CGRectMake(10, 40, (SCREEN_WIDTH-20), IMAGE_WIDTH+30);
    self.list.contentSize = CGSizeMake(IMAGE_WIDTH*4, IMAGE_WIDTH+30);
    self.list.showsHorizontalScrollIndicator = NO;
    
    for (int i=0; i<4; i++) {
        AlbumCell_iPhone *cell = [AlbumCell_iPhone cell];
        cell.frame = CGRectMake(i*IMAGE_WIDTH, 0, IMAGE_WIDTH, IMAGE_WIDTH+30);
        [self.list addSubview:cell];
    }
    
    [self addSubview:self.list];
}

- (void)dataDidChanged
{
    // TODO: fill data
}

- (void)layoutDidFinish
{
    
}

@end
