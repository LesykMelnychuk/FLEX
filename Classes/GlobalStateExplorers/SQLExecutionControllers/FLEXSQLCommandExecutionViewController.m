//
//  FLEXSQLCommandExecutionViewController.m
//  FLEX
//
//  Created by Les Melnychuk on 7/9/19.
//  Copyright © 2019 Flipboard. All rights reserved.
//

#import "FLEXSQLCommandExecutionViewController.h"
#import "FLEXObjectExplorerViewController.h"
#import "FLEXObjectExplorerFactory.h"
#import "FLEXUtility.h"
#import <objc/runtime.h>

@interface FLEXSQLCommandExecutionViewController ()
    @property (nonatomic) UITextView *textView;
    @property (nonatomic) UIButton *submitButton;
    @property (nonatomic) UILabel *statusLabel;
    @end

@implementation FLEXSQLCommandExecutionViewController
    @synthesize isSelectionType, sql, textView, submitButton, statusLabel;
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = isSelectionType ? @"Select with SQL" : @"Execute SQL";
    
    [self addOtherUIElements];
}
    
    
- (void)addOtherUIElements {
    textView = [UITextView new];
    submitButton = [UIButton new];
    statusLabel = [UILabel new];
    
    [submitButton setTitle: @"Submit" forState: UIControlStateNormal];
    [submitButton addTarget: self action:@selector(submitPressed) forControlEvents: UIControlEventTouchUpInside];
    
    [self.view addSubview: textView];
    [self.view addSubview: submitButton];
    [self.view addSubview: statusLabel];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat sideMargin = 20;
    CGFloat width = self.view.frame.size.width - sideMargin * 2;
    CGFloat startingY = self.navigationController.navigationBar.frame.size.height + sideMargin;
    CGFloat submitButtonHeight = 50;
    CGFloat statusLabelHeight = 100;
    CGFloat textViewHeight = self.view.frame.size.height - startingY - submitButtonHeight - statusLabelHeight - sideMargin * 3;
    
    textView.frame = CGRectMake(sideMargin, startingY + sideMargin, width, textViewHeight);
    statusLabel.frame = CGRectMake(sideMargin, textView.frame.origin.y + sideMargin, width, statusLabelHeight);
    submitButton.frame = CGRectMake(sideMargin, statusLabel.frame.origin.y + sideMargin, width, submitButtonHeight);
}
    
- (void)submitPressed {
    
}
    @end
