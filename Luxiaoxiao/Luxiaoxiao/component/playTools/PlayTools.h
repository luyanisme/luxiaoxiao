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
//  PlayTools.h
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "Bee.h"

#pragma mark -

AS_UI(PlayTools, playTools)

@interface PlayTools : BeeUICell

AS_SINGLETON(PlayTools)
AS_OUTLET(BeeUIImageView, play_icon)

@end
