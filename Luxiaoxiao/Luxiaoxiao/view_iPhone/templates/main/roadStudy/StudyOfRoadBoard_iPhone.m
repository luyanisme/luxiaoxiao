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
//  StudyOfRoadBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/28/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "StudyOfRoadBoard_iPhone.h"
#import "PlayTools.h"

#pragma mark -

@interface StudyOfRoadBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation StudyOfRoadBoard_iPhone

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
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationBarShown = YES;
    self.navigationBarTitle = @"路学";
    
    self.navigationBarLeft = [UIImage imageNamed:@"navigation-back.png"];
}

ON_DELETE_VIEWS( signal )
{
}

ON_LAYOUT_VIEWS( signal )
{
}

ON_WILL_APPEAR( signal )
{
    bee.ui.playTools.hidden = YES;
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
    [self.stack popBoardAnimated:YES];
}

ON_SIGNAL3( BeeUINavigationBar, RIGHT_TOUCHED, signal )
{
}

@end
