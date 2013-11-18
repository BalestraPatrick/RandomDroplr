//
//  ViewController.h
//  RandomDroplr
//
//  Created by Patrick Balestra on 9/19/13.
//  Copyright (c) 2013 Patrick Balestra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) NSString *completeString;

- (IBAction)next:(id)sender;
- (IBAction)share:(id)sender;

@end
