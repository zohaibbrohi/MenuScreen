//
//  Settings.mm
//  SocialSpider
//
//  Created by Zohaib Brohi on 07/02/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Settings.h"
#import "SimpleAudioEngine.h"


#define NEW_KEY @"newkey"
@implementation Settings



+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
    
	// 'layer' is an autorelease object.
	Settings *layer = [Settings node];
    
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}
-(id) init
{
	if( (self=[super init] )) {
        
		CCLabelTTF* label = [CCLabelTTF labelWithString:@"Settings"
                                               fontName:@"Arial" fontSize:60];
        label.position = ccp(240, 250);
        [self addChild: label];
        
        
        [CCMenuItemFont setFontName:@"Arial"];
        [CCMenuItemFont setFontSize:35];
        
        CCMenuItem *resume = [CCMenuItemFont itemFromString:@"Resume"
                                                     target:self
                                                   selector:@selector(resume:)];
        CCMenu *menu = [CCMenu menuWithItems: resume, nil];
        menu.position = ccp(130, 101.67f);
        [menu alignItemsVerticallyWithPadding:10.5f];
        [self addChild:menu];
        
    }
    return self;
}

-(void) resume: (id) sender {
    
    [[CCDirector sharedDirector] popScene];
}


@end
