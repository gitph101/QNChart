//
//  AppDelegate.h
//  QNChart
//
//  Created by 研究院01 on 17/3/15.
//  Copyright © 2017年 YanJiuYuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

