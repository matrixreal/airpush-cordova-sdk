//
//  AirpushSDK.m
//  Hello World
//
//  Created by Ashok Kumar on 31/12/14.
//
//

#import "AirpushSDK.h"
#import "AP_SDK.h"
#import "APCallBackDelegate.h"

@interface AirpushSDK ()<APCallBackDelegate>

@end

@implementation AirpushSDK

AirpushSDK *airpushSDK;

-(void)setupForAppPortalIdentifier:(CDVInvokedUrlCommand *)command
{
    [AP_SDK setupForAppPortalIdentifier:[command.arguments firstObject]];
}

-(void) showAds:(CDVInvokedUrlCommand *)command
{
    airpushSDK = self;
    int placementId = (int)[[command.arguments firstObject] integerValue];
    
    bool testMode = (bool)[[command.arguments objectAtIndex:1] boolValue];
    
    [AP_SDK showAdWithViewController:self.viewController withPlacementId:placementId isTestMode:testMode];

}

-(void) stopAds:(CDVInvokedUrlCommand *)command
{
    [AP_SDK stopLoadingAd];
}

// Set call Back delegate

-(void)setCallBackDelegate:(CDVInvokedUrlCommand *)command
{
    bool needDelegate = [[command.arguments firstObject] boolValue];
    
    if (needDelegate)
    {
        [AP_SDK setCallBackDelegate:self];
    }
}

// Delegate call back functions

-(void) onAdLoading
{
    [self.commandDelegate evalJs:@"APAdLoading()"];
}

-(void) onAdLoaded
{
    [self.commandDelegate evalJs:@"APAdLoaded()"];
}

-(void) onAdClick
{
    [self.commandDelegate evalJs:@"APAdClick()"];
}

-(void) onClose
{
    [self.commandDelegate evalJs:@"APAdClose()"];
}

-(void) noAdAvailable
{
    [self.commandDelegate evalJs:@"APNoAdAvailable()"];
}

-(void) onAdError:(NSString*) message
{
    NSString *js = [NSString stringWithFormat:@"APOnAdError('%@')",message];
    [self.commandDelegate evalJs:js];
}

-(void) onSDKIntegrationError:(NSString*) message
{
    NSString *js = [NSString stringWithFormat:@"APOnSDKIntegrationError('%@')",message];
    [self.commandDelegate evalJs:js];
}
@end
