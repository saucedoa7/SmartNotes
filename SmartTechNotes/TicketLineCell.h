//
//  TicketLineCell.h
//  SmartTechNotes
//
//  Created by Albert Saucedo on 4/30/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TicketLineCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *lblTicketNumber;
@property (strong, nonatomic) IBOutlet UILabel *lblTicketTime;
@property (strong, nonatomic) IBOutlet UILabel *lblTicketNotes;

#define TICKET_NUMBER @"Ticket Number"
#define TICKET_PART_NUMBER @"Ticket Part Number"
#define TICKET_NOTE @"Ticket Note"
#define TICKET_DEPARTED_TIME @"Ticket Departed Time"
#define TICKET_ARRIVED_TIME @"Ticket Arrived Time"
#define TICKET_COMPLETED_TIME @"Ticket Completed Time"
#define TICKET_DATE @"Ticket Date"
#define TICKET_TIMESTAMP @"Ticket Time Stamp"

#define TICKET_NUMBERS @"Ticket Numbers"
#define TICKET_TIMES @"Ticket Times"
#define TICKET_NOTES @"Ticket Notes"

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *partNumber;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *departedText;
@property (strong, nonatomic) NSString *arrivedText;
@property (strong, nonatomic) NSString *completedText;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *timeStamp;

@property (strong, nonatomic) NSMutableArray *times;
@end
