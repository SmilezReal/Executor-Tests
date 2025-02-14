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
game.StarterGui:SetCore("SendNotification", {
    Title = "Thanks For Using SUSVC.";
    Text = "Executing Mobile Keyboard Incase Of Mobile.";
    Duration = "5";
    Callback = NotificationBindable;
})
wait(5)
loadstring(game:HttpGet("https://raw.githubusercontent.com/SmilezReal/Executor-Tests/refs/heads/main/mkwf9.lua"))()
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
    Text = "Press F9 To Check The Console. Please Be Patient As Some Tests Can Take Up To 60 Seconds To Complete Depending On Your Internet Connection.";
    Duration = "20";
    Callback = NotificationBindable;
})

print("unc test below")
wait(1)
print("unc test below")
wait(1)
print("unc test below")
wait(1)
print("unc test below")
wait(1)
print("unc test below")
wait(1)
wait(5)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/UncTest.lua",true))()
wait(5)
print("sunc test below")
wait(1)
print("sunc test below")
wait(1)
print("sunc test below")
wait(1)
print("sunc test below")
wait(1)
print("sunc test below")
wait(1)
wait(5)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/sUncTest.lua",true))()
wait(5)
print("vuln test below")
wait(1)
print("vuln test below")
wait(1)
print("vuln test below")
wait(1)
print("vuln test below")
wait(1)
print("vuln test below")
wait(1)
wait(5)
loadstring(game:HttpGet("https://github.com/SmilezReal/Executor-Tests/raw/refs/heads/main/VulnTest.lua",true))()
wait(1)
print("if any of these tests didnt work. please re-execute the script. if the issues still persist. your executor does not support this script.")
