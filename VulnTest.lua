local pass, fail, unknown = 0, 0, 0

local function test(callback)
    task.spawn(function()
        local success, errorMsg = pcall(callback)
        if errorMsg == "Argument 1 missing or nil" then
            fail += 1
        elseif success then
            pass += 1
        else
            unknown += 1
        end
    end)
    task.wait()
end

-- Run all tests silently
test(function() game:GetService("HttpRbxApiService"):PostAsync() end)
test(function() game:GetService("HttpRbxApiService"):PostAsyncFullUrl() end)
test(function() game:GetService("HttpRbxApiService"):GetAsync() end)
test(function() game:GetService("HttpRbxApiService"):GetAsyncFullUrl() end)
test(function() game:GetService("HttpRbxApiService"):RequestAsync() end)
test(function() game:GetService("ScriptContext"):AddCoreScriptLocal() end)
test(function() game:GetService("BrowserService"):EmitHybridEvent() end)
test(function() game:GetService("BrowserService"):ExecuteJavaScript() end)
test(function() game:GetService("BrowserService"):OpenBrowserWindow() end)
test(function() game:GetService("BrowserService"):OpenNativeOverlay() end)
test(function() game:GetService("BrowserService"):ReturnToJavaScript() end)
test(function() game:GetService("BrowserService"):SendCommand() end)
test(function() game:GetService("MarketplaceService"):GetRobuxBalance() end)
test(function() game:GetService("MarketplaceService"):PerformPurchase() end)
test(function() game:GetService("MarketplaceService"):PerformPurchaseV2() end)
test(function() game:GetService("MarketplaceService"):PromptBundlePurchase() end)
test(function() game:GetService("MarketplaceService"):PromptGamePassPurchase() end)
test(function() game:GetService("MarketplaceService"):PromptProductPurchase() end)
test(function() game:GetService("MarketplaceService"):PromptPurchase() end)
test(function() game:GetService("MarketplaceService"):PromptRobloxPurchase() end)
test(function() game:GetService("MarketplaceService"):PromptThirdPartyPurchase() end)
test(function() game:GetService("HttpService"):RequestInternal() end)
test(function() game:GetService("GuiService"):OpenBrowserWindow() end)
test(function() game:GetService("GuiService"):OpenNativeOverlay() end)
test(function() game:GetService("OpenCloudService"):HttpRequestAsync() end)
test(function() game:GetService("CoreGui"):TakeScreenshot() end)
test(function() game:GetService("CoreGui"):ToggleRecording() end)
test(function() game:GetService("MessageBusService"):Call() end)
test(function() game:GetService("MessageBusService"):GetLast() end)
test(function() game:GetService("MessageBusService"):GetMessageId() end)
test(function() game:GetService("MessageBusService"):GetProtocolMethodRequestMessageId() end)
test(function() game:GetService("MessageBusService"):GetProtocolMethodResponseMessageId() end)
test(function() game:GetService("MessageBusService"):MakeRequest() end)
test(function() game:GetService("MessageBusService"):Publish() end)
test(function() game:GetService("MessageBusService"):PublishProtocolMethodRequest() end)
test(function() game:GetService("MessageBusService"):PublishProtocolMethodResponse() end)
test(function() game:GetService("MessageBusService"):Subscribe() end)
test(function() game:GetService("MessageBusService"):SubscribeToProtocolMethodRequest() end)
test(function() game:GetService("MessageBusService"):SubscribeToProtocolMethodResponse() end)
test(function() game:Load() end)
test(function() game:OpenScreenshotsFolder() end)
test(function() game:GetService("CoreGui"):OpenVideosFolder() end)
test(function() game:GetService("OmniRecommendationsService"):MakeRequest() end)
test(function() game:GetService("Players"):ReportAbuse() end)
test(function() game:GetService("Players"):ReportAbuseV3() end)

-- Final Summary
task.wait(1)
local totalTests = pass + fail + unknown
local rate = math.round(pass / totalTests * 100)

print("\n")
print("✅ " .. rate .. "% (" .. pass .. " out of " .. totalTests .. ") vulnerabilities mitigated")
print("⛔ " .. fail .. " vulnerabilities not mitigated")
print("⏺️ " .. unknown .. " vulnerabilities not tested")
