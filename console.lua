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
titleLabel.TextAlign = Enum.TextAlign.Center
titleLabel.Parent = frame

-- Scrollable container for the logs
local scrollFrame = Instance.new("ScrollingFrame")
scrollFrame.Size = UDim2.new(1, 0, 0.9, 0)  -- Takes up most of the frame
scrollFrame.Position = UDim2.new(0, 0, 0.1, 0)
scrollFrame.BackgroundTransparency = 1
scrollFrame.ScrollBarThickness = 5
scrollFrame.Parent = frame

-- Content frame inside the scrollable container to hold the logs
local contentFrame = Instance.new("Frame")
contentFrame.Size = UDim2.new(1, 0, 0, 100)  -- Initial height, will grow
contentFrame.Position = UDim2.new(0, 0, 0, 0)
contentFrame.BackgroundTransparency = 1
contentFrame.Parent = scrollFrame

-- Create a text label that will hold the printed output
local logLabel = Instance.new("TextLabel")
logLabel.Size = UDim2.new(1, 0, 0, 20)  -- Each message's height
logLabel.BackgroundTransparency = 1
logLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logLabel.TextSize = 14
logLabel.TextWrapped = true
logLabel.Text = ""  -- Start with an empty message
logLabel.Parent = contentFrame

-- Function to update the console with new print messages
local function updateConsole(message)
    -- Create a new label for each print message with timestamp
    local timeStamp = os.date("%X")  -- Get current time in HH:MM:SS format
    local dateStamp = os.date("%x")  -- Get current date in MM/DD/YYYY format
    
    local formattedMessage = timeStamp .. " " .. dateStamp .. " - " .. message

    -- Create a new label for the formatted message
    local newLabel = logLabel:Clone()
    newLabel.Text = formattedMessage
    newLabel.Parent = contentFrame

    -- Adjust the content frame height to fit the new message
    local currentHeight = contentFrame.Size.Y.Offset
    contentFrame.Size = UDim2.new(1, 0, 0, currentHeight + 20)

    -- Ensure the scroll frame scrolls to the bottom
    scrollFrame.CanvasPosition = Vector2.new(0, scrollFrame.CanvasSize.Y.Offset)

    -- If there are too many messages, destroy the oldest ones
    if contentFrame.Size.Y.Offset > 500 then  -- If the content frame grows too large
        contentFrame:Destroy()
        contentFrame = Instance.new("Frame")  -- Recreate it for fresh content
        contentFrame.Size = UDim2.new(1, 0, 0, 100)  -- Reset the size
        contentFrame.Position = UDim2.new(0, 0, 0, 0)
        contentFrame.BackgroundTransparency = 1
        contentFrame.Parent = scrollFrame
    end
end

-- Redirecting the print function to the custom console
local oldPrint = print
function print(...)
    -- Concatenate all the arguments into a string
    local args = {...}
    local message = table.concat(args, " ")
    
    -- Update the custom console GUI with the new print message
    updateConsole(message)
    
    -- Call the original print to ensure it still works in the output
    oldPrint(unpack(args))
end

-- Function to destroy the GUI after a specified time (e.g., 30 seconds)
local function autoDestroy()
    wait(30)  -- Time in seconds before the GUI is destroyed
    screenGui:Destroy()  -- Destroy the GUI after the wait
end

-- Start the auto-destroy timer
autoDestroy()
