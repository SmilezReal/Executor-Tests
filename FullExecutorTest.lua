local function callback(Text)
end

local NotificationBindable = Instance.new("BindableFunction")
NotificationBindable.OnInvoke = callback

game.StarterGui:SetCore("SendNotification", {
    Title = "Thanks For Using SUSVC.";
    Text = "Loading...";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(5)
wait(2)
game.StarterGui:SetCore("SendNotification", {
    Title = "SUSVC.";
    Text = "Loading Complete.";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(2)
game.StarterGui:SetCore("SendNotification", {
    Title = "SUSVC.";
    Text = "Press F9 To Check The Console. Please Be Patient As Some Tests Can Take Up To 60 Seconds To Complete Depending On Your Internet.";
    Duration = "20";
    Callback = NotificationBindable;
})

-- Start of Test Outputs
print("--------------------------------------------------")
print("UNC Test Starting...")
print("--------------------------------------------------")
wait(5)
print("UNC Test Running... Please Wait...")
wait(1)
print("UNC Test Running... Please Wait...")
wait(1)
print("UNC Test Running... Please Wait...")
wait(1)
print("UNC Test Running... Please Wait...")
wait(1)
print("UNC Test Running... Please Wait...")
wait(1)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/UncTest.lua",true))()
wait(5)
print("--------------------------------------------------")
print("LVL Test Starting...")
print("--------------------------------------------------")
wait(5)
print("LVL Test Running... Please Wait...")
wait(1)
print("LVL Test Running... Please Wait...")
wait(1)
print("LVL Test Running... Please Wait...")
wait(1)
print("LVL Test Running... Please Wait...")
wait(1)
print("LVL Test Running... Please Wait...")
wait(1)
printidentity()
wait(5)
print("--------------------------------------------------")
print("VULN Test Starting...")
print("--------------------------------------------------")
wait(5)
print("VULN Test Running... Please Wait...")
wait(1)
print("VULN Test Running... Please Wait...")
wait(1)
print("VULN Test Running... Please Wait...")
wait(1)
print("VULN Test Running... Please Wait...")
wait(1)
print("VULN Test Running... Please Wait...")
wait(1)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/VulnTest.lua",true))()
wait(1)
print("--------------------------------------------------")
print("SET Complete.")
print("--------------------------------------------------")
wait(5)
print("If Any Of These Tests Didn't Work, Please Re-Execute The Script.")
