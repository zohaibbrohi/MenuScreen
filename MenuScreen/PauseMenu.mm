//
//  PauseMenu.mm
//  SocialSpider
//
//  Created by Zohaib Brohi on 07/02/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "PauseMenu.h"

@implementation PauseMenu

- (id) initWithParent:(CCLayer *)parentLayer {
    if ((self = [super init])) {
        
        reference = (CCLayer *) parentLayer;
		
		self.isTouchEnabled=YES;
        [self dimBackground];
        
		CCSprite * background = [CCSprite spriteWithFile:@"hud_background.png"];
		[background setPosition:ccp(240,160)];
		[self addChild:background];
        [self addRestartMenu];
        [self addResumeMenu];
        [self addSettingsMenu];
		
    }
    return self;
}

- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{

}
- (void) dimBackground{
    
    dimBrightness = [CCLayerColor layerWithColor:ccc4(0, 0, 0, 128)];
    [self addChild:dimBrightness z:3 tag:121];
    
}
- (void) addResumeMenu
{
    CCMenuItem *mResume = [CCMenuItemImage itemFromNormalImage:@"resume.png" selectedImage:@"resume.png" target:self selector:@selector(resume:)];
    
    CCMenu *ResumeButton = [CCMenu menuWithItems: mResume, nil];
    
    ResumeButton.position = ccp(180,320/2);
    //CCLOG(@"%f",480/7);
    
    [self addChild:ResumeButton z:101];
}

- (void) addRestartMenu
{
    CCMenuItem *mRestart = [CCMenuItemImage itemFromNormalImage:@"restart.png" selectedImage:@"restart.png" target:self selector:@selector(restart:)];
    
    CCMenu *RestartButton = [CCMenu menuWithItems: mRestart, nil];
    
    RestartButton.position = ccp(240,320/2);
    
    [self addChild:RestartButton z:101];
}

- (void) addSettingsMenu
{
     CCMenuItem *mSettings = [CCMenuItemImage itemFromNormalImage:@"settings.png" selectedImage:@"settings.png" target:self selector:@selector(settings:)];
    
    CCMenu *SettingsButton = [CCMenu menuWithItems: mSettings, nil];
    
    SettingsButton.position = ccp(300 ,320/2);
    
    [self addChild:SettingsButton z:101];
}


-(void) resume: (id) sender {
     
    [self.parent removeChild:self cleanup:YES];
    [self removeChild:dimBrightness cleanup:YES];
    [[CCDirector sharedDirector] resume];
    
    [reference resumeFromMenu];
}

-(void) restart: (id) sender {

    CCLOG(@"restart");
    [[CCDirector sharedDirector] resume];
    [[CCDirector sharedDirector] replaceScene:[HelloWorldLayer node]];
    
}

-(void) settings: (id) sender {
    
    [[CCDirector sharedDirector] pushScene:[Settings node]];
}


- (void) dealloc
{
	[super dealloc];
}

@end