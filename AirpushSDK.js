
var AirpushiOSSDK = {
   
    setupForAppPortalIdentifier: function(appId)
    {
        cordova.exec(null,null,"AirpushSDK","setupForAppPortalIdentifier",[appId]);
    },
    
    showAds:function(placementId,testMode)
    {
        cordova.exec(null,null,"AirpushSDK","showAds",[placementId,testMode]);
    },
    
    stopAds:function()
    {
        cordova.exec(null,null,"AirpushSDK","stopAds",[]);
    },
    
    setCallBackDelegate:function(yesOrNo)
    {
        cordova.exec(null,null,"AirpushSDK","setCallBackDelegate",[yesOrNo]);
    }
}

// ad call back delegate

function APAdLoading()
{
    
}

function APAdLoaded()
{
    
}

function APAdClick()
{

}

function APAdClose()
{
    
}

function APNoAdAvailable()
{
    
}

function APOnAdError(errorMessage)
{

}

function APOnSDKIntegrationError(errorMessage)
{

}