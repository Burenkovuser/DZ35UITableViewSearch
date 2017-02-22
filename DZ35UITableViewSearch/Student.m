//
//  Student.m
//  DZ35UITableViewSearch
//
//  Created by Vasilii on 22.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import "Student.h"

@implementation Student

static NSString* firstName [] = {@"Ivan", @"Olga", @"Igor", @"Max", @"Sveta", @"Mila", @"Anna", @"Vika", @"Petr", @"Alex", @"Vasilii", @"Roman", @"Masha", @"Donald", @"Den", @"Fedor", @"Alla", @"Elena", @"Nicolay", @"Semen"};

static NSString* lastName [] = {@"Ivanov", @"Black", @"Petrov", @"White", @"Price",@"Green", @"Pinck", @"Apple", @"Yellow", @"Red", @"Grey", @"Silver", @"Gold", @"Orange", @"Tree", @"Free", @"Wood", @"Forest", @"Ligth", @"Sun"};

static int nameCount = 20;

+(Student*) randomSudent {
    NSDate* date = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    
    NSDateComponents* dateComponents = [calendar components:NSCalendarUnitYear fromDate:date];
    
    NSRange days = [calendar rangeOfUnit:NSCalendarUnitDay
                                  inUnit:NSCalendarUnitMonth
                                 forDate:date];
    [dateComponents setDay:arc4random() % days.length];
    
    NSRange months = [calendar rangeOfUnit:NSCalendarUnitMonth
                                    inUnit:NSCalendarUnitYear
                                   forDate:date];
    [dateComponents setMonth:arc4random() % months.length];
    
    [dateComponents setYear: [dateComponents year] - (arc4random() % 14 + 7)];
    
    Student* student = [[Student alloc] init];
    student.name = firstName[arc4random() % nameCount];
    student.surname = lastName[arc4random() % nameCount];
    student.birtday = [calendar dateFromComponents:dateComponents];
    
    return student;

}

@end
