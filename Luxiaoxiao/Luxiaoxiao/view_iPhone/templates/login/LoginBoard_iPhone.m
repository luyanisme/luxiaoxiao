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
//  LoginBoard_iPhone.m
//  Luxiaoxiao
//
//  Created by 卢棪 on 12/22/15.
//  Copyright © 2015 _Luyan. All rights reserved.
//

#import "LoginBoard_iPhone.h"
#import "RegisterBoard_iPhone.h"
#import "ForgetPasswordBoard_iPhone.h"

#pragma mark -

@interface LoginBoard_iPhone()
{
	//<#@private var#>
}
@end

@implementation LoginBoard_iPhone

SUPPORT_AUTOMATIC_LAYOUT( YES )
SUPPORT_RESOURCE_LOADING( YES )

DEF_OUTLET(BeeUITextField, phoneNum)
DEF_OUTLET(BeeUITextField, password)

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
    
    /*
     *更改placeholder的颜色
     */
    {
        [self.phoneNum setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
        [self.password setValue:[UIColor whiteColor] forKeyPath:@"_placeholderLabel.textColor"];
    }
    
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

/*
 *登录
 */
ON_SIGNAL3(LoginBoard_iPhone, login, signal){
//    NSString * userName = $(@"phoneNum").text.trim;
//    NSString * password = $(@"password").text.trim;
//    
//    if (userName.length == 0) {
//        [self presentMessageTips:@"请输入手机号码"];
//        return;
//    }
//    
//    if (password.length == 0) {
//        [self presentMessageTips:@"请输入密码"];
//        return;
//    }

    [bee.ui.router open:@"MainBoard_iPhone" animated:YES];
}

/*
 *注册
 */
ON_SIGNAL3(LoginBoard_iPhone, register, signal){
    [self.stack pushBoard:[RegisterBoard_iPhone board] animated:YES];
}

/*
 *忘记密码
 */
ON_SIGNAL3(LoginBoard_iPhone, forget, signal){
    [self.stack pushBoard:[ForgetPasswordBoard_iPhone board] animated:YES];
}

@end
