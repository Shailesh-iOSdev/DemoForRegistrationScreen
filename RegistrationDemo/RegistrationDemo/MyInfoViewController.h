//
//  MyInfoViewController.h
//  RegistrationDemo
//
//  Created by Shailesh on 29/11/15.
//  Copyright (c) 2015 ONC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyInfoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *myInfoScrollview;
@property (weak, nonatomic) IBOutlet UIView *myInfoContentview;

@property (weak, nonatomic)  UITextField *activeTextField;

@end
