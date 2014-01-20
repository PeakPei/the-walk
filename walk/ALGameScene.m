//
//  MyScene.m
//  walk
//
//  Created by Austin Louden on 1/20/14.
//  Copyright (c) 2014 Austin Louden. All rights reserved.
//

#import "ALGameScene.h"

@implementation ALGameScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        // info labels
        SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Courier-Bold"];
        myLabel.text = @"9:30 (26° F)";
        myLabel.fontSize = 30;
        myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
                                       CGRectGetMidY(self.frame));
        [self addChild:myLabel];
        
        // gamepad up down left right
        SKSpriteNode *upNode = [SKSpriteNode spriteNodeWithColor:[UIColor whiteColor] size:CGSizeMake(15.0f, 15.0f)];
        upNode.position = CGPointMake(CGRectGetMaxX(self.frame)-30,CGRectGetMaxY(self.frame)-30);
        upNode.name = @"upNode";
        [self addChild:upNode];
        
        
        
        self.player = [SKSpriteNode spriteNodeWithImageNamed:@"back_still"];
        self.player.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-40);
        [self addChild:self.player];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        CGFloat xDist = (location.x - self.player.position.x);
        CGFloat yDist = (location.y - self.player.position.y);
        CGFloat distance = sqrt((xDist * xDist) + (yDist * yDist));
        NSLog(@"distance: %f", distance);
        SKAction *moveAction = [SKAction moveTo:location duration:distance/250.0f];
        [self.player runAction:moveAction];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
