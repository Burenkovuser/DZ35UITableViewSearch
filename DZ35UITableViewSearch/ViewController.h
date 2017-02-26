//
//  ViewController.h
//  DZ35UITableViewSearch
//
//  Created by Vasilii on 22.02.17.
//  Copyright © 2017 Vasilii Burenkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UISearchBarDelegate>

@property(weak, nonatomic) IBOutlet UISearchBar* searchBar;//связыаем серчбар чтобы брать текст

@end

