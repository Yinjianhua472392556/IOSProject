//
//  SUPCalendarViewController.m
//  SuperProject
//
//  Created by NShunJian on 2018/4/20.
//  Copyright © 2018年 superMan. All rights reserved.
// 

#import "SUPCalendarViewController.h"
#import "YBEventCalendar.h"

@interface SUPCalendarViewController ()
/** <#digest#> */
@property (weak, nonatomic) UIButton *addCalendarButton;

/** <#digest#> */
@property (weak, nonatomic) UIButton *deleteCalendarButton;

/** <#digest#> */
@property (weak, nonatomic) UILabel *desLabel;
@end

@implementation SUPCalendarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addViews];
}

- (void)addCalendar
{
    
    
    [YBEventCalendar createEventCalendarTitle:@"我在测试" location:@"北京" startDate:[[NSDate date] dateByAddingDays:1] endDate:[[NSDate date] dateByAddingDays:2] allDay:YES alarmArray:@[@"-86400", @"-43200", @"-21600", @"-3600"] completion:^(BOOL granted, NSError *error) {
 
        if (error) {
            [self.view makeToast:error.localizedDescription];
        }else {
            [MBProgressHUD showSuccess:@"添加成功" ToView:self.view];
        }
    }];
    
}


- (void)deleteCalendar
{
    
    
}

- (void)addViews
{
    [self.addCalendarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(100);
        make.left.offset(20);
        make.right.offset(-20);
        make.height.mas_equalTo(50);
        
    }];
    
    [self.deleteCalendarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.mas_equalTo(self.addCalendarButton.mas_bottom).offset(30);
        make.left.right.height.mas_equalTo(self.addCalendarButton);
        
    }];
    

    
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.right.offset(0);
        make.top.mas_equalTo(self.deleteCalendarButton.mas_bottom).offset(20);
    }];
    

    
}

- (UIButton *)addCalendarButton
{
    if(_addCalendarButton == nil)
    {
        SUPWeakSelf(self);
        UIButton *btn = [[UIButton alloc] init];
        [self.view addSubview:btn];
        _addCalendarButton = btn;
        [btn setTitle:@"增加日历事件" forState: UIControlStateNormal];
        [btn setTitleColor:[UIColor RandomColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor RandomColor] forState:UIControlStateNormal];
        
        [btn addActionHandler:^(NSInteger tag) {
            
            [weakself addCalendar];
        }];
        
    }
    return _addCalendarButton;
}


- (UIButton *)deleteCalendarButton
{
    if(_deleteCalendarButton == nil)
    {
        SUPWeakSelf(self);
        UIButton *btn = [[UIButton alloc] init];
        [self.view addSubview:btn];
        _deleteCalendarButton = btn;
        [btn setTitle:@"删除日历事件" forState: UIControlStateNormal];
        [btn setTitleColor:[UIColor RandomColor] forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor RandomColor] forState:UIControlStateNormal];
        
        [btn addActionHandler:^(NSInteger tag) {
            
            [weakself  deleteCalendar];
        }];
    }
    return _deleteCalendarButton;
}

- (UILabel *)desLabel
{
    if(_desLabel == nil)
    {
        UILabel *label = [UILabel new];
        [self.view addSubview:label];
        _desLabel = label;
        
        label.text = @"日历信息回县";
        label.numberOfLines = 0;
        label.backgroundColor = [UIColor RandomColor];
        label.textColor = [UIColor whiteColor];
        
    }
    return _desLabel;
}


#pragma mark - SUPNavUIBaseViewControllerDataSource

/** 导航条左边的按钮 */
- (UIImage *)SUPNavigationBarLeftButtonImage:(UIButton *)leftButton navigationBar:(SUPNavigationBar *)navigationBar
{
    [leftButton setImage:[UIImage imageNamed:@"NavgationBar_white_back"] forState:UIControlStateHighlighted];
    
    return [UIImage imageNamed:@"NavgationBar_blue_back"];
}

#pragma mark - SUPNavUIBaseViewControllerDelegate
/** 左边的按钮的点击 */
-(void)leftButtonEvent:(UIButton *)sender navigationBar:(SUPNavigationBar *)navigationBar
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
