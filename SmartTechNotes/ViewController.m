//
//  ViewController.m
//  SmartTechNotes
//
//  Created by Albert Saucedo on 4/30/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "ViewController.h"
#import "TicketLineCell.h"
#import "NewTicketViewController.h"

@interface ViewController ()
@property NSMutableArray *ticketNumbers;
@property NSMutableArray *ticketTimes;
@property NSMutableArray *ticketNotes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated{
    [self loadData];
    NSLog(@"VC VDLoad %@ %@ %@", self.ticketNumbers, self.ticketTimes, self.ticketNotes);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.ticketNumbers count];;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    TicketLineCell *ticketCell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];

    NSInteger row = [indexPath row];

    ticketCell.lblTicketNumber.text = self.ticketNumbers [row];
    ticketCell.lblTicketTime.text = self.ticketTimes [row];
    ticketCell.lblTicketNotes.text = self.ticketNotes [row];

    return ticketCell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    NewTicketViewController *ticket = segue.destinationViewController;
    ticket.txtTicketNumber.text = self.passSelectedTicket.number;

    NSLog(@"Passing Data %@", ticket);

    ticket.delegate = self;
}

#pragma mark Helpers

-(void)addNewTicket:(TicketLineCell *)ticket{

    if (!self.ticketNumbers || !self.ticketTimes || !self.ticketNotes) {
        self.ticketNumbers = [NSMutableArray new];
        self.ticketNotes = [NSMutableArray new];
        self.ticketTimes = [NSMutableArray new];
    }

    [self.ticketNumbers addObject:ticket.number];
    [self.ticketTimes addObject:ticket.time];
    [self.ticketNotes addObject:ticket.notes];

    [self.tableView reloadData];
    [self saveData];
}

-(void)createTicket:(id)ticket{
    NewTicketViewController *newTicket = ticket;
    self.passSelectedTicket = newTicket;
    NSLog(@"2nd delegate %@", newTicket);

    [self ticketObjectAsPropertyList:newTicket];
}

-(NSDictionary *)ticketObjectAsPropertyList:(NewTicketViewController *)newTicket{

    NSLog(@"TicketObjectAsProp %@", newTicket.arrivedText);

    NSDictionary *dictionary = @{TICKET_NUMBER : newTicket.number,
                                 TICKET_ARRIVED_TIME : newTicket.arrivedText,
                                 TICKET_DEPARTED_TIME : newTicket.departedText,
                                 TICKET_COMPLETED_TIME : newTicket.completedText,
                                 TICKET_NOTE : newTicket.notes,
                                 TICKET_DATE : newTicket.date,
                                 TICKET_PART_NUMBER : newTicket.partNumber,
                                 TICKET_TIMESTAMP : newTicket.timeStamp};

    NSLog(@"Ticket Dictionary %@", dictionary);

    NSMutableArray *newTicketsAsPropertyLists = [[[NSUserDefaults standardUserDefaults] arrayForKey:NEW_TICKET_KEY] mutableCopy];

    if (!newTicketsAsPropertyLists) {
        newTicketsAsPropertyLists = [NSMutableArray new];
    }

    [[NSUserDefaults standardUserDefaults] setObject:newTicketsAsPropertyLists forKey:NEW_TICKET_KEY];
    [[NSUserDefaults  standardUserDefaults] synchronize];

    return dictionary;
}

-(void)saveData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:self.ticketNumbers forKey:TICKET_NUMBERS];
    [userDefaults setObject:self.ticketTimes forKey:TICKET_TIMES];
    [userDefaults setObject:self.ticketNotes forKey:TICKET_NOTES];
    [userDefaults synchronize];
}

-(void)loadData{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    self.ticketTimes = [[userDefaults objectForKey:TICKET_TIMES] mutableCopy];
    self.ticketNumbers = [[userDefaults objectForKey:TICKET_NUMBERS] mutableCopy];
    self.ticketNotes = [[userDefaults objectForKey:TICKET_NOTES] mutableCopy];
}
@end
