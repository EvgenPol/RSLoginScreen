//
//  UIView+MyState.h
//  RSLoginScreen
//
//  Created by Евгений Полюбин on 04.07.2021.
//

#import <UIKit/UIKit.h>

typedef enum {
    MyStateReady,
    MyStateError,
    MyStateSuccess,
} MyState;

NS_ASSUME_NONNULL_BEGIN

@interface UIView (MyState)



-(void)setUpForState:(NSInteger)state;

@end

NS_ASSUME_NONNULL_END
