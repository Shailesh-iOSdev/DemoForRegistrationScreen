//
//  ViewController.m
//  RegistrationDemo
//
//  Created by Shailesh on 29/11/15.
//  Copyright (c) 2015 ONC. All rights reserved.
//

#import "ViewController.h"
#import "MyInfoViewController.h"
#import "AppDelegate.h"
@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *agreeButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)tnCButton_clicked:(UIButton *)sender{
    
    NSString * myInfoSegue = nil;
    if (sender == _cancelButton) {
        myInfoSegue = @"MyInfoViewController";
    }
    else{
        myInfoSegue = @"MyInfoViewController";
    }
    
    [self performSegueWithIdentifier:myInfoSegue sender:nil];
}

-(void)performSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    MyInfoViewController * infoViewController = [storyboard instantiateViewControllerWithIdentifier:identifier];
    [self.navigationController pushViewController:infoViewController animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
