//
//  ViewController.m
//  RSLoginScreen
//
//  Created by Евгений Полюбин on 01.07.2021.
//

#import "ViewController.h"
#import "UIButton+SetUp.h"
#import "UIView+MyState.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *logo;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIView *secure;
@property (weak, nonatomic) IBOutlet UILabel *secureLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonsOnScreen;

-(void)presentAlert;
-(void)closeKeyboard;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UITapGestureRecognizer *gestureForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(closeKeyboard)];
    [self.view addGestureRecognizer: gestureForHideKeyboard];
    
    [self.login setUpForState:MyStateReady];
    [self.password setUpForState:MyStateReady];
    [self.secure setUpForState:MyStateReady];
    
    for (UIButton *button in self.buttonsOnScreen) {
        [button setUp];
    }
    
    self.login.delegate =  self;
    self.password.delegate = self;
    
}

- (IBAction)tryAuthorize:(UIButton *)sender {
    int checks = 0;
    if ([self.login.text  isEqual: @"username"]) {
        self.login.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen"].CGColor;
        checks ++ ;
    } else {
        [self.login setUpForState:MyStateError];
    }
    if ([self.password.text isEqual:@"password"]) {
        self.password.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen"].CGColor;
        checks ++ ;
    } else {
        [self.password setUpForState:MyStateError];
    }
    if (checks == 2) {
        [self.login setUpForState:MyStateSuccess];
        [self.password setUpForState:MyStateSuccess];
        [self closeKeyboard];
        self.secure.hidden = NO;
        for (UIButton *button in self.buttonsOnScreen) {
            if ([button.titleLabel.text isEqual:@"Authorize"]) {
                button.enabled = NO;
                button.layer.borderColor = [UIColor colorNamed:@"LittleBoyBlue-0.5a"].CGColor;
            }
        }
    }
}


- (IBAction)secureButtonTap:(UIButton *)sender {
    if ([self.secureLabel.text isEqual:@"_"]) {
        self.secureLabel.text = sender.titleLabel.text;
        [self.secure setUpForState:MyStateReady];
    } else {
        self.secureLabel.text = [NSString stringWithFormat:@"%@ %@", self.secureLabel.text, sender.titleLabel.text];
    }
    if (self.secureLabel.text.length == 5) {
        if ([self.secureLabel.text isEqual: @"1 3 2"]) {
            [self.secure setUpForState:MyStateSuccess];
            self.secure.layer.borderColor = [UIColor colorNamed:@"TurquoiseGreen"].CGColor;
            [self presentAlert];
            for (UIButton *button in self.buttonsOnScreen) {
                if (![button isEqual:@"Authorize"]) {
                    button.enabled = NO;
                }
            }
        } else {
            [self.secure setUpForState:MyStateError];
            self.secureLabel.text = @"_";
        }
    }
}

//

-(void)closeKeyboard {
    [self.view endEditing:YES];
}

//

-(void)presentAlert {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Welcome"
                                                                   message:@"You are successfuly authorized!"
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Refresh"
                                              style:UIAlertActionStyleDestructive
                                            handler:^(UIAlertAction * _Nonnull action) {
        [self loadView];
        [self viewDidLoad];
    }]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end

//MARK: funcional for keyboard
@interface ViewController (DelegateForTextField)

@end

@implementation  ViewController (DelegateForTextField)



//Delegate for login UITextField
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField isEqual:self.login]) {
        NSCharacterSet *characterSet = [NSCharacterSet letterCharacterSet];
        for (int i = 0; i < [string length]; i++) {
            unichar letter = [string characterAtIndex:i];
            if (![characterSet characterIsMember:letter]) {
                return NO;
            }
        }
    }
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    return [textField resignFirstResponder];
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    if (textField.layer.borderColor == [UIColor colorNamed:@"VenetianRed"].CGColor) {
        [textField setUpForState:MyStateReady];
    }
    return YES;
}
//Made by Evgeny Poliubin


@end
