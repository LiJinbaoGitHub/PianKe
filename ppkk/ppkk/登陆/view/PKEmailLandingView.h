//
//  PKEmailLandingView.h
//  ppkk
//
//  Created by ma c on 16/1/25.
//  Copyright (c) 2016年 北京尚学堂. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PKEmailLandingView : UIView <UITextFieldDelegate>

@property (strong, nonatomic) UILabel * emailLabel;
@property (strong, nonatomic) UILabel * paseWordLabel;
@property (strong, nonatomic) UILabel * line1Label;
@property (strong, nonatomic) UILabel * line2Label;
@property (strong, nonatomic) UITextField * emailField;
@property (strong, nonatomic) UITextField * paseWordField;
@property (strong, nonatomic) UIButton * landingBtn;

@end
