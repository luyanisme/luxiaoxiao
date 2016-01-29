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
//  PlayListCell.h
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/29/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "Bee.h"

#pragma mark -

@interface PlayListCell : BeeUICell

@property (nonatomic, copy) void (^whenCanceled)();

- (void)showWithView:(UIView*)view;
- (void)dismiss;

AS_OUTLET(BeeUIScrollView, list)

@end
