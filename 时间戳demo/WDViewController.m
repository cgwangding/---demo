//
//  WDViewController.m
//  时间戳demo
//
//  Created by 和易讯 on 14-7-30.
//  Copyright (c) 2014年 heyixun-wd. All rights reserved.
//

#import "WDViewController.h"

@interface WDViewController ()

@end

@implementation WDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
//    NSDate *date1 = [NSDate dateWithTimeIntervalSince1970:1406692535];
//    NSLog(@"%@",date1);
    NSString* timeStr = @"2011-01-26 17:40:50";
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    //设置时区,这个对于时间的处理有时很重要
    //例如你在国内发布信息,用户在国外的另一个时区,你想让用户看到正确的发布时间就得注意时区设置,时间的换算.
    //例如你发布的时间为2010-01-26 17:40:50,那么在英国爱尔兰那边用户看到的时间应该是多少呢?
    //他们与我们有7个小时的时差,所以他们那还没到这个时间呢...那就是把未来的事做了
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    
    NSDate *date = [formatter dateFromString:timeStr];
    NSLog(@"date>>>%@",date);
    
    NSDate *nowDate = [NSDate date];
    NSLog(@"nowDate>>>%@",nowDate);
    
    NSString *nowTimeStr = [formatter stringFromDate:nowDate];
    NSLog(@"nowTimeStr>>>%@",nowTimeStr);
    
    //时间转时间戳的方法:
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[nowDate timeIntervalSince1970]];
    NSLog(@"timeSp:%@",timeSp); //时间戳的值
    //时间戳转时间的方法,
    NSDate *confromTimesp = [NSDate dateWithTimeIntervalSince1970:1296035591];
    NSLog(@"1296035591  = %@",confromTimesp);
    NSString *confromTimespStr = [formatter stringFromDate:confromTimesp];
    NSLog(@"confromTimespStr =  %@",confromTimespStr);
        
    
    
    //获取当地时间
    NSDate *date2 = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    
    NSInteger interval = [zone secondsFromGMTForDate: date2];
    
    NSDate *localeDate = [date2  dateByAddingTimeInterval: interval];
    
    NSLog(@"%@", localeDate);
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
