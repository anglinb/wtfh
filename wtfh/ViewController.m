//
//  ViewController.m
//  wtfh
//
//  Created by Brian Anglin on 1/9/14.
//  Copyright (c) 2014 Brian Anglin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[self.nextButton setTitle:@"Calibration" forState:UIControlStateNormal];
    self.nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;//UITextAlignmentCenter;
    self.on = 0;
}
- (IBAction)calculate:(id)sender
{
    NSLog(@"Something Happend!");
    NSURL *url = [NSURL URLWithString:@"http://ineedafuckinghalloweencostume.com/"];
    
    if (![[UIApplication sharedApplication] openURL:url])
        
        NSLog(@"%@%@",@"Failed to open url:",[url description]);
}
- (IBAction)loadJSON:(id)sender
{
    NSString *requestString = [NSString stringWithFormat: @"http://wtfh.briananglin.me/api/"];
    if (self.on == 1) {
       requestString = [NSString stringWithFormat:
                                   @"http://wtfh.briananglin.me/api/clean"];
    }else
    {
        requestString = [NSString stringWithFormat:
                                   @"http://wtfh.briananglin.me/api"];
    }
    
    NSURL *url = [NSURL URLWithString:requestString];
    
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"GET"];
    
    //[req addValue:@"application/json" forHTTPHeaderField:@"Content-type"];
    
    //NSString *dataString = @"{\"latitude\":\"53.041\", \"longitude\":\"-2.90545\", \"radius\":\"100000\"}";
    
    //NSData *requestData = [NSData dataWithBytes:[dataString UTF8String] length:[dataString length]];
    
    //[req setHTTPBody:requestData];
    
    NSHTTPURLResponse *theResponse = NULL;
    NSError *theError = NULL;
    NSData *theResponseData = [NSURLConnection sendSynchronousRequest:req returningResponse:&theResponse error:&theError];
    NSError* error;
    if([theResponse statusCode] == 200)
        NSLog(@"It worked!");
    else{
        NSLog(@"Nope");
        NSLog(@"%@",theError);
        return;
    }
    NSLog(@"%@",theResponse);
        
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:theResponseData //1
                          
                          options:kNilOptions
                          error:&error];
    NSString* prompt  = [json objectForKey:@"prompt"];
    NSString* costume = [json objectForKey:@"costume"];
    NSString* next    = [json objectForKey:@"next"];
    
    NSLog(@"prompt: %@", prompt); //3
    NSLog(@"prompt: %@", costume); //3
    NSLog(@"prompt: %@", next); //3
    
    [self.nextButton setTitle:next forState:UIControlStateNormal];
    self.promtLabel.text = prompt;
    self.costumeLabel.text = costume;
}
- (IBAction)cleanToggle:(id)sender
{
   // UISwitch *toggle = (UISwitch *)sender;
    self.on = !self.on;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
