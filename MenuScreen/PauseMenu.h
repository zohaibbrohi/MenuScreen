//
//  PauseMenu.h
//  SocialSpider
//
//  Created by Zohaib Brohi on 07/02/2013.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "HelloWorldLayer.h"
#import "Settings.h"


@class HelloWorldLayer;
@interface PauseMenu : CCLayer {
	
    CCLayerColor* dimBrightness;
    id reference;

}

- (id)initWithParent:(CCLayer *)parentLayer;
- (void) dimBackground;
- (void) addResumeMenu;
- (void) addRestartMenu;
- (void) addSettingsMenu;

@end