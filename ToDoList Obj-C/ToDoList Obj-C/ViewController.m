//
//  ViewController.m
//  ToDoList Obj-C
//
//  Created by admin on 18/4/22.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.items = @[@{@"name" : @"Take out the trash", @"category" : @"Home"}, @{@"name" : @"Go Shopping", @"category" : @"Home"}, @{@"name" : @"Go to work to App Boys", @"category" : @"Home"}].mutableCopy;
    self.navigationItem.title = @"To-do list";
}

#pragma mark - Table view datasource
- (NSInteger)numberOfSectionsInTable:(UITableView *)tableview {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TodoItemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *item = self.items[indexPath.row];
    cell.textLabel.text = item[@"name"];
    return cell;
}

@end
