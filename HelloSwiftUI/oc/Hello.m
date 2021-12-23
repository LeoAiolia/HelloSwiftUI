//
//  Hello.m
//  HelloSwiftUI
//
//  Created by dev-yxr on 2021/12/23.
//

#import "Hello.h"


#define Dic(v1, v2, frmt, ...) @{@"key1":v1, @"key2":v2}


@implementation Hello

- (void)test {
    NSDictionary* dic = Dic(@"1", @"2", @"3");
    NSLog(dic);
}

@end
