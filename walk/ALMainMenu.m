//
//  ALMainMenu.m
//  walk
//
//  Created by Austin Louden on 1/20/14.
//  Copyright (c) 2014 Austin Louden. All rights reserved.
//

#import "ALMainMenu.h"
#import "ALGameScene.h"

@implementation ALMainMenu

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.05 green:0.05 blue:0.1 alpha:1.0];
        
        SKLabelNode *titleLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
        titleLabel.text = @"The Walk";
        titleLabel.fontSize = 20;
        titleLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame)+20);
        
        self.startNode = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
        self.startNode.name = @"Start";
        self.startNode.text = @"Start";
        self.startNode.fontSize = 15;
        self.startNode.position = CGPointMake(CGRectGetMidX(self.frame),
                                          CGRectGetMidY(self.frame)-20);
        
        [self addChild:titleLabel];
        [self addChild:self.startNode];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        SKNode *node = [self nodeAtPoint:location];
        
        if([node.name isEqualToString:@"Start"]) {
            
            SKAction *fadeAway = [SKAction fadeOutWithDuration:1.0];
            [self runAction:fadeAway completion:^{
                SKScene *gameScene  = [[ALGameScene alloc] initWithSize:CGSizeMake(self.size.height, self.size.width)];
                [self.scene.view presentScene:gameScene transition:nil];
            }];
        }
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
