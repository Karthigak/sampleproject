//
//  AppDelegate.h
//  sampleproject
//
//  Created by OBS_Macmini on 9/17/15.
//  Copyright (c) 2015 OptisolBusinessSolutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    CMMotionManager *motionmanager;
}
@property (readonly) CMMotionManager *motionManager;
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIViewController *viewController;


@end

