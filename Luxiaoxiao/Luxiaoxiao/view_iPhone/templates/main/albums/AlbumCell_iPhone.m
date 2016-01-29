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
//  AlbumCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/28/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "AlbumCell_iPhone.h"

#pragma mark -

@implementation AlbumCell_iPhone

DEF_OUTLET(BeeUIImageView, cover)

DEF_SIGNAL(TOUCHED)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.tapEnabled = YES;
    self.tapSignal = self.TOUCHED;
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
    self.cover.size = CGSizeMake(self.bounds.size.width, self.bounds.size.width);
}

@end
