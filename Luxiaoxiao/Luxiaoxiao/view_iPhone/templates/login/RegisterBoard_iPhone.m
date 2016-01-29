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
//  RegisterBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 12/23/15.
//  Copyright © 2015 _Luyan. All rights reserved.
//

#import "RegisterBoard_iPhone.h"

#pragma mark -

@interface RegisterBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation RegisterBoard_iPhone

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

ON_SIGNAL3(RegisterBoard_iPhone, back, signal){
    [self.stack popBoardAnimated:YES];
}

/*
 *注册
 */
ON_SIGNAL3(RegisterBoard_iPhone, register, signal){
}
@end
