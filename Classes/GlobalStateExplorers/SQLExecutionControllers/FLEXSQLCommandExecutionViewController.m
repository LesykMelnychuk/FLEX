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

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = isSelectionType ? @"Select with SQL" : @"Execute SQL";
    
    [self addOtherUIElements];
}
    
    
- (void)addOtherUIElements {
    textView = [UITextView new];
    submitButton = [UIButton new];
    statusLabel = [UILabel new];
    
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    textView.translatesAutoresizingMaskIntoConstraints = false;
    submitButton.translatesAutoresizingMaskIntoConstraints = false;
    statusLabel.translatesAutoresizingMaskIntoConstraints = false;
    
    [submitButton setTitle: @"Submit" forState: UIControlStateNormal];
    [submitButton addTarget: self action:@selector(submitPressed) forControlEvents: UIControlEventTouchUpInside];
    
    NSLayoutConstraint* submitButtonHeight = [NSLayoutConstraint constraintWithItem: submitButton attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: 70];
    
    NSLayoutConstraint* statusLabelHeight = [NSLayoutConstraint constraintWithItem: statusLabel attribute: NSLayoutAttributeHeight relatedBy: NSLayoutRelationEqual toItem: nil attribute: NSLayoutAttributeNotAnAttribute multiplier: 1.0 constant: 100];
    
    
    NSLayoutConstraint* textViewTopConstraint = [NSLayoutConstraint constraintWithItem: textView attribute: NSLayoutAttributeTopMargin relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeTopMargin multiplier: 1.0 constant: 0];
    NSLayoutConstraint* textViewLeftConstraint = [NSLayoutConstraint constraintWithItem: textView attribute: NSLayoutAttributeLeftMargin relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeLeftMargin multiplier: 1.0 constant: 0];
    NSLayoutConstraint* textViewRightConstraint = [NSLayoutConstraint constraintWithItem: textView attribute: NSLayoutAttributeRightMargin relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeRightMargin multiplier: 1.0 constant: 0];

    NSLayoutConstraint* textViewBottomConstraint = [NSLayoutConstraint constraintWithItem: textView attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: statusLabel attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0];
    NSLayoutConstraint* statusLabelBottomConstraint = [NSLayoutConstraint constraintWithItem: statusLabel attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: submitButton attribute: NSLayoutAttributeTop multiplier: 1.0 constant: 0];
    NSLayoutConstraint* submitButtonBottomConstraint = [NSLayoutConstraint constraintWithItem: submitButton attribute: NSLayoutAttributeBottom relatedBy: NSLayoutRelationEqual toItem: self.view attribute: NSLayoutAttributeBottomMargin multiplier: 1.0 constant: 0];

    NSArray* constraints = @[submitButtonHeight, statusLabelHeight, textViewTopConstraint, textViewLeftConstraint, textViewRightConstraint, textViewBottomConstraint, statusLabelBottomConstraint, submitButtonBottomConstraint];

    for (NSLayoutConstraint* constraint in constraints) {
        [constraint setActive: TRUE];
    }
    
    [self.view addSubview: textView];
    [self.view addSubview: submitButton];
    [self.view addSubview: statusLabel];
}
    
- (void)submitPressed {
    
}
@end
