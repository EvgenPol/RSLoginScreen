//
//  UIView+MyState.m
//  RSLoginScreen
//
//  Created by Евгений Полюбин on 04.07.2021.
//

#import "UIView+MyState.h"
@interface UIView (MyState)

@property(nullable, nonatomic,strong) UIColor *textColor;

@end


@implementation UIView (MyState)
@dynamic textColor;

-(void)setUpForState:(NSInteger)state {
    switch (state) {
            
        case MyStateReady:
            if ([self isKindOfClass:[UITextField class]]) {
                self.textColor = [UIColor blackColor];
                self.layer.borderColor = [UIColor colorNamed:@"BlackCoral"].CGColor;
                self.layer.borderWidth = 1.5;
                self.layer.cornerRadius = 5;
            } else {
                self.layer.cornerRadius = 10;
                self.layer.borderWidth = 2;
                self.layer.borderColor = [UIColor colorWithWhite:0 alpha:0].CGColor;
            }
            break;
            
        case MyStateError:
            self.layer.borderColor = [UIColor colorNamed:@"VenetianRed"].CGColor;
            break;
        
        case MyStateSuccess:
            if ([self isKindOfClass:[UITextField class]]) {
                self.textColor = [[UIColor alloc] initWithWhite:0 alpha:0.5];
                self.userInteractionEnabled = NO;
            }
            self.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen-0.5a"].CGColor;
            break;
            }
}

@end
