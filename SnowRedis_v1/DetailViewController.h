//
//  DetailViewController.h
//  SnowRedis_v1
//
//  Created by Programmer/Analyst on 4/20/16.
//  Copyright © 2016 Justin Snow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end

