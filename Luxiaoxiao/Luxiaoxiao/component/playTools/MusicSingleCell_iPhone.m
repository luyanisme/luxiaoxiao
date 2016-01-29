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
//  MusicSingleCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/29/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "MusicSingleCell_iPhone.h"

#pragma mark -

@implementation MusicSingleCell_iPhone

DEF_SIGNAL(TOUCHED)
SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.tapEnabled = YES;
    self.tapSignal = self.TOUCHED;
    
    $(@"#speaker").HIDE();
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
