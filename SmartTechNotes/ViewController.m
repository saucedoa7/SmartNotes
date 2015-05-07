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
    ticket.delegate = self;
}

#pragma mark Helpers

-(void)addNewTicket:(TicketLineCell *)ticket{

    if (!self.ticketNumbers || !self.ticketTimes || !self.ticketNotes) {
        self.ticketNumbers = [NSMutableArray new];
        self.ticketNotes = [NSMutableArray new];
        self.ticketTimes = [NSMutableArray new];
    }

    [self.ticketNumbers addObject:ticket.ticketNumber];
    [self.ticketTimes addObject:ticket.ticketTime];
    [self.ticketNotes addObject:ticket.ticketNotes];

    [self.tableView reloadData];
    [self saveData];
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
