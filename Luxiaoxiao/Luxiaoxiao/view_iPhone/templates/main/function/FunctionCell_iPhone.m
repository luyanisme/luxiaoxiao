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
//  FounctionCell_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "FunctionCell_iPhone.h"
#import "FunctionSingleCell_iPhone.h"

#pragma mark -

@implementation FunctionCell_iPhone

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    
    FUNCTION_ITEM *functionItem_1 = [FUNCTION_ITEM new];
    functionItem_1.title = @"路学";
    functionItem_1.imagePath = @"study_icon.png";
    
    FUNCTION_ITEM *functionItem_2 = [FUNCTION_ITEM new];
    functionItem_2.title = @"路听";
    functionItem_2.imagePath = @"listen_icon.png";
    
    FUNCTION_ITEM *functionItem_3 = [FUNCTION_ITEM new];
    functionItem_3.title = @"路游";
    functionItem_3.imagePath = @"around_icon.png";
    
    FUNCTION_ITEM *functionItem_4 = [FUNCTION_ITEM new];
    functionItem_4.title = @"账号";
    functionItem_4.imagePath = @"personal_icon.png";
    
    NSArray *functionArray = @[functionItem_1,functionItem_2,functionItem_3,functionItem_4];
    
    @weakify(self)
    self.list.lineCount = 2;
    self.list.animationDuration = 0.25;
    
    self.list.whenReloading = ^{
        @normalize(self);
        self.list.total = functionArray.count;
        
        for (int i=0; i<self.list.total; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.clazz = [FunctionSingleCell_iPhone class];
            item.size = CGSizeMake(self.list.size.width/2, 60.0f);
            item.data = functionArray[i];
        }
    };
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
