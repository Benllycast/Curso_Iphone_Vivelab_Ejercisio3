//
//  ViewController3.m
//  Ejercicio3
//
//  Created by Jonathan Pacheco on 12/21/14.
//  Copyright (c) 2014 Jonathan Pacheco. All rights reserved.
//

#import "ViewController3.h"

@interface ViewController3 ()<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic, strong) NSMutableArray *filterArray;
@property (nonatomic, strong) NSArray        *namesArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.namesArray = @[@"Jonathan", @"Jose", @"Andrea", @"Laura", @"Pepito", @"Josefa"];
    // Crea un mutable array a partir de un array
    self.filterArray = [NSMutableArray arrayWithArray:self.namesArray];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapGestureRecognizerAction:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Title"
                                                    message:@"This is a message"
                                                   delegate:nil
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"Ok", nil];
    [alert show];
}

- (IBAction)longPressAction:(id)sender {
//    UIActionSheet * sheet = [[UIActionSheet alloc] initWithTitle:@"Title"
//                                                        delegate:nil
//                                               cancelButtonTitle:@"Cancel"
//                                          destructiveButtonTitle:@"Destructive"
//                                               otherButtonTitles:@"Button1", @"button2", nil];
//    [sheet showInView:self.view];
    NSLog(@"Muestrame cuantas veces se ejecuta");
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.filterArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = self.filterArray[indexPath.row];
    return cell;
}

#pragma mark - table view delegate

#pragma mark - Search bar delegate

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length > 0) {
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchText];
        self.filterArray = [NSMutableArray arrayWithArray:[self.namesArray filteredArrayUsingPredicate:predicate]];
    } else {
        self.filterArray = [NSMutableArray arrayWithArray:self.namesArray];
    }
    [self.tableView reloadData];
}

@end
