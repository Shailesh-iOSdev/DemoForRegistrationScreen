//
//  MyInfoViewController.m
//  RegistrationDemo
//
//  Created by Shailesh on 29/11/15.
//  Copyright (c) 2015 ONC. All rights reserved.
//

#import "MyInfoViewController.h"
#import "SelectProductViewController.h"
@implementation MyInfoViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.title = @"My Information";
    self.navigationItem.hidesBackButton = YES;
    [self registerForKeyboardNotifications];
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc]
                                           initWithTarget:self
                                           action:@selector(hideKeyBoard:)];
    [self.myInfoScrollview addGestureRecognizer:tapGesture];
}


-(IBAction)doneButton_clicked:(UIButton *)sender{
    
    NSString * selectProductSegue = @"SelectProductViewController";
    
    [self performSegueWithIdentifier:selectProductSegue sender:nil];
}

-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    SelectProductViewController * selectProductViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:selectProductViewController animated:YES];
}



- (void)hideKeyBoard:(UITapGestureRecognizer *)gesture {
    //handle taps
    [self.activeTextField resignFirstResponder];

}
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.activeTextField = textField;
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    NSDictionary* info = [aNotification userInfo];
    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    _myInfoScrollview.contentInset = contentInsets;
    _myInfoScrollview.scrollIndicatorInsets = contentInsets;
    
    // If active text field is hidden by keyboard, scroll it so it's visible
    // Your application might not need or want this behavior.
    CGRect aRect = _myInfoContentview.frame;
    aRect.size.height -= kbSize.height;
    if (!CGRectContainsPoint(aRect, _activeTextField.frame.origin) ) {
        CGPoint scrollPoint = CGPointMake(0.0, _activeTextField.frame.origin.y-kbSize.height);
        [_myInfoScrollview setContentOffset:scrollPoint animated:YES];
    }
}

// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    _myInfoScrollview.contentInset = contentInsets;
    _myInfoScrollview.scrollIndicatorInsets = contentInsets;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}



@end
