//
//  NoteTableViewController.m
//  NoteBookTableView
//
//  Created by 林子涵 on 2017/5/3.
//  Copyright © 2017年 Greathard. All rights reserved.
//

#import "NoteTableViewController.h"
#import "Note.h"
#import "NoteDetailController.h"

@interface NoteTableViewController ()
@property (nonatomic, strong) NSMutableArray <Note*> *notes;


@end

@implementation NoteTableViewController

// 回到此頁面時要重新整理資料 以防有新增修改

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

//
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 第一筆假資料
    Note * noteOne = [Note new];
    noteOne.title = @"晚上要買蛋";
    noteOne.body = @"應該要買個兩盒";
    noteOne.createdAt =  [NSDate date];
    
    // 第二筆假資料
    Note * noteTwo = [Note new];
    noteTwo.title = @"記得喝高蛋白";
    noteTwo.body = @"應該要買個兩盒";
    noteTwo.createdAt =  [NSDate date];
    
    // 第三筆假資料
    Note * noteThree = [Note new];
    noteThree.title = @"噢是噢";
    noteThree.body = @"真的假的";
    noteThree.createdAt =  [NSDate date];
    
    //假資料放入陣列中
    self.notes = [NSMutableArray arrayWithArray:@[noteOne, noteTwo, noteThree]];
    
    
    
    // 準備一個『新增』按鈕到導覽列的右邊
    // 準備按鈕
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(goToInsertNotePage)];
    // 將按鈕放在右邊items 和 item 不一樣
    self.navigationItem.rightBarButtonItems = @[item];
    // 改標題
    self.navigationItem.title = @"所有的筆記";
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - bar上的動作方法
//  按下uibarbutton right的動作
-(void)goToInsertNotePage{
    // 顯示下一頁
    // 準備下一頁
    NoteDetailController * detailVC =[self.storyboard instantiateViewControllerWithIdentifier:@"jkNoteDetailController"];
    
    
    /*    將此頁的note 陣列之位址傳入下一頁面的新物件       */
    detailVC.pppNotes = self.notes;
    detailVC.editType = 0;      //新增
    // 顯示
    [self.navigationController pushViewController:detailVC animated:YES];

}


#pragma mark - Tableview DataSource及Delegate方法
//有幾個section (刪除可 預設1個section)

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}
// 各section中有幾個row
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.notes.count;
}
// cell中每一列(row)讀取其中資料的函式 會依據numberOfRowsInSection的數字重複取
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jkTableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = self.notes[indexPath.row].title;
    // Configure the cell...
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


#pragma mark TableView 列表上 動作的函式
// 插入新的 或 刪除cell
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 必須先刪除原始資料才能刪除row (此行得自己加)
        [self.notes removeObjectAtIndex:indexPath.row];
        // 刪除row
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
#pragma mark  當tableview Cell被點選
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //準備下一頁
    NoteDetailController * existedNoteDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"jkNoteDetailController"];
    
    /*    將此頁的note 陣列之位址傳入下一頁面的新物件       */
    existedNoteDetail.pppNotes = self.notes;
    // 下一頁的
    existedNoteDetail.titleString = self.notes[indexPath.row].title;
    existedNoteDetail.bodyString = self.notes[indexPath.row].body;
    existedNoteDetail.pos = (int)indexPath.row;
    
    existedNoteDetail.editType = 1;     // 修改
    // 顯示
    [self.navigationController pushViewController:existedNoteDetail animated:YES];
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
