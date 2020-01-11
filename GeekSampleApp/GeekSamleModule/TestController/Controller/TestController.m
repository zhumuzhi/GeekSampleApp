//
//  TestController.m
//  GeekSampleApp
//
//  Created by 朱慕之 on 2019/9/19.
//  Copyright © 2019 朱慕之. All rights reserved.
//

#import "TestController.h"

@interface TestController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UILabel *mealNameLabel;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UIImageView *photoImageView;

@end

@implementation TestController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _nameTextField.delegate = self;
}


#pragma mark - Method

- (IBAction)selectImageFromPhotoLibrary:(id)sender
{
    
    [_nameTextField resignFirstResponder];
    
}

- (IBAction)setDefaultLabelText:(id)sender
{
    
    _mealNameLabel.text = @"Default Text";
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    _mealNameLabel.text = textField.text;
}


@end
