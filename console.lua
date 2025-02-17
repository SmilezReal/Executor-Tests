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
logLabel.Size = UDim2.new(1, 0, 0, 20)  -- Default height for each label (adjusted later)
logLabel.BackgroundTransparency = 1
logLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
logLabel.TextSize = 14
logLabel.TextWrapped = true  -- Ensure long text wraps
logLabel.Text = ""  -- Start with an empty message
logLabel.Parent = contentFrame

-- Variable to track the vertical position for each new label
local currentPositionY = 0

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

    -- Resize the label to fit the wrapped text
    newLabel.TextBounds = Vector2.new(0, 0)  -- Clear TextBounds so it can calculate height dynamically
    local newLabelHeight = newLabel.TextBounds.Y

    -- Position the label below the previous one
    newLabel.Position = UDim2.new(0, 0, 0, currentPositionY)

    -- Update the position for the next label and increase height accordingly
    currentPositionY = currentPositionY + newLabelHeight

    -- Adjust the content frame height to fit the new message
    contentFrame.Size = UDim2.new(1, 0, 0, currentPositionY)

    -- Update the scrolling frame's canvas size to match the content frame height
    scrollFrame.CanvasSize = UDim2.new(0, 0, 0, contentFrame.Size.Y.Offset)

    -- Ensure the scroll frame scrolls to the bottom
    scrollFrame.CanvasPosition = Vector2.new(0, scrollFrame.CanvasSize.Y.Offset)
end

-- Hook into the print function to update the custom console GUI
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

-- Hook into the warn function to update the custom console GUI
local oldWarn = warn
warn = function(...)
    local args = {...}
    local message = "[WARN] " .. table.concat(args, " ")
    updateConsole(message)
    oldWarn(unpack(args))  -- Ensure original warn behavior is preserved
end

-- Hook into the error function to update the custom console GUI
local oldError = error
error = function(...)
    local args = {...}
    local message = "[ERROR] " .. table.concat(args, " ")
    updateConsole(message)
    oldError(unpack(args))  -- Ensure original error behavior is preserved
end

-- Hook into the printidentity function to update the custom console GUI
local oldPrintIdentity = printidentity
printidentity = function()
    local identity = oldPrintIdentity()
    updateConsole("printidentity: " .. identity)
    return identity
end
