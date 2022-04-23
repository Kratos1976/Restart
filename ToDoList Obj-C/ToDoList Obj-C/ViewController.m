//
//  ViewController.m
//  ToDoList Obj-C
//
//  Created by admin on 18/4/22.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@property (nonatomic) NSMutableArray *items;

@property (nonatomic) NSArray *categories;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.items = @[@{@"name" : @"Take out the trash", @"category" : @"Home"}, @{@"name" : @"Go Shopping", @"category" : @"Home"}, @{@"name" : @"Go to work to App Boys", @"category" : @"Home"}, @{@"name" : @"Reply to that important email", @"category" : @"Work"}].mutableCopy;
    self.categories = @[@"Home", @"Work"];
    self.navigationItem.title = @"To-do list";

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Adding items
- (void)addNewItem:(UIBarButtonItem *)sender {
    UIAlertController *alert = [UIAlertController
                alertControllerWithTitle:@"New to-do item"
                                message:@"Please enter the name of the new to-do item"
                          preferredStyle:UIAlertControllerStyleAlert];

    [alert addTextFieldWithConfigurationHandler:^(UITextField * textField) {
        textField.placeholder = @"Put your task";
        textField.secureTextEntry = NO;
    }];

    UIAlertAction *addItemButton = [UIAlertAction
                        actionWithTitle:@"Add Item"
                                  style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {
                                    UITextField *itemNameField = alert.textFields[0];
                                    NSString *itemName = itemNameField.text;
                                    NSDictionary *item = @{@"name" : itemName, @"category" : @"Home"};
                                    [self.items addObject:item];
                                    NSInteger numHomeItems = [self numberOfItemsInCategory:@"Home"];
                                    [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:numHomeItems - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
                                }];

    UIAlertAction *cancelButton = [UIAlertAction
                            actionWithTitle:@"Cancel"
                                      style:UIAlertActionStyleCancel
                                    handler:^(UIAlertAction * action) {
                                       //Handle no, thanks button
                                    }];

    [alert addAction:addItemButton];
    [alert addAction:cancelButton];

    [self presentViewController:alert animated:YES completion:nil];
}


#pragma mark - Datasource helper methods

- (NSArray *)itemsInCategory:(NSString *)targetCategory {
    NSPredicate *matchingPredicate = [NSPredicate predicateWithFormat:@"category == %@", targetCategory];
    NSArray *categoryItems = [self.items filteredArrayUsingPredicate:matchingPredicate];

    return categoryItems;
}

- (NSInteger)numberOfItemsInCategory: (NSString *)targetCategory {
    return [self itemsInCategory:targetCategory].count;
}

- (NSDictionary *)itemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *category = self.categories[indexPath.section];
    NSArray *categoryItems = [self itemsInCategory:category];
    NSDictionary *item = categoryItems[indexPath.row];

    return item;
}

- (NSInteger)itemIndexForIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *items = [self itemAtIndexPath:indexPath];
    NSInteger index = [self.items indexOfObjectIdenticalTo:items];

    return  index;
}

-(void)removeItemAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = [self itemIndexForIndexPath:indexPath];
    [self.items removeObjectAtIndex:index];

}

#pragma mark - Table view datasource
- (NSInteger)numberOfSectionsInTable:(UITableView *)tableview {
    return self.categories.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self numberOfItemsInCategory:self.categories[section]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"TodoItemRow";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSDictionary *item = [self itemAtIndexPath:indexPath];
    cell.textLabel.text = item[@"name"];

    if ([item[@"completed"] boolValue]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.categories[section];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = [self itemIndexForIndexPath:indexPath];

    NSMutableDictionary *item = [self.items[index] mutableCopy];
    BOOL completed = [item[@"completed"] boolValue];
    item[@"completed"] = @(!completed);

    self.items[index] = item;

    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = ([item[@"completed"] boolValue]) ? UITableViewCellAccessoryCheckmark : UITableViewCellAccessoryNone;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
