local players = game:GetService("Players")
local userInputService = game:GetService("UserInputService")
local runService = game:GetService("RunService")
local workspaceService = game:GetService("Workspace")
local httpService = game:GetService("HttpService")
local textService = game:GetService("TextService")
local lighting = game:GetService("Lighting")
local tweenService = game:GetService("TweenService")

if not game:IsLoaded() then
  game.Loaded:Wait()
end

pcall(function()
  if type(setfpscap) == "function" then
    setfpscap(60)
  end
end)

-- DIRETSO NA SA ATING CHEAT AT NILAMPASAN ANG MAINTENANCE CHECK
local localPlayer = players.LocalPlayer
localPlayer:WaitForChild("PlayerGui")

local currentCamera = workspaceService.CurrentCamera

local v4 = {
  TrackingEnabled = false,
  Smoothness = 0.25,
  AimPart = "Head",
  FOVEnabled = true,
  FOVSize = 15,
  ShowAimButton = false,
  ESPEnabled = false,
  SnapLines = false,
  SnapLineThickness = 1.5,
  SnapLineColor = Color3.fromRGB(255, 90, 170),
  SnapLineTargetColor = Color3.fromRGB(70, 255, 150),
  BoxESP = false,
  NameTags = false,
  HealthBar = false,
  Distance = false,
  BoxColor = Color3.fromRGB(255, 105, 190),
  WallCheck = true,
  TeamCheck = true,
  BigHead = false,
  BigHeadSize = 5,
  HitboxExpander = false,
  HitboxSize = 10,
  TrackingKey = Enum.KeyCode.Z,
  DiscordLink = "MasterHub",
  UsageWebhook = "https://discord.com",
  SilentAimHK = false,
  SA2_TargetPart = "Head",
  SA2_TeamTarget = "Enemies",
  SA2_Wallcheck = false,
  SA2_Wallbang = false,
  SA2_BulletTeleport = false,
  SA2_HitChance = 100,
  SA2_HeadshotChance = 100,
  SA2_FovRadius = 100,
  SA2_FovVisible = true,
  SA2_FovTransparency = 0.9,
  SA2_FovColor = Color3.fromRGB(255, 90, 170),
  SA2_FovTargetColor = Color3.fromRGB(255, 255, 255),
  SA2_ThreeSixtyMode = false,
  SA2_TargetRange = 500,
  SA2_Prediction = 0,
  SA2_GetTarget = "Closest",
  SA2_AimMethods = { "Raycast" },
  SA2_RemoteNames = { "hit", "bullet", "projectile", "hitscan" },
  SA2_Key = Enum.KeyCode.R,
  Triggerbot = false,
  TriggerbotRate = 100,
  TriggerbotInterval = 0.01,
  TriggerbotFOV = 10,
  TriggerbotFOVVisible = false,
  TriggerbotFOVColor = Color3.fromRGB(255, 90, 170),
  TriggerbotFOVTargetColor = Color3.fromRGB(255, 255, 255),
  TriggerbotFOVTransparency = 0.9,
}

local v5 = {}
local v47 = setmetatable({}, { __mode = "k" })

local function f1(p1, p2)
  local connect4 = p1:Connect(p2)
  table.insert(v5, connect4)
  return connect4
end

local function f25(key, key2)
  if not key then
    return nil
  else
    local v48 = v47[key]
    if not v48 then
      v48 = {}
      v47[key] = v48
    end
    local v49 = v48[key2]
    if v49 and v49.Parent == key then
      return v49
    else
      local findFirstChild = key:FindFirstChild(key2)
      v48[key2] = findFirstChild
      return findFirstChild
    end
  end
end

local function f2(p3)
  if v4.AimPart == "Head" then
    return f25(p3, "Head")
  elseif v4.AimPart == "Torso" then
    return f25(p3, "UpperTorso") or f25(p3, "Torso") or f25(p3, "HumanoidRootPart")
  end
  return f25(p3, "HumanoidRootPart")
end

local function f26(p4)
  if not p4 then
    return nil
  else
    local character = p4.Character
    if not character or not character.Parent then
      return nil
    else
      local v50 = v47[character]
      local humanoid = v50 and v50.__humanoid
      local humanoidRootPart = v50 and v50.HumanoidRootPart

      if not humanoid or humanoid.Parent ~= character then
        humanoid = character:FindFirstChildOfClass("Humanoid")
      end
      if not humanoid then
        return nil
      end
      if not humanoidRootPart or humanoidRootPart.Parent ~= character then
        humanoidRootPart = f25(character, "HumanoidRootPart")
      end
      if humanoid.Health <= 0 or not humanoidRootPart then
        return nil
      else
        local v51 = v47[character]
        v51.__humanoid = humanoid
        v51.HumanoidRootPart = humanoidRootPart
        return character, humanoid, humanoidRootPart
      end
    end
  end
end

local getPlayers = players:GetPlayers()
f1(players.PlayerAdded, function() getPlayers = players:GetPlayers() end)
f1(players.PlayerRemoving, function()
  task.defer(function() getPlayers = players:GetPlayers() end)
end)

local v9 = { "StageTeamSide", "Team", "TeamName", "TeamColor", "TeamId", "TeamID", "team" }

local function f28(p5)
  if not p5 then return nil end
  for index, value in ipairs(v9) do
    local getAttribute = p5:GetAttribute(value)
    if getAttribute ~= nil then
      return value .. "=" .. tostring(getAttribute)
    else
      local findFirstChild2 = p5:FindFirstChild(value)
      if findFirstChild2 and findFirstChild2:IsA("ValueBase") then
        return value .. "=" .. tostring(findFirstChild2.Value)
      end
    end
  end
  return nil
