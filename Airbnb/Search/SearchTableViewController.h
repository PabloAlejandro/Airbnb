//
//  SearchTableViewController.h
//  Search
//
//  Created by Pau on 02/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatrixTableViewController.h"

@interface SearchTableViewController : MatrixTableViewController <UITextFieldDelegate>

@property (nonatomic, weak) IBOutlet UITextField * textField;

@end
