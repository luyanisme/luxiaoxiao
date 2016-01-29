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
//  ForgetPasswordBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "ForgetPasswordBoard_iPhone.h"

#pragma mark -

@interface ForgetPasswordBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation ForgetPasswordBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
}

- (void)unload
{
}

#pragma mark - Signal

ON_CREATE_VIEWS( signal )
{
    self.view.backgroundColor = [UIColor colorWithRed:0.65f green:0.91f blue:1.00f alpha:1.00f];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
}

ON_WILL_APPEAR( signal )
{
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

ON_SIGNAL3(ForgetPasswordBoard_iPhone, back, signal){
    [self.stack popBoardAnimated:YES];
}

/*
 *确认
 */
ON_SIGNAL3(ForgetPasswordBoard_iPhone, confirm, signal){
}
@end
