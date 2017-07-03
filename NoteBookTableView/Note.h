//
//  Note.h
//  NoteBookTableView
//
//  Created by 林子涵 on 2017/5/3.
//  Copyright © 2017年 Greathard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Note : NSObject
// 標題
@property (nonatomic, strong) NSString * title;
// 內文
@property (nonatomic, strong) NSString * body;
// 建立時間
@property (nonatomic, strong) NSDate * createdAt;

@end
