//
//  NewTicketViewController.h
//  SmartTechNotes
//
//  Created by Albert Saucedo on 5/1/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TicketLineCell.h"



@protocol NewTicketVCDelegate <NSObject>

@required
-(void)addNewTicket:(TicketLineCell *)ticket;
-(void)createTicket:(id)ticket;
@end

@interface NewTicketViewController : UIViewController
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

@property (weak, nonatomic) id <NewTicketVCDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtTicketNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtPartNumber;

@property (strong, nonatomic) IBOutlet UITextView *txtNotes;


@property (strong, nonatomic) IBOutlet UILabel *lblTimeStamp;
@property (strong, nonatomic) IBOutlet UILabel *lblPartNumebr;

- (IBAction)btnDeparted:(UIButton *)sender;
- (IBAction)btnArrived:(UIButton *)sender;
- (IBAction)btnCompleted:(UIButton *)sender;
- (IBAction)didCancel:(UIButton *)sender;
- (IBAction)addTicket:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *doneBtn;

@property (strong, nonatomic) NSString *number;
@property (strong, nonatomic) NSString *partNumber;
@property (strong, nonatomic) NSString *notes;
@property (strong, nonatomic) NSString *departedText;
@property (strong, nonatomic) NSString *arrivedText;
@property (strong, nonatomic) NSString *completedText;
@property (strong, nonatomic) NSString *date;
@property (strong, nonatomic) NSString *timeStamp;

@property (strong, nonatomic) NSMutableArray *times;
@end


