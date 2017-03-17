//
//  QNChartModel.h
//  QNChart
//
//  Created by 研究院01 on 17/3/15.
//  Copyright © 2017年 YanJiuYuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QNChartInfo : NSObject

///** 一个图表的颜色*/
//@property (nonatomic, strong) UIColor * oneChartColor;
///** 一个图表的颜色*/
//@property (nonatomic, strong) UIColor * twoChartColor;
/** 图表标题*/
@property (nonatomic, strong) NSString * chartTitle;
/** 图标下方描述信息一*/
@property (nonatomic, strong) NSString * oneChartDescription;
/** 图标下方描述信息二*/
@property (nonatomic, strong) NSString * twoChartDescription;
/** 单位*/
@property (nonatomic, strong) NSString * leftUnitInfo;
/** 单位*/
@property (nonatomic, strong) NSString * rightUnitInfo;

- (id)initWithInfoDic:(NSDictionary *)infoDic;

@end
