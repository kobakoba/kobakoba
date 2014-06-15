//
//  SettingViewController.m
//  計算アラーム
//
//  Created by 優輝 高橋 on 2013/10/09.
//  Copyright (c) 2013年 com.litech. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()

@end

@implementation SettingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    dp.center = self.view.center;
    dp.minuteInterval = 1;
    //dp.datePickerMode = UIDatePickerModeTime;
    //日本語に変換
    dp.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ja_JP"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 呼ばれるhogeメソッド

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    keisanViewController *kvc = segue.destinationViewController;
    kvc.delegate = self;
}

- (void)dismiss
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


- (IBAction)changeValue:(id)sender
{    
    //「setDatePicker」の日付データを「viewLabelFormatter」フォーマットで
    //ラベル「viewLabel」のテキストとして設定
    NSDateFormatter *viewLabelFormatter = [[NSDateFormatter alloc] init];
    viewLabelFormatter.dateFormat = @"yyyy/MM/dd HH:mm";
    NSString *timeString  = [viewLabelFormatter stringFromDate:dp.date];
    NSLog(@"%@", timeString);
    
    
    long getDate = floor([dp.date timeIntervalSince1970]);
    getDate -= (getDate % 60);
    [dp setDate:[NSDate dateWithTimeIntervalSince1970:getDate]];
    
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:dp.date forKey:@"time"];
    [ud synchronize];
    NSLog(@"call changevalue %@",dp.date);
}


-(IBAction)set:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
