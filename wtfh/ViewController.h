//
//  ViewController.h
//  wtfh
//
//  Created by Brian Anglin on 1/9/14.
//  Copyright (c) 2014 Brian Anglin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UISwitch *cleanSwitch;
@property (weak, nonatomic) IBOutlet UILabel *costumeLabel;
@property (weak, nonatomic) IBOutlet UIButton *testButton;
@property (weak, nonatomic) IBOutlet UILabel *promtLabel;
@property  (nonatomic) BOOL on;
- (IBAction)calculate:(id)sender;
- (IBAction)loadJSON:(id)sender;
- (IBAction)cleanToggle:(id)sender;
@end
