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
    -- DESDE WAVE 20 HASTA 50 = AUTO SKIP APAGADO
    -------------------------------------------------
    if wave >= 20 and wave <= 50 then

        -- Si está prendido, apagarlo
        if color.G == 1 then
            for _,v in pairs(getconnections(button.Activated)) do
                v:Fire()
            end

            task.wait(0.5)
        end

    -------------------------------------------------
    -- ANTES DE WAVE 20 = AUTO SKIP PRENDIDO
    -------------------------------------------------
    else
        -- Solo se prende antes de la 20
        if wave < 20 then
            if color.R == 1 and color.G == 0 and color.B == 0 then
                for _,v in pairs(getconnections(button.Activated)) do
                    v:Fire()
                end

                task.wait(0.5)
            end
        end
    end

    task.wait(1)
end
