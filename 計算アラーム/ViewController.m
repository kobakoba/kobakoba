//
//  ViewController.m
//  計算アラーム
//
//  Created by 優輝 高橋 on 2013/08/24.
//  Copyright (c) 2013年 com.litech. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


-(void)viewDidAppear:(BOOL)animated{
    
    //タイマーを作動させる。1秒ごとに「kuraberu」メソッドを呼び出して、設定時間と源内時刻を比較している。
    myTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(kuraberu) userInfo:nil repeats:YES];
    
    //起きる時間の取得と表示
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    date2 = [ud objectForKey:@"time"];
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"MM月dd日 \n HH:mm:ss";
    NSString *str = [df stringFromDate:date2];
    myLabel.text=str;

}


-(void)kuraberu{
    
    //NSLog(@"data %@",data1);
    
    date1 = [NSDate date]; // 現在日付を取得
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"HH:mm:ss";
    NSString *str = [df stringFromDate:date1];
    label.text=str;
    NSLog(@"現在時刻%@",str);
    
    NSString *str2 = [df stringFromDate:date2];
        NSLog(@"設定時刻%@",str2);
    
    
    //label.text=[NSString stringWithFormat:@"%@",date1];
    
//    
//    
//    
//    if ([date1 isEqualToDate:date2]) { // yes
//        
//        NSLog(@"同じ日付です");
//        
//    } else { // no
//        
//        NSLog(@"異なる日付です");
//        
//        
//    }
//    
//    NSComparisonResult result = [date1 compare:date2];
//    switch(result){
//        case NSOrderedSame://一致したとき
//           NSLog(@"同じ時刻です)
//    }
    
                 
                 
                 //NSDate型を「yyyy/MM/dd」形式の文字列として取得する
                 NSDateFormatter *datecheck = [[NSDateFormatter alloc]init];
                 datecheck.dateFormat = @"HH:mm:ss";
                 
                 NSString *string1 = [datecheck stringFromDate:date1];
                 NSLog(@"dat1 = %@",string1);
                 
                 NSString *string2 = [datecheck stringFromDate:date2];
                 NSLog(@"dat2 = %@",string2);
                 
                 if ([string1 isEqualToString:string2]) {
                     NSLog(@"same");
                     [self performSegueWithIdentifier:@"gotogame" sender:self];//次の画面にいく
                     [self clearTime];//時間をリセット
                 }else{
                     NSLog(@"different");
                 }
    
}

- (void)clearTime
{
    [myTimer invalidate];//タイマーを止める
    myLabel.text = @"";//時間の表示をリセット
    NSLog(@"リセット！！");
}



- (void)viewDidLoad
{
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
