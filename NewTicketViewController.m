//
//  NewTicketViewController.m
//  SmartTechNotes
//
//  Created by Albert Saucedo on 5/1/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "NewTicketViewController.h"
#import "TicketLineCell.h"

@interface NewTicketViewController ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField *textField;
@end

@implementation NewTicketViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(returnKB)];
    [self.view addGestureRecognizer:tap];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(KBDidShow)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];

    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(KBDidHide)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    self.textField.delegate = self;

    [self checkToDisableDone];
    [self returnTimeStamp];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    return YES;
}

-(NSString *)returnDate{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm"];
    self.date = [dateFormatter stringFromDate:currDate];

    return self.date;
}

-(NSString *)returnTimeStamp{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"MM/dd/yyyy"];
    self.lblTimeStamp.text = [dateFormatter stringFromDate:currDate];

    return self.lblTimeStamp.text;
}

-(void) returnKB{
    [self.txtTicketNumber resignFirstResponder];
    [self.txtNotes resignFirstResponder];
    [self.txtPartNumber resignFirstResponder];

    [self checkToDisableDone];
}


- (IBAction)btnDeparted:(UIButton *)sender {
    self.date = [self returnDate];
    [self returnKB];

    [sender setTitle:self.date forState:UIControlStateNormal];

    self.departedText = self.date;
    [self checkToDisableDone];
}

- (IBAction)btnArrived:(UIButton *)sender {
    self.date = [self returnDate];
    [self returnKB];

    [sender setTitle:self.date forState:UIControlStateNormal];

    self.arrivedText = self.date;
    [self checkToDisableDone];
}

- (IBAction)btnCompleted:(UIButton *)sender {
    self.date = [self returnDate];
    [self returnKB];

    [sender setTitle:self.date forState:UIControlStateNormal];

    self.completedText = self.date;
    [self checkToDisableDone];
}

- (IBAction)didCancel:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)addTicket:(UIButton *)sender {

    TicketLineCell *ticket = [self retuenTicketCell];

    NSLog(@"Ticket %@", ticket.lblTicketNotes.text);
    [self.delegate addNewTicket:ticket];


    [self dismissViewControllerAnimated:YES completion:nil];
    [self checkToDisableDone];
}

-(TicketLineCell *)retuenTicketCell{

    if (self.arrivedText == nil) {
        self.arrivedText  = @"0:00";
    }

    if (self.completedText == nil) {
        self.completedText = @"0:00";
    }

    NSString *timeDuration  = [NSString stringWithFormat:@"%@ - %@ - %@", self.departedText, self.arrivedText, self.completedText];

    TicketLineCell *ticketCell = [TicketLineCell new];
    ticketCell.ticketTime = timeDuration;
    ticketCell.ticketNumber = self.txtTicketNumber.text;
    ticketCell.ticketNotes = self.txtNotes.text;

    return ticketCell;
}

-(void)checkToDisableDone{

    self.times = [[NSMutableArray alloc] initWithObjects:self.departedText,
                  self.arrivedText,
                  self.completedText,
                  self.txtTicketNumber.text,
                  self.txtNotes.text, nil];

    NSLog(@"%@", self.times);

    if ([self.times count] == 0) {
        NSLog(@"Nothing in times array");
        [self.doneBtn setEnabled:NO];
    } else {
        [self.doneBtn setEnabled:YES];
    }
}

-(void)KBDidShow{

    if ([self.txtPartNumber isEditing]) {
        [UIView animateWithDuration:.3 animations:^{
            self.lblPartNumebr.text = @"Done";
            self.view.transform = CGAffineTransformMakeTranslation(0, -90);

        } completion:^(BOOL finished) {
            nil;
        }];
    }
}

-(void)KBDidHide{
    self.lblPartNumebr.text = @"Part #";

    if (![self.txtPartNumber isEditing]) {

        [UIView animateWithDuration:.3 animations:^{
            self.lblPartNumebr.text = @"Part #";
            self.view.transform = CGAffineTransformMakeTranslation(0, 0);
            
        } completion:^(BOOL finished) {
            nil;
        }];
    }
}

-(void)saveData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.number forKey:TICKET_NUMBER];
    [userDefaults setObject:self.partNumber forKey:TICKET_PART_NUMBER];
    [userDefaults setObject:self.departedText forKey:TICKET_DEPARTED_TIME];
    [userDefaults setObject:self.arrivedText forKey:TICKET_ARRIVED_TIME];
    [userDefaults setObject:self.completedText forKey:TICKET_COMPLETED_TIME];
    [userDefaults setObject:self.date forKey:TICKET_DATE];
    [userDefaults setObject:self.timeStamp forKey:TICKET_TIMESTAMP];
    [userDefaults setObject:self.notes forKey:TICKET_NOTE];

    [userDefaults setObject:self.times forKey:TICKET_TIMES];

    [userDefaults synchronize];
}

-(void)loadData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.times = [[userDefaults objectForKey:TICKET_TIMES] mutableCopy];

    self.number = [userDefaults objectForKey:TICKET_NUMBER] ;
    self.partNumber = [userDefaults objectForKey:TICKET_PART_NUMBER] ;
    self.departedText = [userDefaults objectForKey:TICKET_DEPARTED_TIME] ;
    self.arrivedText = [userDefaults objectForKey:TICKET_ARRIVED_TIME] ;
    self.completedText = [userDefaults objectForKey:TICKET_COMPLETED_TIME] ;
    self.date = [userDefaults objectForKey:TICKET_DATE] ;
    self.timeStamp = [userDefaults objectForKey:TICKET_TIMESTAMP] ;
    self.notes = [userDefaults objectForKey:TICKET_NOTE] ;
}
@end
