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
//  PlayListCell.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/29/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "PlayListCell.h"
#import "MusicSingleCell_iPhone.h"
#import "PlayTools.h"

#pragma mark -

@implementation PlayListCell

DEF_OUTLET(BeeUIScrollView, list)

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

- (void)load
{
    self.list.lineCount = 1;
    self.list.animationDuration = 0.25;
    
    self.list.whenReloading = ^{
        self.list.total = 6;
        
        for (int i=0; i<self.list.total; i++) {
            BeeUIScrollItem *item = self.list.items[i];
            item.clazz = [MusicSingleCell_iPhone class];
            item.size = CGSizeAuto;
            item.data = nil;
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

- (void)showWithView:(UIView *)view{
    self.frame = CGRectMake(0, 0, SCREEN_WIDTH, view.height-bee.ui.playTools.size.height);
    [view addSubview:self];
}

- (void)dismiss{
    [self removeFromSuperview];
}

ON_SIGNAL3(PlayListCell, cancel, signal){
    if (self.whenCanceled) {
        self.whenCanceled();
    }
    [self dismiss];
}

ON_SIGNAL2(MusicSingleCell_iPhone, signal){

}

@end
