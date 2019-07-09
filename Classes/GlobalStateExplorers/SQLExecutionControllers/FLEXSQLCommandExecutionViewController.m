//
//  FLEXSQLCommandExecutionViewController.m
//  FLEX
//
//  Created by Les Melnychuk on 7/9/19.
//  Copyright © 2019 Flipboard. All rights reserved.
//

#import "FLEXSQLCommandExecutionViewController.h"
#import "FLEXSQLiteDatabaseManager.h"
#import "FLEXObjectExplorerFactory.h"
#import "FLEXTableListViewController.h"
#import "FLEXUtility.h"
#import <objc/runtime.h>

@interface FLEXSQLCommandExecutionViewController ()
    @property (nonatomic) UITextView* textView;
    @property (nonatomic) UIButton* submitButton;
    @property (nonatomic) UILabel* statusLabel;
@end

@implementation FLEXSQLCommandExecutionViewController
    @synthesize isSelectionType, dbManager, textView, submitButton, statusLabel;
    
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = isSelectionType ? @"Select with SQL" : @"Execute SQL";
    [self.view addObserver:self forKeyPath:@"frame" options:0 context:NULL];
    
    [self addOtherUIElementsAndPositionThem];
}
    
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    [self addOtherUIElementsAndPositionThem];
}
    
- (void)addOtherUIElementsAndPositionThem {
    if(textView == nil) {
        textView = [UITextView new];
        textView.backgroundColor = [UIColor colorWithWhite: 0.9 alpha: 1.0];
        textView.textColor = [UIColor blackColor];
        
        [self.view addSubview: textView];
    }
    
    if(submitButton == nil) {
        submitButton = [UIButton new];
        
        [submitButton setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
        [submitButton setBackgroundColor: [UIColor colorWithWhite: 0.9 alpha: 1.0]];
        
        [submitButton setTitle: @"Submit" forState: UIControlStateNormal];
        [submitButton addTarget: self action:@selector(submitPressed) forControlEvents: UIControlEventTouchUpInside];
        
        [self.view addSubview: submitButton];
    }
    
    if(statusLabel == nil) {
        statusLabel = [UILabel new];
        
        statusLabel.textColor = [UIColor blackColor];
        [self.view addSubview: statusLabel];
    }
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGFloat sideMargin = 20;
    CGFloat width = self.view.frame.size.width - sideMargin * 2;
    CGFloat startingY = self.navigationController.navigationBar.frame.size.height + sideMargin;
    CGFloat submitButtonHeight = 50;
    CGFloat statusLabelHeight = 70;
    CGFloat textViewHeight = self.view.frame.size.height - startingY - submitButtonHeight - statusLabelHeight - sideMargin * 4;
    
    textView.frame = CGRectMake(sideMargin, startingY + sideMargin, width, textViewHeight);
    statusLabel.frame = CGRectMake(sideMargin, textView.frame.origin.y + textViewHeight + sideMargin, width, statusLabelHeight);
    submitButton.frame = CGRectMake(sideMargin, statusLabel.frame.origin.y + statusLabelHeight + sideMargin, width, submitButtonHeight);
}
    
- (void)submitPressed {
    if (isSelectionType) {
        //    - (NSArray<NSDictionary<NSString *, id> *> *)executeSelectionQuery:(NSString *)sql;

    } else {
        NSLog(textView.text);
        
        bool result = [self.dbManager executeNonSelectQuery: textView.text];
        
        statusLabel.text = result ? @"SUCCESS" : @"ERROR OCCURED";
    }
}
@end
