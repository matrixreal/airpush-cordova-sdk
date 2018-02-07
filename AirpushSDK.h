//
//  AirpushSDK.h
//  Hello World
//
//  Created by Ashok Kumar on 31/12/14.
//
//

#import <Cordova/CDV.h>

@interface AirpushSDK : CDVPlugin

-(void)setupForAppPortalIdentifier:(CDVInvokedUrlCommand *)command;

-(void) showAds:(CDVInvokedUrlCommand *)command;

-(void) stopAds:(CDVInvokedUrlCommand *)command;

-(void)setCallBackDelegate:(CDVInvokedUrlCommand *)command;

@end
