//
//  KCSListOverviewTableController.h
//  SampleApp
//
//  Created by Brian Wilson on 11/4/11.
//  Copyright (c) 2011 Kinvey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <KinveyKit/KinveyKit.h>
#import "KCSTableViewControllerAddDelegate.h"
@class KCSList;
@interface KCSListOverviewTableController : UITableViewController <KCSCollectionDelegate, KCSTableViewControllerAddDelegate, KCSPersistDelegate>

@property (retain) NSMutableArray *kLists;
@property (retain) KCSCollection *listsCollection;
@property (retain) KCSList *listToAdd;

@end