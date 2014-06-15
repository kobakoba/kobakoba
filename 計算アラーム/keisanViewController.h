//
//  keisanViewController.h
//  計算アラーム
//
//  Created by 優輝 高橋 on 2013/12/22.
//  Copyright (c) 2013年 com.litech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@protocol keisanViewControllerDelegate <NSObject>

- (void)dismiss;

@end

@interface keisanViewController : UIViewController
{
    int number1;
    int number2;
    int number3;//答えを入力するところの数字
    
    int random1;
    int random2;
    
    int seikainumber;//正解の数字
    IBOutlet UILabel *label1;
     IBOutlet UILabel *label2;
     IBOutlet UILabel *label3;//答えを入力するところラベル
IBOutlet UILabel *label4;//はずれ表示するところラベル
    NSTimer *timer; 
    int countDown;  //残り秒数
    
    IBOutlet UILabel *timelimitLabel;  //時間制限を表示するラベル
    AVAudioPlayer *audio;
    NSURL *url;
    
}

-(IBAction)bt1;
-(IBAction)bt2;
-(IBAction)bt3;
-(IBAction)bt4;
-(IBAction)bt5;
-(IBAction)bt6;
-(IBAction)bt7;
-(IBAction)bt8;
-(IBAction)bt9;
-(IBAction)bt0;
-(IBAction)clear;
-(IBAction)ok;

@property (nonatomic, weak) id<keisanViewControllerDelegate> delegate;

@end
