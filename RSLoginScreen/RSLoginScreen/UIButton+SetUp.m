//
//  UIButton+SetUp.m
//  RSLoginScreen
//
//  Created by Евгений Полюбин on 04.07.2021.
//

#import "UIButton+SetUp.h"

@implementation UIButton (SetUp)

-(void)setUp {

    if ([self.titleLabel.text  isEqual: @"Authorize"]) {
        self.layer.cornerRadius = 10;
        self.layer.borderWidth = 2;
    } else {
        self.layer.cornerRadius = 25;
        self.layer.borderWidth = 1.5;
    }
    
    self.layer.borderColor = [UIColor colorNamed:@"LittleBoyBlue"].CGColor;
}

//Functionality for changing the Highlighted state

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesBegan:touches withEvent:event];
    self.backgroundColor = [UIColor colorNamed:@"LittleBoyBlue-0.2a"];
    
    if (![self.titleLabel.text isEqual:@"Authorize"]) {
        [self setHighlighted:NO];
    } else {
        [self setImage:[UIImage imageNamed:@"Per"] forState:UIControlStateHighlighted];
        self.titleLabel.alpha = 0.2;
    }
   
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    
    if ([self.titleLabel.text isEqual:@"Authorize"]) {
        self.titleLabel.alpha = 1.0;
    } else {
        [UIView performWithoutAnimation:^{
          [self setHighlighted:NO];
          [self layoutIfNeeded];
        }];
    }
}



@end
