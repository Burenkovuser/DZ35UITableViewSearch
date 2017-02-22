//
//  ViewController.m
//  DZ35UITableViewSearch
//
//  Created by Vasilii on 22.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()

@property(strong,nonatomic) NSArray* sectionArray;
@property(strong, nonatomic) NSArray* studentArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray* array = [NSMutableArray array];
    
    for (int i = 0; i < arc4random()%1000; i++) {
        Student* student = [Student randomSudent];
        [array addObject:student];
    }
    self.studentArray = array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.studentArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* identifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    Student* student = [self.studentArray objectAtIndex:indexPath.row];
    NSDateFormatter* dateFormater = [[NSDateFormatter alloc] init];
    [dateFormater setDateFormat:@"dd.MM.yyyy"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", student.name, student.surname];
    cell.detailTextLabel.text = [dateFormater stringFromDate:student.birtday];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
