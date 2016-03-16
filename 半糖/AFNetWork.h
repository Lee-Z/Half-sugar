//
//  AFNetWork.h
//  半糖
//
//  Created by zyx on 16/3/14.
//  Copyright © 2016年 zyx. All rights reserved.
//

#import <Foundation/Foundation.h>


// 1.
typedef void (^NetRequestBlock)(id info);



@interface AFNetWork : NSObject

// 2.
@property (nonatomic, copy) NetRequestBlock block;

- (void) reach;

- (void) getWithURL:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary;
- (void) postWithURL:(NSString *)urlString WithParmeters:(NSDictionary *)dictionary;



@end
