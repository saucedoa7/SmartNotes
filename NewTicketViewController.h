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

@end

@interface NewTicketViewController : UIViewController
@property (weak, nonatomic) id <NewTicketVCDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtTicketNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtPartNumber;

@property (strong, nonatomic) IBOutlet UITextView *txtNotes;

@property (strong, nonatomic) NSString *date;

- (IBAction)btnDeparted:(UIButton *)sender;
- (IBAction)btnArrived:(UIButton *)sender;
- (IBAction)btnCompleted:(UIButton *)sender;
- (IBAction)didCancel:(UIButton *)sender;
- (IBAction)addTicket:(UIButton *)sender;

@property (strong, nonatomic) IBOutlet UIButton *doneBtn;

@property (strong, nonatomic) NSString *departedText;
@property (strong, nonatomic) NSString *arrivedText;
@property (strong, nonatomic) NSString *completedText;

@property (strong, nonatomic) NSMutableArray *times;
@end


