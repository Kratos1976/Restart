//
//  ViewController.m
//  ToDoList Obj-C
//
//  Created by admin on 18/4/22.
//

#import "ViewController.h"

@interface ViewController ()<UIAlertViewDelegate>

@property (nonatomic) NSMutableArray *items;

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.items = @[@{@"name" : @"Take out the trash", @"category" : @"Home"}, @{@"name" : @"Go Shopping", @"category" : @"Home"}, @{@"name" : @"Go to work to App Boys", @"category" : @"Home"}].mutableCopy;
    self.navigationItem.title = @"To-do list";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addNewItem:)];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Adding items

- (void)addNewItem:(UIBarButtonItem *)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"New to-do item" message:@"Please enter the name of the new to-do item" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Add item", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex:(NSInteger)buttonIndex {
    if (buttonIndex != alertView.cancelButtonIndex) {
        UITextField *itemNameField = [alertView textFieldAtIndex:0];
        NSString *itemName = itemNameField.text;
        NSDictionary *item = @{@"name" : itemName, @"category" : @"Home"};
        [self.items addObject:item];
        [self.tableView insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:self.items.count - 1 inSection:0]] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
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
