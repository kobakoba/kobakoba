//
//  keisanViewController.m
//  計算アラーム
//
//  Created by 優輝 高橋 on 2013/12/22.
//  Copyright (c) 2013年 com.litech. All rights reserved.
//

#import "keisanViewController.h"
#import <AudioToolbox/AudioServices.h>

@interface keisanViewController ()

@end

@implementation keisanViewController

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
    //AudioServicesPlaySystemSound(1014);
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"su551-2" ofType:@"mp3"];
    url = [NSURL fileURLWithPath:path];
    audio = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [audio prepareToPlay];
    [audio play];
    audio.numberOfLoops = -1;
    
    
    number1 = arc4random_uniform(10) + 10;
    label1.text=[NSString stringWithFormat:@"%d",number1];
    
    
    
    
    number2 = random() % 15+ 1;
    label2.text=[NSString stringWithFormat:@"%d",number2];
    
    NSLog(@"%d",number1);
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count) userInfo:nil repeats:YES];
    
    
    timelimitLabel.text = @" 1:00";
    countDown = 1 * 60;  //残り秒数
}

// １秒おきに実行されるメソッド
- (void)count
{
    NSLog(@"カウントダウンするよ");
    countDown = countDown - 1;
    timelimitLabel.text = [NSString stringWithFormat:@"%2d:%2d",countDown/60,countDown%60];
    
    /* -- 時間切れ -- */
    if(countDown == 0){
        [audio pause];
        [self resetTime];
        
        //アラートの表示
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"時間切れ" message:@"また頑張れ" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
        //画面を戻る
        [self dismissViewControllerAnimated:YES completion:^{
            [self.delegate dismiss];
        }];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)bt1{
    number3=number3*10+1;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt2{
    number3=number3*10+2;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt3{
    number3=number3*10+3;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt4{
    number3=number3*10+4;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt5{
    number3=number3*10+5;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt6{
    number3=number3*10+6;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt7{
    number3=number3*10+7;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt8{
    number3=number3*10+8;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt9{
    number3=number3*10+9;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)bt0{
    number3=number3*10+0;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}
-(IBAction)clear{
    number3=0;
    label3.text=[NSString stringWithFormat:@"%d",number3];
}

-(IBAction)ok{
    
    seikainumber = number1 * number2;
    
    if(seikainumber==number3){
        /* -- 正解だったら -- */
        [timer invalidate];
        [self performSelector:@selector(move)withObject:nil afterDelay:0.1];
        
    } else {
        
        /* -- 計算ミスしたとき -- */
        number1 = arc4random_uniform(10) + 10;
        label1.text=[NSString stringWithFormat:@"%d",number1];
        number2 = random() % 15+ 1;
        label2.text=[NSString stringWithFormat:@"%d",number2];
        label4.text=@"ざんねん！";
        number3=0;
        label3.text=[NSString stringWithFormat:@"%d",number3];
        
    }
    
    [self performSelector:@selector(clearLabel) withObject:nil afterDelay:1.5];
    
}

- (void)clearLabel{
    label4.text = @"";
}



-(void)move{
    if (audio.playing) {
        [audio pause];//音楽とめる
    }
    [self resetTime];
    
    [self performSegueWithIdentifier:@"next"sender:self];

}

- (void)resetTime
{
    /* -- 起きる時間として設定されているデータをリセット -- */
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud removeObjectForKey:@"time"];//起きれたら、「time」キーで保存されている時刻をリセット
}







@end