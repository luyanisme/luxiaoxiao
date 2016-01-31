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
//  PersonalBoardCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/31/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "PersonalBoardCell_iPhone.h"

#pragma mark -

@implementation PersonalBoardCell_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

- (void)dataDidChanged
{
    // TODO: fill data
    if (self.data) {
        $(@"#photo").DATA(self.data);
    }
}

- (void)layoutDidFinish
{
    // TODO: custom layout here
}

@end
