//
//  NewTicketViewController.m
//  SmartTechNotes
//
//  Created by Albert Saucedo on 5/1/15.
//  Copyright (c) 2015 Albert Saucedo. All rights reserved.
//

#import "NewTicketViewController.h"

@interface NewTicketViewController ()<UITextFieldDelegate>
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

}

-(NSString *)returnDate{
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH:mm"];
    self.date = [dateFormatter stringFromDate:currDate];

    return self.date;
}

-(void) returnKB{
    [self.txtTicketNumber resignFirstResponder];
    [self.txtNotes resignFirstResponder];
    [self.txtPartNumber resignFirstResponder];
}


- (IBAction)btnDeparted:(UIButton *)sender {
    self.date = [self returnDate];

    [sender setTitle:self.date forState:UIControlStateNormal];
}

- (IBAction)btnArrived:(UIButton *)sender {
    self.date = [self returnDate];

    [sender setTitle:self.date forState:UIControlStateNormal];
    
}

- (IBAction)btnCompleted:(UIButton *)sender {
    self.date = [self returnDate];

    [sender setTitle:self.date forState:UIControlStateNormal];
}

-(void)KBDidShow{

    if ([self.txtPartNumber isEditing]) {
        [UIView animateWithDuration:.3 animations:^{

            self.view.transform = CGAffineTransformMakeTranslation(0, -75);

        } completion:^(BOOL finished) {
            nil;
        }];
    }
}

-(void)KBDidHide{

    if ([self.txtPartNumber isEditing]) {
        [UIView animateWithDuration:.3 animations:^{

            self.view.transform = CGAffineTransformMakeTranslation(0, 0);

        } completion:^(BOOL finished) {
            nil;
        }];
    }
}
@end
