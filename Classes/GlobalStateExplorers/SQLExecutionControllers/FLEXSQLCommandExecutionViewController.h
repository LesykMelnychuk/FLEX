//
//  FLEXSQLCommandExecutionViewController.h
//  FLEX
//
//  Created by Les Melnychuk on 7/9/19.
//  Copyright © 2019 Flipboard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FLEXSQLiteDatabaseManager.h"

@interface FLEXSQLCommandExecutionViewController: UIViewController
    @property (nonatomic) BOOL isSelectionType;
    @property (nonatomic) FLEXSQLiteDatabaseManager* dbManager;
@end
