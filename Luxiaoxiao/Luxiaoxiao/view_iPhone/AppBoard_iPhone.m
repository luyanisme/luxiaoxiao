//
//   ______    ______    ______    
//  /\  __ \  /\  ___\  /\  ___\   
//  \ \  __<  \ \  __\_ \ \  __\_ 
//   \ \_____\ \ \_____\ \ \_____\ 
//    \/_____/  \/_____/  \/_____/ 
//
//  Powered by BeeFramework
//
//
//  AppBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 12/22/15.
//  Copyright © 2015 _Luyan. All rights reserved.
//

#import "AppBoard_iPhone.h"
#import "LoginBoard_iPhone.h"
#import "MainBoard_iPhone.h"

#pragma mark -

@implementation AppBoard_iPhone

DEF_SINGLETON( AppBoard_iPhone )

- (void)load
{
}

- (void)unload
{
}

#pragma mark Signal

ON_CREATE_VIEWS( signal )
{
    [self.view addSubview:bee.ui.router.view];
    [self.view addSubview:bee.ui.playTools];
    bee.ui.playTools.hidden = YES;
    
    [bee.ui.router map:@"LoginBoard_iPhone" toClass:[LoginBoard_iPhone class]];
    [bee.ui.router map:@"MainBoard_iPhone" toClass:[MainBoard_iPhone class]];
    
    [bee.ui.router open:@"LoginBoard_iPhone"];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
    if (IS_IPHONE_5 || IS_IPHONE_4_OR_LESS) {
        bee.ui.playTools.frame = CGRectMake(0, SCREEN_HEIGHT-40, SCREEN_WIDTH, 40);
    } else {
        bee.ui.playTools.frame = CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_WIDTH, 60);
    }
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

@end
