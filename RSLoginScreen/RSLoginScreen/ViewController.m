//
//  ViewController.m
//  RSLoginScreen
//
//  Created by Евгений Полюбин on 01.07.2021.
//

#import "ViewController.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *logo;
@property (weak, nonatomic) IBOutlet UITextField *login;
@property (weak, nonatomic) IBOutlet UITextField *password;


-(void)setUpForReady: (UITextField *) textField;
-(void)setUpForError: (UITextField *) textField;
-(void)setUpForSuccess: (UITextField *) textField;


@property (weak, nonatomic) IBOutlet UIButton *authorizeButton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *gestureForHideKeyboard = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(closeKeyboard)];
    
    [self.view addGestureRecognizer: gestureForHideKeyboard];
  
    [self setUpForReady:self.login];
    [self setUpForReady:self.password];
    
    self.login.delegate =  self;
    self.password.delegate = self;
    //      Little Boy Blue color in RGB = (128, 164, 237)
    UIColor *littleBoyBlue =  [[UIColor alloc] initWithRed:(128/255.0) green:(164/255.0) blue:(237/255.0) alpha:1];

    self.authorizeButton.layer.borderWidth = 2;
    self.authorizeButton.layer.borderColor = littleBoyBlue.CGColor;
    self.authorizeButton.layer.cornerRadius = 10;
    [self.authorizeButton targetForAction:@selector(changeBackground) withSender:self];
    
}

-(void)changeBackground {
    
}

-(void)setUpForReady: (UITextField *) textField {
    //normal border color
    //Black Coral color in RGB = (76,92,104)
    textField.layer.borderColor = [[UIColor alloc] initWithRed:(76/255.0) green:(92/255.0) blue:(104/255.0) alpha:1].CGColor;
    textField.layer.borderWidth = 1.5;
    textField.layer.cornerRadius = 5;
    textField.textColor = [[UIColor alloc] initWithWhite:0 alpha:1];
}

-(void)setUpForError:(UITextField *) textField {
    //error border color
    //Venetian Red color in RGB = (194,1,20)
    textField.layer.borderColor = [[UIColor alloc] initWithRed:(194/255.0) green:(1/255.0) blue:(20/255.0) alpha:1].CGColor;
}

-(void)setUpForSuccess:(UITextField *) textField {
    //succes border color, and text alpha = 0.5
    //Turquoise Green color in RGB = (145, 199, 177)
    textField.layer.borderColor = [[UIColor alloc] initWithRed:(145/255.0) green:(199/255.0) blue:(177/255.0) alpha:1].CGColor;
    textField.textColor = [[UIColor alloc] initWithWhite:0 alpha:0.5];
    [textField setEnabled:NO];
}
 
- (IBAction)tryAuthorize:(UIButton *)sender {
    int checks = 0;
    if ([self.login.text  isEqual: @"username"]) {
        checks ++ ;
    } else {
        [self setUpForError:self.login];
    }
    if ([self.password.text isEqual:@"password"]) {
        checks ++ ;
    } else {
        [self setUpForError:self.password];
    }
    if (checks == 2) {
        [self setUpForSuccess:self.login];
        [self setUpForSuccess:self.password];
        [self.authorizeButton setEnabled:NO];
    }
}

//func for close keyboard
-(void)closeKeyboard {
    [self.view endEditing:YES];
}

@end

//MARK: funcional for keyboard
@interface ViewController (Delegate)

@end

@implementation  ViewController (Delegate)

//delegate for login UITextField
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
    [self setUpForReady:textField];
    return YES;
}


@end
