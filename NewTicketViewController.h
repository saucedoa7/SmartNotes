//
//  NewTicketViewController.h
//  SmartTechNotes
//
//  Created by Albert Saucedo on 5/1/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewTicketViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *txtTicketNumber;
@property (strong, nonatomic) IBOutlet UITextField *txtPartNumber;

@property (strong, nonatomic) IBOutlet UITextView *txtNotes;

@property (strong, nonatomic) IBOutlet UILabel *lblDeparted;
@property (strong, nonatomic) IBOutlet UILabel *lblArrived;
@property (strong, nonatomic) IBOutlet UILabel *lblCompleted;

@property (strong, nonatomic) NSString *date;

- (IBAction)btnDeparted:(UIButton *)sender;
- (IBAction)btnArrived:(UIButton *)sender;
- (IBAction)btnCompleted:(UIButton *)sender;

@end


