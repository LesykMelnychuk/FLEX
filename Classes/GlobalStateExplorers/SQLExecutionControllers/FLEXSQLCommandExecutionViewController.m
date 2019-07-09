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
    
@end

@implementation FLEXSQLCommandExecutionViewController
    @synthesize isSelectionType, sql;
    
- (void)viewDidLoad {
    [super viewDidLoad];

//    isExecutionType = TRUE;
    self.navigationItem.title = isSelectionType ? @"Execute SQL" : @"Select with SQL";
}
    
@end
