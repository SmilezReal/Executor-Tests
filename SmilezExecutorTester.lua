local StarterGui = game:GetService("StarterGui")

-- Function to handle executor level selection
local function onLevelSelected(buttonPressed)
    if buttonPressed == "Level 3 Or Lower" then
        -- Run the loadstring when "Level 3 Or Lower" is pressed
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/s4n8m2k6q1h9j7v5t3f2r9p7y2g8l3w6x7z9v5/s9r3v5k7t1f2n9l7y2g8q4m6p8z1x3w7b9j2v5/refs/heads/main/level3orlower.lua", true))()
        end)

        if not success then
            warn("Error running script: " .. err)
        end

    elseif buttonPressed == "Level 4 Or Higher" then
        -- Run the loadstring when "Level 4 Or Higher" is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/s4n8m2k6q1h9j7v5t3f2r9p7y2g8l3w6x7z9v5/s9r3v5k7t1f2n9l7y2g8q4m6p8z1x3w7b9j2v5/refs/heads/main/level4orhigher.lua", true))()
    end
end

-- Function to handle first notification
local function onFirstNotificationPressed(buttonPressed)
    if buttonPressed == "Sure" then
        game:GetService("StarterGui"):SetCore("DevConsoleVisible", true)
        for i = 1, 50 do print("") end
        printidentity()
    elseif buttonPressed == "Nah" then
        -- Show second notification when "Nah" is pressed
        local LevelNotification = Instance.new("BindableFunction")
        LevelNotification.OnInvoke = onLevelSelected
        
        StarterGui:SetCore("SendNotification", {
            Title = "S.E.T",
            Text = "Please Select What Level Your Executor Is To Continue.",
            Duration = 100,
            Button1 = "Level 3 Or Lower",
            Button2 = "Level 4 Or Higher",
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
    Button1 = "Sure",
    Button2 = "Nah",
    Callback = FirstNotification
})
