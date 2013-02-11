//
//  HelloWorldLayer.h
//  MenuScreen
//
//  Created by Zohaib Brohi on 11/02/2013.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "PauseMenu.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    CCLabelTTF *timelabel;
    int timerGame;
    BOOL gameOver;
    CGSize winSize;
    CCMenu *PauseButton;
}


// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void)resumeFromMenu;

@end
