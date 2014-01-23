//
//  ALPlayer.m
//  walk
//
//  Created by Austin Louden on 1/22/14.
//  Copyright (c) 2014 Austin Louden. All rights reserved.
//

#import "ALPlayer.h"

@implementation ALPlayer

- (id)init
{
    if (self = [super init]) {
        self.warmth = 100;
        self.isInside = YES;
    }
    return self;
}

@end
