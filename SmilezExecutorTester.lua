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
wait(4)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "Opening Console...";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(4)
game:GetService'StarterGui':SetCore("DevConsoleVisible", true)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "Console Opened.";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(2)
game.StarterGui:SetCore("SendNotification", {
    Title = "S.E.T";
    Text = "Starting Tests.";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(2)
game.StarterGui:SetCore("SendNotification", {
    Title = "SUSVC.";
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
wait(1)
print("S.E.T UNC Test Running... Please Wait...")
wait(1)
print("S.E.T UNC Test Running... Please Wait...")
wait(1)
print("S.E.T UNC Test Running... Please Wait...")
wait(1)
print("S.E.T UNC Test Running... Please Wait...")
wait(1)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/UncTest.lua",true))()
wait(5)
print("--------------------------------------------------")
print("S.E.T LVL Test Starting...")
print("--------------------------------------------------")
wait(5)
print("S.E.T LVL Test Running... Please Wait...")
wait(1)
print("S.E.T LVL Test Running... Please Wait...")
wait(1)
print("S.E.T LVL Test Running... Please Wait...")
wait(1)
print("S.E.T LVL Test Running... Please Wait...")
wait(1)
print("S.E.T LVL Test Running... Please Wait...")
wait(1)
printidentity()
wait(5)
print("--------------------------------------------------")
print("S.E.T VULN Test Starting...")
print("--------------------------------------------------")
wait(5)
print("S.E.T VULN Test Running... Please Wait...")
wait(1)
print("S.E.T VULN Test Running... Please Wait...")
wait(1)
print("S.E.T VULN Test Running... Please Wait...")
wait(1)
print("S.E.T VULN Test Running... Please Wait...")
wait(1)
print("S.E.T VULN Test Running... Please Wait...")
wait(1)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/VulnTest.lua",true))()
wait(1)
print("--------------------------------------------------")
print("S.E.T Checks Complete.")
print("--------------------------------------------------")
wait(5)
print("If Any Of These Tests Didn't Work, Please Re-Execute The Script.")
