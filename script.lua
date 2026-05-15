local Players = game:GetService("Players")
local RS = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer

local button = player:WaitForChild("PlayerGui")
    :WaitForChild("Match")
    :WaitForChild("TopFrame")
    :WaitForChild("AutoSkip")
    :WaitForChild("OnAndOff")

local currentWave = RS:WaitForChild("MatchData"):WaitForChild("CurrentWave")

while true do
    local wave = currentWave.Value
    local color = button.BackgroundColor3

    -------------------------------------------------
    -- ENTRE WAVE 20 Y 34 = AUTO SKIP APAGADO
    -------------------------------------------------
    if wave >= 20 and wave < 35 then
        -- Si está prendido (verde), apagar
        if color.G == 1 then
            for _,v in pairs(getconnections(button.Activated)) do
                v:Fire()
            end

            task.wait(0.5)
        end

    -------------------------------------------------
    -- ANTES DE 20 O DESDE 35 = AUTO SKIP PRENDIDO
    -------------------------------------------------
    else
        -- Si está apagado (rojo), prender
        if color.R == 1 and color.G == 0 and color.B == 0 then
            for _,v in pairs(getconnections(button.Activated)) do
                v:Fire()
            end

            task.wait(0.5)
        end
    end

    task.wait(1)
end