end

local function f29(p6)
  if not p6 then
    return nil
  else
    local v54 = f28(p6) or f28(p6.Character)
    if v54 then
      return v54
    else
      local v55 = f28((p6:FindFirstChild("leaderstats")))
      if v55 then return v55 end
      if not p6.Neutral then
        return "TeamColor=" .. tostring(p6.TeamColor)
      end
      return nil
    end
  end
end

local v10 = 0
local v11 = 0

local function f30()
  local v56 = os.clock()
  if v56 - v11 > 0.5 then
    local v57 = {}
    local count2 = 0
    for index2, value2 in ipairs(players:GetPlayers()) do
      local v58 = f29(value2)
      if v58 and not v57[v58] then
        v57[v58] = true
        count2 = count2 + 1
      end
    end
    v10 = count2
    v11 = v56
  end
  return v10
end

local function f31(p8)
  if not p8 or p8 == localPlayer then return false end
  if localPlayer.Team or p8.Team then
    return localPlayer.Team ~= nil and p8.Team ~= nil and localPlayer.Team == p8.Team
  else
    local v59 = f29(localPlayer)
    local v61 = f29(p8)
    if not v59 or not v61 then return false end
    if f30() < 2 then return false end
    return v59 == v61
  end
end

local v3 = setmetatable({}, { __mode = "k" })

local function v8(key3)
  if not key3 or key3 == localPlayer then
    return false
  else
    local v62 = os.clock()
    local v63 = v3[key3]
    if v63 and v62 - v63[1] < 0.5 then
      return v63[2]
    else
      local v64 = f31(key3)
      if v63 then
        v63[1] = v62
        v63[2] = v64
      else
        v3[key3] = { v62, v64 }
      end
      return v64
    end
  end
end

local function f3(p9)
  if not p9 or p9 == localPlayer then return false end
  if v4.TeamCheck and v8(p9) then return false end
  return true
end

local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
raycastParams.IgnoreWater = true

local v13 = setmetatable({}, { __mode = "k" })

local function v12(key4, p10)
  if not v4.WallCheck then
    return true
  else
    local position7 = currentCamera.CFrame.Position
    local character2 = localPlayer.Character
    local v65 = os.clock()
    local v66 = v13[key4]
    if v66 and v66.character == character2 and v65 - v66.time < 0.08 then
      return v66.visible
    else
      raycastParams.FilterDescendantsInstances = { character2, key4 }
      local v67 = workspaceService:Raycast(position7, p10.Position - position7, raycastParams) == nil
      v13[key4] = { character = character2, time = v65, visible = v67 }
      return v67
    end
  end
end

local function f32(p11)
  local v68 = currentCamera
  if not v68 then return nil end
  local viewportSize = v68.ViewportSize
  local v69 = viewportSize.Y * 0.5
  local v70 = viewportSize.X * 0.5
  local fovSize = p11 or v4.FOVSize
  local v71 = fovSize * fovSize
  local huge = math.huge
  local v72 = nil

  for index3, value3 in ipairs(getPlayers) do
    local v73, v74, v75 = f26(value3)
    if v73 and f3(value3) then
      local v76 = f2(v73)
      if v76 then
        local v77, v78 = v68:WorldToViewportPoint(v76.Position)
        if v78 and v77.Z > 0 then
          local v79 = v77.X - v70
          local v80 = v77.Y - v69
          local v81 = v79 * v79 + v80 * v80
          if v81 <= v71 and v81 < huge and v12(v73, v76) then
            v72 = value3
            huge = v81
          end
        end
      end
    end
  end
  return v72
end

local v14 = 0
local function f33()
  local v82 = os.clock()
  if v82 - v14 < v4.TriggerbotInterval then return end
  local character3 = localPlayer.Character
  if not character3 then return end
  local tool = character3:FindFirstChildOfClass("Tool")
  if not tool then return end
  v14 = v82
  pcall(function() tool:Activate() end)
  task.delay(0.03, function()
    if tool and tool.Parent == character3 then
      pcall(function() tool:Deactivate() end)
    end
  end)
end

local triggerbotFOV = nil
local uiStroke = nil
local v15 = 0
local v16 = nil

f1(runService.Heartbeat, function()
  if not v4.Triggerbot then
    v16 = nil
    if triggerbotFOV then triggerbotFOV.Visible = false end
    return
  else
    local v83 = triggerbotFOV
    local v84 = os.clock()
    if v84 - v15 >= 0.083333 then
      v15 = v84
      v16 = f32(v4.TriggerbotFOV)
    end
    local v85 = v16
    if v83 and uiStroke then
      local currentCamera2 = workspaceService.CurrentCamera
      if currentCamera2 and v4.TriggerbotFOVVisible then
        local viewportSize2 = currentCamera2.ViewportSize
        triggerbotFOV.Position = UDim2.fromOffset(viewportSize2.X / 2, viewportSize2.Y / 2)
        triggerbotFOV.Size = UDim2.fromOffset(v4.TriggerbotFOV * 2, v4.TriggerbotFOV * 2)
        triggerbotFOV.Visible = true
        uiStroke.Color = v85 and v4.TriggerbotFOVTargetColor or v4.TriggerbotFOVColor
        uiStroke.Transparency = 1 - math.clamp(v4.TriggerbotFOVTransparency, 0, 1)
      else
        triggerbotFOV.Visible = false
      end
    end
    if v85 then f33() end
  end
end)

local playerGui2 = localPlayer:WaitForChild("PlayerGui")
