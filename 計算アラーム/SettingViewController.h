//
//  SettingViewController.h
//  計算アラーム
//
//  Created by 優輝 高橋 on 2013/10/09.
//  Copyright (c) 2013年 com.litech. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "keisanViewController.h"
@interface SettingViewController : UIViewController

<keisanViewControllerDelegate>
{

    IBOutlet UIDatePicker *dp;
    NSDate *alarm;
    
}

- (IBAction)changeValue:(id)sender;
-(IBAction)set:(id)sender;

@end
