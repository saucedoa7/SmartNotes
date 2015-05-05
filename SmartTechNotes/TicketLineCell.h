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

@property (strong, nonatomic) NSString *ticketNumber;
@property (strong, nonatomic) NSString *ticketTime;
@property (strong, nonatomic) NSString *ticketNotes;
@end
