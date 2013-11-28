//
//  SecondViewController.m
//  ChurchApp
//
//  Created by Jhaybie on 11/18/13.
//  Copyright (c) 2013 Jhaybie. All rights reserved.
//

#import "SecondViewController.h"

@interface TestEvent : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *details;
@end

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITableView *eventTableView;
@end

@implementation TestEvent
@end


@implementation SecondViewController
@synthesize eventTableView;

NSMutableArray *testArray;

- (void)viewDidLoad
{
    [super viewDidLoad];
    testArray = [[NSMutableArray alloc] init];
    TestEvent *tempEvent1 = [[TestEvent alloc] init];
    TestEvent *tempEvent2 = [[TestEvent alloc] init];

    tempEvent1.name = @"Anti-Abortion Rummage Sale";
    tempEvent1.details = @"Blah blah blah blah blah... blah.";

    tempEvent2.name = @"Anti-Gay Karaoke Night";
    tempEvent2.details = @"Blah blah blah blah blah... blah.";

    [testArray addObject:tempEvent1];
    [testArray addObject:tempEvent2];
    [eventTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"xxx"];
    TestEvent *tempEvent = testArray[indexPath.row];
    cell.textLabel.text = tempEvent.name;
    cell.detailTextLabel.text = tempEvent.details;
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [testArray count];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Second_DetailViewController *sdvc = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetail"];
    [self.navigationController pushViewController:sdvc animated:YES];
}

@end
