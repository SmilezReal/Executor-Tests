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
titleLabel.TextXAlignment = Enum.TextXAlignment.Center  -- Corrected to use TextXAlignment
titleLabel.TextYAlignment = Enum.TextYAlignment.Center  -- Corrected to use TextYAlignment
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

    -- Update the scrolling frame's canvas size to match the content frame height
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentFrame.Size.Y.Offset)

    -- Ensure the scroll frame scrolls to the bottom
    scrollFrame.CanvasPosition = Vector2.new(0, scrollFrame.CanvasSize.Y.Offset)
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
