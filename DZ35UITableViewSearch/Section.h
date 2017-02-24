//
//  Section.h
//  DZ35UITableViewSearch
//
//  Created by Vasilii on 24.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property(strong, nonatomic) NSString* sectionName;
@property(strong, nonatomic) NSMutableArray* itemArray;

@end
