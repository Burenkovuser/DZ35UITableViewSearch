//
//  ViewController.m
//  DZ35UITableViewSearch
//
//  Created by Vasilii on 22.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Section.h"

@interface ViewController ()

@property(strong,nonatomic) NSArray* sectionArray;
@property(strong, nonatomic) NSArray* studentArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray* array = [NSMutableArray array];
    
    
    for (int i = 0; i < arc4random()%100; i++) {
        Student* student = [Student randomSudent];
        [array addObject:student];
    }
    
    NSArray* sortedArray;
    sortedArray = [array sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSString* first = [self getMotheOfBirth:[(Student*) obj1 birtday]];
        NSString* second = [self getMotheOfBirth:[(Student*) obj2 birtday]];
        return [first compare:second];
    }];
    
    
    self.studentArray = array;
    
    self.sectionArray = [self generateSectionFromArray:self.studentArray];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Help Metods

-(NSString*) getMotheOfBirth: (NSDate*) birthDate {
    NSDateFormatter* dateformator = [[NSDateFormatter alloc] init];
    [dateformator setDateFormat:@"MMM"];
    NSString* stringResult = [dateformator stringFromDate:birthDate];
    return stringResult;
}

-(NSArray*) generateSectionFromArray:(NSArray*) array {
    NSMutableArray* sectionArray = [NSMutableArray array];
    
    NSString* correntMonth = nil;
    
    for (Student* student in array) {
        NSString* bitthMonthString = [self getMotheOfBirth:student.birtday];
        
        Section* section = nil;
        
        if (![correntMonth isEqualToString:bitthMonthString]) {
            section = [[Section alloc] init];
            section.sectionName = bitthMonthString;
            section.itemArray = [NSMutableArray array];
            correntMonth = bitthMonthString;
            [sectionArray addObject:section];
        } else {
            section = [sectionArray lastObject];
        }
        [section.itemArray addObject:student];
        
        NSArray* sortedArray;
        sortedArray = [section.itemArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            NSString* first = [(Student*) obj1 name];
            NSString* second = [(Student*) obj2 name];
            
            if (first == second) {
                return [first compare:second];
            } else {
                first = [(Student*) obj1 surname];
                second = [(Student*) obj2 surname];
                return [first compare:second];
            }
        }];
        section.itemArray = [NSMutableArray arrayWithArray:sortedArray];
    }
    return  sectionArray;
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
