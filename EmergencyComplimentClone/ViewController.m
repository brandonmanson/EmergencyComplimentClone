//
//  ViewController.m
//  EmergencyComplimentClone
//
//  Created by DetroitLabs on 5/24/16.
//  Copyright © 2016 DetroitLabs. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *complimentLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createColorsArray];
    [self createComplimentsArray];
    [self updateUIWithRandomColorsAndString];
    [self setupTimer];
    [self runTimer:(NSTimer *)[self setupTimer]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSTimer *)setupTimer {
    NSMethodSignature *timerMethodSignature = [self methodSignatureForSelector:@selector(updateUIWithRandomColorsAndString)];
    NSInvocation *invokeTimer = [NSInvocation invocationWithMethodSignature:timerMethodSignature];
    [invokeTimer setTarget:self];
    [invokeTimer setSelector:@selector(updateUIWithRandomColorsAndString)];
    
    NSTimer *timer = [NSTimer timerWithTimeInterval:arc4random_uniform(5)+7 invocation:invokeTimer repeats:YES];
    return timer;
}

- (void)createColorsArray {
    NSArray *colors = [[NSArray alloc]initWithObjects:[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor cyanColor], [UIColor yellowColor], [UIColor magentaColor], [UIColor orangeColor], [UIColor purpleColor], nil];
    _uiColors = colors;
}

- (void)createComplimentsArray {
    NSArray *compliments = [[NSArray alloc]initWithObjects:@"80% of motorcycle gangs think you’d be a delightful sidecar.", @"Your siblings are pissed that your photo is the star of your parent's mantle.", @"Everyone at the laundromat thinks you have the cutest underwear.", @"A 3rd tier cable network would totally create a television show about you.", @"You want the best for everyone...except Gary.", @"Everyone at sleepovers thought you were the bravest during thunderstorms.", @"Callers are intimidated by how funny your voicemail greeting is.", nil];
    _compliments = compliments;
}

- (UIColor *)selectRandomColor {
    UIColor *color;
    if ([_uiColors count] > 0) {
        color = _uiColors[arc4random_uniform((uint32_t)[_uiColors count])];
    }
    return color;
}

- (NSString *)selectRandomQuote {
    NSString *quote;
    if ([_compliments count] > 0) {
        quote = _compliments[arc4random_uniform((uint32_t)[_compliments count])];
    }
    NSLog(@"Quote is: %@", quote);
    return quote;
}

- (void)updateUIWithRandomColorsAndString {
    _complimentLabel.text = [self selectRandomQuote];
    _complimentLabel.textColor = [self selectRandomColor];
    self.view.backgroundColor = [self selectRandomColor];
}

- (void)runTimer:(NSTimer *)timer {
    NSRunLoop *runner = [NSRunLoop currentRunLoop];
    [runner addTimer:timer forMode:NSDefaultRunLoopMode];
}



@end
