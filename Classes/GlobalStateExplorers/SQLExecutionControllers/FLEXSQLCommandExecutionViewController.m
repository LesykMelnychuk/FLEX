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
    @property (nonatomic) UIStackView *stackView;
@end

@implementation FLEXSQLCommandExecutionViewController
    @synthesize isSelectionType, sql, textView, submitButton, stackView;
    
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = isSelectionType ? @"Select with SQL" : @"Execute SQL";
    
    [self addOtherUIElements];
}
    
    
- (void)addOtherUIElements {
    textView = [UITextView new];
    submitButton = [UIButton new];
    
    [submitButton setTitle: @"Submit" forState: UIControlStateNormal];
    [[submitButton.heightAnchor constraintEqualToConstant: 80] setActive: TRUE];
    [submitButton addTarget: self action:@selector(submitPressed) forControlEvents: UIControlEventTouchUpInside];
    
    NSArray* constraints = @[
        [stackView.leftAnchor constraintEqualToAnchor: self.view.leftAnchor constant: 50],
        [stackView.rightAnchor constraintEqualToAnchor: self.view.rightAnchor constant: 50],
        [stackView.topAnchor constraintEqualToAnchor: self.view.topAnchor constant: 50],
        [stackView.bottomAnchor constraintEqualToAnchor: self.view.bottomAnchor constant: 50],
    ];
    
    for (NSLayoutConstraint* constraint in constraints) {
        [constraint setActive: TRUE];
    }
    
    [stackView addArrangedSubview: textView];
    [stackView addArrangedSubview: submitButton];
    
    [self.view addSubview: stackView];
}
    
- (void)submitPressed {
    
}
@end
