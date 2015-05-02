//
//  ViewController.m
//  SmartTechNotes
//
//  Created by Albert Saucedo on 4/30/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "ViewController.h"
#import "TicketLineCell.h"

@interface ViewController ()
@property NSArray *ticketNumbers;
@property NSArray *ticketTimes;
@property NSArray *ticketNotes;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.ticketNumbers = [NSArray arrayWithObjects:@"3050000", nil];
    self.ticketTimes = [NSArray arrayWithObjects:@"0:00 - 0:00 - 0:00", nil];
    self.ticketNotes = [NSArray arrayWithObjects:@"TEst tes tes tttestttes", nil];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
