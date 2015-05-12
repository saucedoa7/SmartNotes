//
//  ViewController.h
//  SmartTechNotes
//
//  Created by Albert Saucedo on 4/30/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewTicketViewController.h"

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, NewTicketVCDelegate>

#define TICKET_NUMBERS @"Ticket Numbers"
#define TICKET_TIMES @"Ticket Times"
#define TICKET_NOTES @"Ticket Notes"

#define NEW_TICKET_KEY @"New Ticket Key"

@property (strong, nonatomic) IBOutlet UINavigationItem *naviItem;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) NewTicketViewController *passSelectedTicket;


@end

