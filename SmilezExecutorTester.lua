local StarterGui = game:GetService("StarterGui")

-- Function to handle executor level selection
local function onLevelSelected(buttonPressed)
    if buttonPressed == "Yes" then
        -- Run the loadstring when "Level 3 Or Lower" is pressed
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/SmilezReal/Executor-Tests/refs/heads/main/Unc-Vuln-Testing-Custom-GUI.lua", true))()
        end)

        if not success then
            warn("Error running script: " .. err)
        end

    elseif buttonPressed == "No" then
        -- Run the loadstring when "Level 4 Or Higher" is pressed
        print("tests canceled.")
    end
end

-- Function to handle first notification
local function onFirstNotificationPressed(buttonPressed)
    if buttonPressed == "Yes" then
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
        for i = 1, 50 do print("") end
        printidentity("This Executor Is Using " .. tostring(identifyexecutor()) .. " API | This Executor Is Level ")
        print("please wait. this console will automatically close in 6 seconds. please dont press or do anything")
        wait(6)
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", false)
        local LevelNotification = Instance.new("BindableFunction")
        LevelNotification.OnInvoke = onLevelSelected
        
        StarterGui:SetCore("SendNotification", {
            Title = "S.E.T",
            Text = "Do You Want To Continue With The Rest Of The Tests?",
            Duration = 100,
            Button1 = "Yes",
            Button2 = "No",
            Callback = LevelNotification
        })
    elseif buttonPressed == "No" then
        local LevelNotification = Instance.new("BindableFunction")
        LevelNotification.OnInvoke = onLevelSelected
        
        StarterGui:SetCore("SendNotification", {
            Title = "S.E.T",
            Text = "Do You Want To Continue With The Rest Of The Tests?",
            Duration = 100,
            Button1 = "Yes",
            Button2 = "No",
            Callback = LevelNotification
        })
    end
end

-- Create BindableFunction for the first notification
local FirstNotification = Instance.new("BindableFunction")
FirstNotification.OnInvoke = onFirstNotificationPressed

-- Show the first notification
StarterGui:SetCore("SendNotification", {
    Title = "S.E.T",
    Text = "Want To Check Your Executor's API & Level?",
    Duration = 100,
    Button1 = "Yes",
    Button2 = "No",
    Callback = FirstNotification
})
