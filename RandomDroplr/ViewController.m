//
//  ViewController.m
//  RandomDroplr
//
//  Created by Patrick Balestra on 9/19/13.
//  Copyright (c) 2013 Patrick Balestra. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, retain) NSArray *variables;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // App Look
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.372 green:0.8 blue:0.960 alpha:1.0];
    
    
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"droplrIcon.png"]];
    
    _variables = @[@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", @"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9"];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [_webView setDelegate:(id)self];
    [_webView loadRequest:[self buildAnotherRequest]];
    
}

- (NSURLRequest *)buildAnotherRequest {
    NSString *char1 = @"";
    NSString *char2 = @"";
    NSString *char3 = @"";
    NSString *char4 = @"";
    
    int r = arc4random() % [_variables count];
    if (r < [_variables count]) {
        char1 = [_variables objectAtIndex:r];
    }
    
    int r2 = arc4random() % [_variables count];
    if (r2 < [_variables count]) {
        char2 = [_variables objectAtIndex:r2];
    }
    
    int r3 = arc4random() % [_variables count];
    if (r3 < [_variables count]) {
        char3 = [_variables objectAtIndex:r3];
    }
    
    int r4 = arc4random() % [_variables count];
    if (r4 < [_variables count]) {
        char4 = [_variables objectAtIndex:r4];
    }
    
    _completeString = [[NSString alloc] initWithFormat:@"http://d.pr/i/%@%@%@%@", char1, char2, char3, char4];
    
    NSLog(@"Complete string: %@", _completeString);
    
    NSURL *completeUrl = [[NSURL alloc] initWithString:_completeString];
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:completeUrl];
    
    return request;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (IBAction)next:(id)sender {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    if ([_webView isLoading]) {
        [_webView stopLoading];
    }
    
    [_webView loadRequest:[self buildAnotherRequest]];

}

- (IBAction)share:(id)sender {
    UIActivityViewController *share = [[UIActivityViewController alloc] initWithActivityItems:@[_completeString] applicationActivities:nil];
    [self presentViewController:share animated:YES completion:nil];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    NSString *jsCall = @"window.find('Page Not Found');";
    if ([[webView stringByEvaluatingJavaScriptFromString:jsCall] boolValue])
        [self next:nil];
}

@end
