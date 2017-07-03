//
//  NoteDetailController.h
//  NoteBookTableView
//
//  Created by 林子涵 on 2017/5/3.
//  Copyright © 2017年 Greathard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Note.h"
@interface NoteDetailController : UIViewController
@property (nonatomic, strong) NSMutableArray * pppNotes;
//@property (nonatomic, strong) Note * noteInThis;
@property (weak, nonatomic) IBOutlet UITextField *NoteDetailTitle;
@property (weak, nonatomic) IBOutlet UITextView *NoteDetailContent;
@property NSString * titleString;
@property NSString * bodyString;
@property int * pos;
@property int editType;
@end
