//
//  Student.h
//  DZ35UITableViewSearch
//
//  Created by Vasilii on 22.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject

@property(strong, nonatomic) NSString* name;
@property(strong, nonatomic) NSString* surname;
@property(strong, nonatomic) NSDate* birtday;

+(Student*) randomSudent;

@end
