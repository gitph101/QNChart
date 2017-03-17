//
//  QNChartModel.h
//  QNChart
//
//  Created by 研究院01 on 17/3/15.
//  Copyright © 2017年 YanJiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QNChartModel : NSObject

//X坐标值
@property (copy, nonatomic) NSString *coordinateXValue;
//左侧Y坐标值
@property (copy, nonatomic) NSString *coordinateLeftYValue;
//右侧Y坐标值
@property (copy, nonatomic) NSString *coordinateRightYValue;

/**
 *  @author li_yong
 *
 *  构造函数
 *
 *  @param xValue X坐标值
 *  @param yValue Y坐标值
 *
 */
- (id)initWithXValue:(NSString *)xValue LeftYValue:(NSString *)leftYValue RightYValue:(NSString *)rightYValue;


@end
