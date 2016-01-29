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
//  FunctionSingleCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "FunctionSingleCell_iPhone.h"

#pragma mark -

@implementation FunctionSingleCell_iPhone

DEF_OUTLET(BeeUIImageView, photo)
DEF_SIGNAL(TOUCHED)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.backgroundColor = [UIColor whiteColor];
    
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
        FUNCTION_ITEM *item = self.data;
        $(@"#title").DATA(item.title);
        $(@"#icon").DATA(item.imagePath);
    }
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
