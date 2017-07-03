//
//  NoteDetailController.m
//  NoteBookTableView
//
//  Created by 林子涵 on 2017/5/3.
//  Copyright © 2017年 Greathard. All rights reserved.
//

#import "NoteDetailController.h"
//#import "Note.h"
@interface NoteDetailController ()

@end

@implementation NoteDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //self.pppNotes = ;
    // 準備並加入save按鈕在導覽列
    if(self.editType ==0 ){
        UIBarButtonItem * saveBtn =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNewNote)];
        self.navigationItem.rightBarButtonItems = @[saveBtn];
    }else{
        UIBarButtonItem * saveBtn =[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveNote)];
        self.navigationItem.rightBarButtonItems = @[saveBtn];
        self.NoteDetailContent.text = self.bodyString;
        self.NoteDetailTitle.text = self.titleString;
    }
    
//    // 將資料顯示在頁面上

}

//
-(void) saveNewNote{
    Note *aNote = [Note new];
    // 取得畫面上的文字
    aNote.title = self.NoteDetailTitle.text;
    aNote.body = self.NoteDetailContent.text;
    aNote.createdAt = [NSDate date];
    // 將文字存到 aNote裏
    [self.pppNotes addObject:aNote];
    
    
    // 回上一頁
    [self. navigationController popViewControllerAnimated:YES];
}

-(void)saveNote{
    // 宣告暫用note物件
    Note * saveExistedNote = [Note new];
    // 將頁面內容放入暫用note物件
    saveExistedNote.title= self.NoteDetailTitle.text;
    saveExistedNote.body = self.NoteDetailContent.text;
    saveExistedNote.createdAt = [NSDate date];
    // 將原本陣列要修該之note以暫存物件取代
    [self.pppNotes replaceObjectAtIndex:(int)self.pos withObject:saveExistedNote];
    
    // 回上一頁
    [self. navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
