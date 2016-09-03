//
//  SearchTableViewController.m
//  Search
//
//  Created by Pau on 02/09/2016.
//  Copyright © 2016 Pau. All rights reserved.
//

#import "SearchTableViewController.h"
#import "HeaderSectionCell.h"
#import "RecentCell.h"
#import "LocationCell.h"
#import "DataMock.h"
#import "NSUserDefaults+Utils.h"
#import <SDWebImage/UIImageView+WebCache.h>

typedef NS_ENUM(NSUInteger, SectionType) {
    SectionTypeCities = 0,
    SectionTypeLocations,
    SectionTypeRooms,
    SectionTypeRecent
};

static NSString * const sectionTitles[] = {
    @"Popular Cities",
    @"Popular Destinations",
    @"Rooms",
    @"Recent Searches"
};

// City cell ID
static NSString * const kCellCityIdentifier = @"CellCityIdentifier";
// Location cell ID
static NSString * const kCellLocationIdentifier = @"CellLocationIdentifier";
// Room cell ID
static NSString * const kCellIRoomdentifier = @"CellRoomIdentifier";
// Recent cell ID
static NSString * const kCellRecentIdentifier = @"CellRecentIdentifier";

static NSUInteger kMaxRecentSearches = 10;

@interface SearchTableViewController ()

@property (nonatomic, strong) NSMutableArray * cities;
@property (nonatomic, strong) NSMutableArray * locations;
@property (nonatomic, strong) NSMutableArray * rooms;
@property (nonatomic, strong) NSMutableArray * recent;

@property (nonatomic, weak) IBOutlet UIButton * clearButton;
@property (nonatomic, weak) IBOutlet UIButton * cancelButton;

@end

@implementation SearchTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.clearButton.alpha = 0;
    self.cancelButton.alpha = 0;
    
    NSDictionary * mock = [DataMock mock];
//    NSDictionary * meta = [mock objectForKey:@"meta"];
    NSDictionary * content = [mock objectForKey:@"content"];
    
    if(content) {
    
        _cities = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"cities"]];
        _locations = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"locationscities"]];
        _rooms = [[NSMutableArray alloc] initWithArray:[content objectForKey:@"rooms"]];
        _recent = [[NSMutableArray alloc] initWithArray:[NSUserDefaults getObjectProperty:@"recent" orDefault:@[]]];
        
        self.entries = @[self.cities, self.locations, self.rooms, self.recent];
    }
}

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    
    NSObject * object = self.entries[indexPath.section][indexPath.row];
    
    switch (indexPath.section) {
        case SectionTypeCities: {
            ((LocationCell *)cell).nameLabel.text = [object valueForKeyPath:@"name"];
            ((LocationCell *)cell).descriptionLabel.text = [object valueForKeyPath:@"id"];
            [((LocationCell *)cell).cityImageView sd_setImageWithURL:[NSURL URLWithString:[object valueForKeyPath:@"url"]]];
        }
            break;
            
        case SectionTypeLocations: {
            ((LocationCell *)cell).nameLabel.text = [object valueForKeyPath:@"name"];
            ((LocationCell *)cell).descriptionLabel.text = [object valueForKeyPath:@"id"];
            [((LocationCell *)cell).cityImageView sd_setImageWithURL:[NSURL URLWithString:[object valueForKeyPath:@"url"]]];
        }
            break;
            
        case SectionTypeRooms: {
            ((RecentCell *)cell).nameLabel.text = [object valueForKeyPath:@"title"];
            ((RecentCell *)cell).descriptionLabel.text = [object valueForKeyPath:@"description"];
        }
            break;
            
        case SectionTypeRecent: {
            ((RecentCell *)cell).nameLabel.text = (NSString *)object;
            ((RecentCell *)cell).descriptionLabel.text = nil;
        }
            break;
    }
}

- (NSString *)cellIdentifieratIndexPath:(NSIndexPath *)indexPath {
    // Override this is subclass
    switch (indexPath.section) {
        case SectionTypeCities:
            return kCellCityIdentifier;
            break;
            
        case SectionTypeLocations:
            return kCellLocationIdentifier;
            break;
            
        case SectionTypeRooms:
            return kCellIRoomdentifier;
            break;
            
        case SectionTypeRecent:
            return kCellRecentIdentifier;
            break;
            
        default:
            return nil;
            break;
    }
}

- (void)configureHeaderCell:(HeaderSectionCell *)cell atSection:(NSInteger)section {
    cell.mainLabel.text = sectionTitles[section];
}

- (void)updateRecentWithSearch:(NSString *)search {

    if(!search.length) {return;}
    
    if(![self.recent containsObject:search]) {
        [self.recent insertObject:search atIndex:0];
    }
    
    if(self.recent.count > kMaxRecentSearches) {
        [self.recent removeLastObject];
    }
    
    [NSUserDefaults setObjectProperty:@"recent" value:self.recent];
}

- (void)reloadSection:(NSUInteger)section {
    self.entries = @[self.cities, self.locations, self.rooms, self.recent];
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:section]
                  withRowAnimation:UITableViewRowAnimationFade];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    if([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
}

#pragma mark - IBAction mthods

- (IBAction)clearButtonPressed:(id)sender {
    
    // Set inital values
    self.entries = @[self.cities, self.locations, self.rooms, self.recent];
    
    [self.tableView reloadData];
    
    self.textField.text = nil;
}

- (IBAction)cancelButtonPressed:(id)sender {
    
    if([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    
    [UIView animateWithDuration:.2 animations:^{
        self.cancelButton.alpha = 1;
        self.clearButton.alpha = textField.text.length > 0 ? 1 : 0;
    }];
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    [UIView animateWithDuration:.2 animations:^{
        self.cancelButton.alpha = 0;
        self.clearButton.alpha = 0;
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString * proposedNewString = [[textField text] stringByReplacingCharactersInRange:range withString:string];

    [UIView animateWithDuration:.2 animations:^{
        self.clearButton.alpha = proposedNewString.length > 0 ? 1 : 0;
    }];
    
    // TODO: This should be  anetwork request
    
    NSDictionary * cityDictionary = @{
                                      @"id" : @"id city X",
                                      @"name" : @"Cityyyyy uooo",
                                      @"url" : @"http://www.globalacademicinstitute.com/wp-content/uploads/photo-gallery/new_york_skyline-wide.jpg"
                                      };
    
    [self.cities insertObject:cityDictionary atIndex:0];
    
    [self reloadSection:0];
    
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    if([self.textField isFirstResponder]) {
        [self.textField resignFirstResponder];
    }
    
    [self updateRecentWithSearch:textField.text];
    
    [self reloadSection:3];
    
    return true;
}

@end
