//
//  PESingleDatePickerView.h
//  PEChargingStation
//
//  Created by zhaolei6451 on 16/5/27.
//  Copyright © 2016年 zhaolei6451. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PESingleDatePickerView : UIView
@property (nonatomic,strong)NSDate* selectDate;

@property (nonatomic,copy)void(^returnDate)(NSDate* );

-(void)show;
-(void)hide;
@end
