//
//  PESingleDatePickerView.m
//  PEChargingStation
//
//  Created by zhaolei6451 on 16/5/27.
//  Copyright © 2016年 zhaolei6451. All rights reserved.
//

#import "PESingleDatePickerView.h"
@interface PESingleDatePickerView()
{
    UIControl* coverControl;
}
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UIDatePicker *myPickerView;

@end
@implementation PESingleDatePickerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)awakeFromNib
{
    if (isEnglishVersion) {
        [_cancelBtn setTitle:@"Cancel" forState:UIControlStateNormal];
        [_confirmBtn setTitle:@"Confirm" forState:UIControlStateNormal];
    }
    
    _cancelBtn.layer.borderColor = [UIColor darkTextColor].CGColor;
    _cancelBtn.layer.borderWidth = .5;
    _cancelBtn.layer.masksToBounds = YES;
    
    _confirmBtn.layer.borderColor = [UIColor darkTextColor].CGColor;
    _confirmBtn.layer.borderWidth = .5;
    _confirmBtn.layer.masksToBounds = YES;
    
    coverControl = [[UIControl alloc]init];
    coverControl.frame = [[UIScreen mainScreen]bounds];
    coverControl.alpha = 0;
    coverControl.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.2];
    [coverControl addTarget:self action:@selector(hide) forControlEvents:UIControlEventTouchUpInside];
    [[[UIApplication sharedApplication]keyWindow] addSubview:coverControl];
    
    self.center = coverControl.center;
    self.layer.borderColor = [UIColor darkTextColor].CGColor;
    self.layer.borderWidth = .5;
    self.layer.masksToBounds = YES;
    
    [coverControl addSubview:self];
    
}
-(void)show
{
    [UIView animateWithDuration:.5 animations:^{
        coverControl.alpha = 1;
    }];
}
-(void)hide
{
    [UIView animateWithDuration:.5 animations:^{
        coverControl.alpha = 0;
    }];
}
- (IBAction)cancelAction:(id)sender {
    [self hide];
}
- (IBAction)confirmAction:(id)sender {
    [self hide];
    if (_returnDate) {
        _returnDate(_myPickerView.date);
    }
   
}
@end
