//
//  MMExampleDrawerVisualStateManager.h
//  InformationApp
//
//  Created by DengWuPing on 14-4-9.
//  Copyright (c) 2014年 DengWuPing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MMDrawerVisualState.h"

typedef NS_ENUM(NSInteger, MMDrawerAnimationType){
    MMDrawerAnimationTypeNone,
    MMDrawerAnimationTypeSlide,
    MMDrawerAnimationTypeSlideAndScale,
    MMDrawerAnimationTypeSwingingDoor,
    MMDrawerAnimationTypeParallax,
};

@interface MMExampleDrawerVisualStateManager : NSObject

@property (nonatomic,assign) MMDrawerAnimationType leftDrawerAnimationType;
@property (nonatomic,assign) MMDrawerAnimationType rightDrawerAnimationType;

+ (MMExampleDrawerVisualStateManager *)sharedManager;

-(MMDrawerControllerDrawerVisualStateBlock)drawerVisualStateBlockForDrawerSide:(MMDrawerSide)drawerSide;

@end

