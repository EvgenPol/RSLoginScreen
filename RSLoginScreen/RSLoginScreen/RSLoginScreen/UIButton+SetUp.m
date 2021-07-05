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


//functionality for changing the background

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor colorNamed:@"LittleBoyBlue-0.2a"];
    [super touchesBegan:touches withEvent:event];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    self.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
    [super touchesEnded:touches withEvent:event];
}

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (![self.titleLabel.text isEqual:@"Authorize"]) {
        self.titleLabel.alpha = 1.0;
    }
    
}


@end
