//
//  DetailViewController.m
//  SnowRedis_v1
//
//  Created by Programmer/Analyst on 4/20/16.
//  Copyright © 2016 Justin Snow. All rights reserved.
//


#import "DetailViewController.h"
#import "RedisKit.h"


@interface DetailViewController ()

@end

@implementation DetailViewController


static NSString* temp;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self getredisconn];
        [self configureView];

    }
}

+ (NSString*)temp {
    return temp;
}


-(void)getredisconn {
    
    CocoaRedis *redis = [CocoaRedis new];
    
    [[[[[redis connectWithHost:@"172.16.1.98" port:6379 ] then:^id(id value) {
        NSLog(@"Connected.");
        return nil;
    }] then:^id(id value) {
        return [redis get: @"weather"];
    }] then:^id(id value) {
        temp = value;
        self.detailDescriptionLabel.text = temp;
        return nil;
    }] catch:^id(NSError *err) {
        NSLog(@"Error: %@", err);
        return nil;
        
    }];

}



- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        self.detailDescriptionLabel.text = temp;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
