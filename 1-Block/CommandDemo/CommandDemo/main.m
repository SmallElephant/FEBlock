//
//  main.m
//  CommandDemo
//
//  Created by keso on 2017/7/20.
//  Copyright © 2017年 FlyElephant. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef int(^SumBlock)(int a, int b);

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
//        buttonCallback(10);
//        setButtonCallBacks();
        
        int (^sumBlock)(int a,int b) = ^(int a,int b) {
            return a + b;
        };
        
        int result = sumBlock(10, 20);
        
        SumBlock block2 = ^(int a,int b) {
            return a + b;
        };
        
        int result2 = block2(10, 30);

        printf("计算结果:%d\n",result);
        printf("计算结果:%d\n",result2);
        
        int a = 10;
        int b = 20;
        void (^block3)(void) = ^ {
            printf("a = %d  b = %d\n",a,b);
        };
        
        a = 30;
        b = 40;
        block3();
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@"1",@"2",@"3", nil];
        void (^block4)(void) = ^ {
            NSLog(@"数组 = %@",arr[1]);
        };
        arr[1] = @"20";
        block4();
        
        
        __block int val = 0;
        void (^block5)(void) = [^{val = val + 1;  NSLog(@"执行结果:%d",val);} copy];
        val = val + 1;
        
        block5();
        
        NSLog(@"执行结果:%d",val);
        
        
    }
    return 0;
}
