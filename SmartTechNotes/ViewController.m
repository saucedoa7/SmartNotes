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

    self.ticketNumbers = [NSMutableArray arrayWithObjects:@"3050000", nil];
    self.ticketTimes = [NSMutableArray arrayWithObjects:@"0:00 - 0:00 - 0:00", nil];
    self.ticketNotes = [NSMutableArray arrayWithObjects:@"TEst tes tes tttestttes", nil];

}

-(void)viewWillAppear:(BOOL)animated{
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

-(void)addNewTicket:(TicketLineCell *)ticket{

    if (!self.ticketNumbers || !self.ticketTimes || !self.ticketNotes) {
        self.ticketNumbers = [NSMutableArray new];
        self.ticketNotes = [NSMutableArray new];
        self.ticketTimes = [NSMutableArray new];
    }

    NSLog(@"le Ticket %@", ticket.ticketNumber);

    [self.ticketNumbers addObject:ticket.ticketNumber];
    [self.ticketTimes addObject:ticket.ticketTime];
    [self.ticketNotes addObject:ticket.ticketNotes];

    NSLog(@"VC Ticket Numbers, %@", self.ticketNumbers);
    NSLog(@"VC Ticket Times, %@", self.ticketTimes);
    NSLog(@"VC Ticket Notes, %@", self.ticketNotes);

    [self.tableView reloadData];

}
@end
