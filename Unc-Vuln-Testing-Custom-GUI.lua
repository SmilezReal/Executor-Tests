local function callback(Text)
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback

game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "Loading...";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(6)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "Opening S.E.T Custom Console...";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(6)

-- Create the custom console GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "CustomConsole"
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.4, 0, 0.5, 0)  -- Adjust size as necessary
frame.Position = UDim2.new(0.3, 0, 0.25, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Title for the console
local titleLabel = Instance.new("TextLabel")
titleLabel.Size = UDim2.new(1, 0, 0.1, 0)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundTransparency = 1
titleLabel.Text = "Custom S.E.T Logging GUI"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 18
titleLabel.TextXAlignment = Enum.TextXAlignment.Center
titleLabel.TextYAlignment = Enum.TextYAlignment.Center
titleLabel.Parent = frame

-- Close Button (X)
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)  -- Positioned at the top right
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  -- Red button
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 18
closeButton.Parent = frame

-- Function to destroy the GUI when the X button is clicked
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()  -- Destroys the entire GUI
end)

-- Scrollable container for the logs
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 0.9, 0)  -- Takes up most of the frame
scrollFrame.Position = UDim2.new(0, 0, 0.1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = frame

-- Content frame inside the scrollable container to hold the logs
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0, 0)  -- Initial size is zero (it will grow)
contentFrame.Position = UDim2.new(0, 0, 0, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = scrollFrame

-- Create a text label template that will hold the printed output
local logLabel = Instance.new("TextLabel")
logLabel.Size = UDim2.new(1, 0, 0, 20)  -- Each message's height
logLabel.BackgroundTransparency = 1
logLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logLabel.TextWrapped = true
logLabel.TextScaled = true  -- Ensures it scales within the box
logLabel.Text = ""  -- Start with an empty message

-- Add a constraint to limit the text size
local textConstraint = Instance.new("UITextSizeConstraint")
textConstraint.MaxTextSize = 14  -- Set a reasonable max size
textConstraint.Parent = logLabel

logLabel.Parent = contentFrame

-- Variable to track the vertical position for each new label
local currentPositionY = 0

-- Function to update the console with new print messages
local function updateConsole(message, messageType)
    -- Create a new label for each message with timestamp
    local timeStamp = os.date("%X")  -- Get current time in HH:MM:SS format
    local dateStamp = os.date("%x")  -- Get current date in MM/DD/YYYY format
    
    local formattedMessage = timeStamp .. " " .. dateStamp .. " - " .. message

    -- Create a new label for the formatted message
    local newLabel = logLabel:Clone()
    newLabel.Text = formattedMessage

    -- Set the color depending on the message type
    if messageType == "warn" then
        newLabel.TextColor3 = Color3.fromRGB(255, 255, 0)  -- Yellow for warnings
    elseif messageType == "error" then
        newLabel.TextColor3 = Color3.fromRGB(255, 0, 0)  -- Red for errors
    else
        newLabel.TextColor3 = Color3.fromRGB(255, 255, 255)  -- White for normal messages
    end

    newLabel.Parent = contentFrame

    -- Position the label below the previous one
    newLabel.Position = UDim2.new(0, 0, 0, currentPositionY)

    -- Update the position for the next label
    currentPositionY = currentPositionY + newLabel.Size.Y.Offset

    -- Adjust the content frame height to fit the new message
    contentFrame.Size = UDim2.new(1, 0, 0, currentPositionY)

    -- Update the scrolling frame's canvas size to match the content frame height
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentFrame.Size.Y.Offset)

    -- Ensure the scroll frame scrolls to the bottom
    scrollFrame.CanvasPosition = Vector2.new(0, scrollFrame.CanvasSize.Y.Offset)
end

-- Redirecting the print function to the custom console
local oldPrint = print
function print(...)
    local args = {...}
    local message = table.concat(args, " ")
    updateConsole(message, "print")
    oldPrint(unpack(args))
end

-- Redirecting the warn function to the custom console
local oldWarn = warn
function warn(...)
    local args = {...}
    local message = table.concat(args, " ")
    updateConsole(message, "warn")
    oldWarn(unpack(args))
end

-- Redirecting the error function to the custom console
local oldError = error
function error(message, level)
    updateConsole(message, "error")
    oldError(message, level)
end

wait(4)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "S.E.T Custom Console Opened.";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(6)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "Starting Tests...";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(6)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T.";
    Text = "Thank You For Using S.E.T (Smilez Executor Tester)";
    Duration = "20";
    Callback = NotificationBindable;
})

-- Start of Test Outputs
print("--------------------------------------------------")
print("S.E.T UNC Test Starting...")
print("--------------------------------------------------")
wait(5)
print("S.E.T UNC Test Running... Please Wait...")
loadstring(game:HttpGet("https://raw.githubusercontent.com/SmilezReal/Executor-Tests/refs/heads/main/UncTest.lua",true))()
wait(5)
print("--------------------------------------------------")
print("S.E.T VULN Test Starting...")
print("--------------------------------------------------")
wait(5)
print("S.E.T VULN Test Running... Please Wait...")

-- Also protect the VULN test loadstring
local success, err = pcall(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SmilezReal/Executor-Tests/refs/heads/main/VulnTest.lua", true))()
end)
if not success then
    warn("VULN Test failed: " .. err)
end

wait(5)
print("--------------------------------------------------")
print("S.E.T Checks Complete.")
print("--------------------------------------------------")
