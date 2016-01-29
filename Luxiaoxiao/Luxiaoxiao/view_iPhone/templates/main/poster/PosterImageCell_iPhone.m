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
//  PosterImageCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "PosterImageCell_iPhone.h"

#pragma mark -

@implementation PosterImageCell_iPhone

DEF_OUTLET(BeeUIImageView, photo)
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
    if (self.data) {
        $(@"photo").IMAGE(self.data);
    }
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
