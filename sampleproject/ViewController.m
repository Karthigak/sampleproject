//
//  ViewController.m
//  sampleproject
//
//  Created by OBS_Macmini on 9/17/15.
//  Copyright (c) 2015 OptisolBusinessSolutions. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:animated];
    
    [self startMyMotionDetect];
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    
    [super viewDidDisappear:animated];
    
    [self.motionManager stopAccelerometerUpdates];
    
}
- (CMMotionManager *)motionManager
{
    CMMotionManager *motionManager = nil;
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    
    if ([appDelegate respondsToSelector:@selector(motionManager)]) {
        motionManager = [appDelegate motionManager];
    }
    
    return motionManager;
}
- (void)startMyMotionDetect
{
    
    __block float stepMoveFactor = 15;
    
    [self.motionManager
     startAccelerometerUpdatesToQueue:[[NSOperationQueue alloc] init]
     withHandler:^(CMAccelerometerData *data, NSError *error)
     {
         
         dispatch_async(dispatch_get_main_queue(),
                        ^{
                            
                            CGRect rect = self.moveView.frame;
                            
                            float movetoX = rect.origin.x + (data.acceleration.x * stepMoveFactor);
                            float maxX = self.view.frame.size.width - rect.size.width;
                            
                            float movetoY = (rect.origin.y + rect.size.height)
                            - (data.acceleration.y * stepMoveFactor);
                            
                            float maxY = self.view.frame.size.height;
                            
                            if ( movetoX > 0 && movetoX < maxX) {
                                rect.origin.x += (data.acceleration.x * stepMoveFactor);
                            };
                            
                            if ( movetoY > 0 && movetoY < maxY
                               ) {
                                rect.origin.y -= (data.acceleration.y * stepMoveFactor);
                            };
                            
                            [UIView animateWithDuration:0 delay:0
                                                options:0
                                             animations:
                             ^{
                                 self.moveView.frame = rect;
                             }
                                             completion:nil
                             ];
                            
                        }
                        );
     }
     ];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
