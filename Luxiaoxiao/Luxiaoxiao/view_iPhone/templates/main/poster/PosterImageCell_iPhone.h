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
//  PosterImageCell_iPhone.h
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "Bee.h"

#pragma mark -

@interface PosterImageCell_iPhone : BeeUICell

AS_OUTLET(BeeUIImageView, photo)
AS_SIGNAL(TOUCHED)

@end
