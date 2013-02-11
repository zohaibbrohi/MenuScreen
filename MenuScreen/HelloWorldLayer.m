//
//  HelloWorldLayer.m
//  MenuScreen
//
//  Created by Zohaib Brohi on 11/02/2013.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
        timerGame = 30;
        gameOver = NO;
        winSize = [CCDirector sharedDirector].winSize;
        
        // Adding Bacground
        CCSprite *sprite_Bg = [CCSprite spriteWithFile:@"lam.jpeg"];
        sprite_Bg.position = ccp(winSize.width/2, winSize.height/2);
        [self addChild:sprite_Bg];
        
        timelabel = [CCLabelTTF labelWithString:@"30" fontName:@"Arial" fontSize:48];
		timelabel.position =  ccp(winSize.width/2 ,winSize.height/1.5);
		[self addChild: timelabel];
        
        CCMenuItem *pauseItem = [CCMenuItemImage itemFromNormalImage:@"pausebutton.png" selectedImage:@"pausebutton.png" target:self selector:@selector(pause:)];
        
		PauseButton = [CCMenu menuWithItems: pauseItem, nil];
        
		PauseButton.position = ccp(winSize.width/1.1 ,winSize.height/1.1);
        //PauseButton.tag = kPauseButton;
		[self addChild:PauseButton z:2];
        
        [self schedule:@selector(timerLabel:) interval:1];

	}
	return self;
}

-(void) timerLabel:(ccTime) dt
{
    
    
    if(timerGame > 0)
    {
        timerGame--;
        [timelabel setString:[NSString stringWithFormat:@"%i",timerGame]];
    }
    else
    {
        if(!gameOver)
        {
            self.isTouchEnabled = NO;
            CCLabelTTF* lbl_gameOver = [CCLabelTTF labelWithString:@"GAME OVER!" fontName:@"Marker Felt" fontSize:60];
            lbl_gameOver.position = CGPointMake(winSize.width / 2, winSize.height / 3);
            [self addChild:lbl_gameOver z:3 tag:100];
            // 3) jumping
            CCJumpBy* jump = [CCJumpBy actionWithDuration:3 position:CGPointZero height:winSize.height / 3 jumps:1];
            CCRepeatForever* repeatJump = [CCRepeatForever actionWithAction:jump];
            [lbl_gameOver runAction:repeatJump];
            gameOver = YES;
            //[[CCDirector sharedDirector] pause];
            
        }
    }
}


-(void) pause: (id) sender {
    
    
    [[CCDirector sharedDirector] pause];
    
    // [self addChild:[PauseMenu node] z:100 tag:KHudLayer];
    
    PauseMenu *menuLayer = [[PauseMenu alloc] initWithParent:self];
    [self addChild:menuLayer z:5];
    
    PauseButton.visible = NO;
}

-(void)resumeFromMenu
{
    PauseButton.visible = YES;
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
