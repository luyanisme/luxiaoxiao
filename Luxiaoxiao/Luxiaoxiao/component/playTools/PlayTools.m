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
//  PlayTools.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 1/27/16.
//  Copyright © 2016 _Luyan. All rights reserved.
//

#import "PlayTools.h"
#import "PlayListCell.h"

#pragma mark -

@interface PlayTools ()
{
    BOOL _isPlay;//是否正在播放
    BOOL _isExpand;//列表是否展开
    PlayListCell *_listCell;
}
@end

DEF_UI(PlayTools, playTools)

@implementation PlayTools

DEF_SINGLETON(PlayTools)
SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

DEF_OUTLET(BeeUIImageView, play_icon)

- (void)load
{
    self.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0.9];
    _isPlay = NO;
    _isExpand = NO;
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

//功能列表
ON_SIGNAL3( PlayTools, function, signal )
{
    NSLog(@"功能列表");
    if (self.superview) {
        
        if (!_listCell) {
            _listCell = [PlayListCell cell];
        }
        
        if (_isExpand) {
            [_listCell dismiss];
            _isExpand = NO;
        } else {
            [_listCell showWithView:self.superview];
            _isExpand = YES;
        }
        
        _listCell.whenCanceled = ^{
            _isExpand = NO;
        };
    }
}

//前一首
ON_SIGNAL3( PlayTools, previous, signal )
{
    NSLog(@"前一首");
}

//开始播放
ON_SIGNAL3( PlayTools, play, signal )
{
    
    if (_isPlay) {
        NSLog(@"停止播放");
        self.play_icon.image = [UIImage imageNamed:@"play_start_icon.png"];
        _isPlay = NO;
    } else {
        NSLog(@"开始播放");
        self.play_icon.image = [UIImage imageNamed:@"play_stop_icon.png"];
        _isPlay = YES;
    }
}

//后一首
ON_SIGNAL3( PlayTools, next, signal )
{
    NSLog(@"后一首");
}

@end
