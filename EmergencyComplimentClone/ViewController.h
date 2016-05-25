//
//  ViewController.h
//  EmergencyComplimentClone
//
//  Created by DetroitLabs on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property(nonatomic, strong)NSArray *compliments;
@property(nonatomic, strong)NSArray *uiColors;

- (void)createComplimentsArray;
- (void)createColorsArray;
- (UIColor *)selectRandomColor;
- (NSString *)selectRandomQuote;

- (void)updateUIWithRandomColorsAndString;
- (void)runTimer:(NSTimer *)timer;
- (NSTimer *)setupTimer;

@end

