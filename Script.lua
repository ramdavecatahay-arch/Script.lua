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

local v1, v2 = pcall(function()
  return game:HttpGet("https://raw.githubusercontent.com/masterhubgg/Master-Hub-Status/refs/heads/main/status2.txt?nocache="
    .. tostring(os.time()))
end)

local f1, f2, f3, v3, f4, f5, f6, f7, f8, f9, f10, f11, f12, f13, f14, f15, f16, f17, f18, f19,
  f20, f21, f22, f23, f24, localPlayer, currentCamera, v4, v5, f25, f26, f27, v6, getPlayers,
  v7, v8, v9, f28, f29, v10, v11, f30, f31, v12, raycastParams, v13, f32, v14, f33,
  triggerbotFOV, uiStroke, v15, v16, playerVisualizationTool, fovCircle, uiStroke2, aimToggle,
  v17, v18, position, position2, mainWindow, tabStrip, v19, position3, position4,
  scrollingFrame, f34, f35, f36, uiListLayout, f37, v20, v21, v22, f38, f39, f40, v23, v24, f41,
  f42, v25, fov, uiStroke3, f43, f45, v26, v27, fpsCounter, textLabel, mastersamFPSOverlay,
  connect, v28, v29, f46, v30, terrain, v31, v32, v33, v34, v35, v36, connect2, connect3, v37,
  v38, f47, f48, f49, f50, v39, v40, f51, f52, f53, v41, v42, v43, v44, menuReopenButton, v45,
  v46, position5, position6

if (v1 and v2:gsub("%s+", "") or "offline") ~= "online" then
  local masterHubMaintenance = Instance.new("ScreenGui")
  masterHubMaintenance.Name = "MasterHubMaintenance"
  masterHubMaintenance.ResetOnSpawn = false
  masterHubMaintenance.IgnoreGuiInset = true
  masterHubMaintenance.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  masterHubMaintenance.Parent = players.LocalPlayer:WaitForChild("PlayerGui")

  local frame = Instance.new("Frame")
  frame.Size = UDim2.fromScale(1, 1)
  frame.BackgroundColor3 = Color3.fromRGB(8, 9, 13)
  frame.BackgroundTransparency = 0.08
  frame.BorderSizePixel = 0
  frame.Parent = masterHubMaintenance

  local frame2 = Instance.new("Frame")
  frame2.AnchorPoint = Vector2.new(0.5, 0.5)
  frame2.Position = UDim2.fromScale(0.5, 0.5)
  frame2.Size = UDim2.fromOffset(340, 110)
  frame2.BackgroundColor3 = Color3.fromRGB(13, 15, 21)
  frame2.BorderSizePixel = 0
  frame2.Parent = frame

  local uiStroke4 = Instance.new("UIStroke")
  uiStroke4.Color = Color3.fromRGB(255, 92, 190)
  uiStroke4.Thickness = 1
  uiStroke4.Transparency = 0.15
  uiStroke4.Parent = frame2

  local textLabel2 = Instance.new("TextLabel")
  textLabel2.Size = UDim2.new(1, 0, 0, 36)
  textLabel2.Position = UDim2.fromOffset(0, 18)
  textLabel2.BackgroundTransparency = 1
  textLabel2.Text = "🔧  UNDER MAINTENANCE"
  textLabel2.TextColor3 = Color3.fromRGB(255, 92, 190)
  textLabel2.TextSize = 16
  textLabel2.Font = Enum.Font.SciFi
  textLabel2.TextXAlignment = Enum.TextXAlignment.Center
  textLabel2.Parent = frame2

  local textLabel3 = Instance.new("TextLabel")
  textLabel3.Size = UDim2.new(1, 0, 0, 24)
  textLabel3.Position = UDim2.fromOffset(0, 58)
  textLabel3.BackgroundTransparency = 1
  textLabel3.Text = "MasterHub is currently down. Check back soon."
  textLabel3.TextColor3 = Color3.fromRGB(160, 168, 195)
  textLabel3.TextSize = 12
  textLabel3.Font = Enum.Font.Code
  textLabel3.TextXAlignment = Enum.TextXAlignment.Center
  textLabel3.Parent = frame2

  error("[MasterHub] Script is under maintenance.")
  return
else
  localPlayer = players.LocalPlayer
  localPlayer:WaitForChild("PlayerGui")

  Color3.fromRGB(255, 255, 255)
  currentCamera = workspaceService.CurrentCamera

  v4 = {
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
    UsageWebhook = "https://discord.com/api/webhooks/1545688427112964108/O0gPas2VOGtbf-RukQzsK_GHlW9bpANb6DbO3MHzYgclU8PM4Ve4MhMFvObEeOdPHwkM",
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

  v5 = {}
  local v47 = setmetatable({}, { __mode = "k" })

  function f1(p1, p2)
    local connect4 = p1:Connect(p2)
    table.insert(v5, connect4)
    return connect4
  end

  function f2(p3)
    if v4.AimPart == "Head" then
      return f25(p3, "Head")
    end

    if v4.AimPart == "Torso" then
      return f25(p3, "UpperTorso") or f25(p3, "Torso") or f25(p3, "HumanoidRootPart")
    end

    return f25(p3, "HumanoidRootPart")
  end

  function f25(key, key2)
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

  function f26(p4)
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

  function f27(text)
    local playerGui = localPlayer:FindFirstChildOfClass("PlayerGui")
    local textLabel4

    if not playerGui then
      return
    else
      local playerToolNotifications = playerGui:FindFirstChild("PlayerToolNotifications")

      if not playerToolNotifications then
        return
      else
        textLabel4 = Instance.new("TextLabel")
        textLabel4.Size = UDim2.new(0, 260, 0, 40)
        textLabel4.BackgroundColor3 = Color3.fromRGB(13, 15, 21)
        textLabel4.BackgroundTransparency = 0.05
        textLabel4.BorderSizePixel = 0
        textLabel4.TextColor3 = Color3.fromRGB(240, 243, 250)
        textLabel4.TextSize = 14
        textLabel4.Font = Enum.Font.BuilderSansMedium
        textLabel4.Text = text
        textLabel4.Parent = playerToolNotifications

        local getChildren = playerToolNotifications:GetChildren()

        if #getChildren > 4 then
          local v52 = #getChildren - 4
          local count = 0

          while true do
            count = 1 + count

            if not (count <= v52) then
              break
            end

            local v53 = count

            if getChildren[v53]:IsA("TextLabel") then
              getChildren[v53]:Destroy()
            end
          end
        end

        if playerToolNotifications:FindFirstChildOfClass("UIListLayout") then
          textLabel4.LayoutOrder = math.floor(os.clock() * 1000)
        end

        task.delay(2, function()
          if textLabel4.Parent then
            textLabel4:Destroy()
          end
        end)

        return
      end
    end
  end

  v6 = {}
  getPlayers = players:GetPlayers()

  f1(players.PlayerAdded, function() getPlayers = players:GetPlayers() end)

  f1(players.PlayerRemoving, function()
    task.defer(function() getPlayers = players:GetPlayers() end)
  end)

  v7 = nil
  v8 = nil
  v9 = { "StageTeamSide", "Team", "TeamName", "TeamColor", "TeamId", "TeamID", "team" }

  function f28(p5)
    if not p5 then
      return nil
    end

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

  function f29(p6)
    if not p6 then
      return nil
    else
      local v54 = f28(p6) or f28(p6.Character)

      if v54 then
        return v54
      else
        local v55 = f28((p6:FindFirstChild("leaderstats")))

        if v55 then
          return v55
        end

        if not p6.Neutral then
          return "TeamColor=" .. tostring(p6.TeamColor)
        end

        return nil
      end
    end
  end

  v10 = 0
  v11 = 0

  function f30()
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

  function v7(p7)
    if p7 and p7.Team then
      return "team:" .. p7.Team.Name
    end

    return f29(p7)
  end

  function f31(p8)
    if not p8 or p8 == localPlayer then
      return false
    end

    if localPlayer.Team or p8.Team then
      return localPlayer.Team ~= nil and p8.Team ~= nil and localPlayer.Team == p8.Team
    else
      local v59 = f29(localPlayer)
      local v60 = not v59
      local v61 = f29(p8)

      if v60 or not v61 then
        return false
      end

      if f30() < 2 then
        return false
      end

      return v59 == v61
    end
  end

  v3 = setmetatable({}, { __mode = "k" })

  function f3(p9)
    if not p9 or p9 == localPlayer then
      return false
    end

    if v4.TeamCheck and v8(p9) then
      return false
    end

    return true
  end

  function v8(key3)
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

  v12 = nil

  raycastParams = RaycastParams.new()
  raycastParams.FilterType = Enum.RaycastFilterType.Exclude
  raycastParams.IgnoreWater = true

  v13 = setmetatable({}, { __mode = "k" })

  function v12(key4, p10)
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

        local v67 = workspaceService:Raycast(position7, p10.Position - position7, raycastParams)
          == nil

        v13[key4] = { character = character2, time = v65, visible = v67 }
        return v67
      end
    end
  end

  function f32(p11)
    local v68 = currentCamera

    if not v68 then
      return nil
    else
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
  end

  v14 = 0

  function f33()
    local v82 = os.clock()

    if v82 - v14 < v4.TriggerbotInterval then
      return
    end

    local character3 = localPlayer.Character

    if not character3 then
      return
    end

    local tool = character3:FindFirstChildOfClass("Tool")

    if not tool then
      return
    end

    v14 = v82
    pcall(function() tool:Activate() end)

    task.delay(0.03, function()
      if tool and tool.Parent == character3 then
        pcall(function() tool:Deactivate() end)
      end
    end)
  end

  triggerbotFOV = nil
  uiStroke = nil
  v15 = 0
  v16 = nil

  f1(runService.Heartbeat, function()
    if not v4.Triggerbot then
      v16 = nil

      if triggerbotFOV then
        triggerbotFOV.Visible = false
      end

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

          local v86 = uiStroke
          v86.Color = v85 and v4.TriggerbotFOVTargetColor or v4.TriggerbotFOVColor

          uiStroke.Transparency = 1 - math.clamp(v4.TriggerbotFOVTransparency, 0, 1)
        else
          triggerbotFOV.Visible = false
        end
      end

      if v85 then
        f33()
      end

      return
    end
  end)

  local playerGui2 = localPlayer:WaitForChild("PlayerGui")
  local playerVisualizationTool2 = playerGui2:FindFirstChild("PlayerVisualizationTool")

  if playerVisualizationTool2 then
    playerVisualizationTool2:Destroy()
  end

  playerVisualizationTool = Instance.new("ScreenGui")
  playerVisualizationTool.Name = "PlayerVisualizationTool"
  playerVisualizationTool.ResetOnSpawn = false
  playerVisualizationTool.IgnoreGuiInset = true
  playerVisualizationTool.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
  playerVisualizationTool.Enabled = true
  playerVisualizationTool.Parent = playerGui2

  triggerbotFOV = Instance.new("Frame")
  triggerbotFOV.Name = "TriggerbotFOV"
  triggerbotFOV.AnchorPoint = Vector2.new(0.5, 0.5)
  triggerbotFOV.BackgroundTransparency = 1
  triggerbotFOV.BorderSizePixel = 0
  triggerbotFOV.Size = UDim2.fromOffset(v4.TriggerbotFOV * 2, v4.TriggerbotFOV * 2)
  triggerbotFOV.Visible = false
  triggerbotFOV.Parent = playerVisualizationTool

  Instance.new("UICorner", triggerbotFOV).CornerRadius = UDim.new(1, 0)

  uiStroke = Instance.new("UIStroke")
  uiStroke.Thickness = 1
  uiStroke.Color = v4.TriggerbotFOVColor
  uiStroke.Transparency = 1 - v4.TriggerbotFOVTransparency
  uiStroke.Parent = triggerbotFOV

  function f44()
    playerVisualizationTool.Enabled = true
  end

  local playerToolNotifications2 = Instance.new("Frame")
  playerToolNotifications2.Name = "PlayerToolNotifications"
  playerToolNotifications2.AnchorPoint = Vector2.new(1, 1)
  playerToolNotifications2.Position = UDim2.new(1, -16, 1, -16)
  playerToolNotifications2.Size = UDim2.new(0, 260, 0, 200)
  playerToolNotifications2.BackgroundTransparency = 1
  playerToolNotifications2.Parent = playerVisualizationTool

  local uiListLayout2 = Instance.new("UIListLayout")
  uiListLayout2.VerticalAlignment = Enum.VerticalAlignment.Bottom
  uiListLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Right
  uiListLayout2.Padding = UDim.new(0, 8)
  uiListLayout2.Parent = playerToolNotifications2

  fovCircle = Instance.new("Frame")
  fovCircle.Name = "FOVCircle"
  fovCircle.AnchorPoint = Vector2.new(0.5, 0.5)
  fovCircle.BackgroundTransparency = 1
  fovCircle.Size = UDim2.fromOffset(v4.FOVSize * 2, v4.FOVSize * 2)
  fovCircle.Parent = playerVisualizationTool

  local uiCorner = Instance.new("UICorner")
  uiCorner.CornerRadius = UDim.new(1, 0)
  uiCorner.Parent = fovCircle

  uiStroke2 = Instance.new("UIStroke")
  uiStroke2.Thickness = 1.5
  uiStroke2.Color = Color3.fromRGB(255, 90, 170)
  uiStroke2.Transparency = 0.2
  uiStroke2.Parent = fovCircle

  aimToggle = Instance.new("TextButton")
  aimToggle.Name = "AimToggle"
  aimToggle.AnchorPoint = Vector2.new(0, 1)
  aimToggle.Position = UDim2.new(0, 75, 1, -15)
  aimToggle.Size = UDim2.fromOffset(48, 48)

  aimToggle.BackgroundColor3 = v4.TrackingEnabled and Color3.fromRGB(70, 255, 150)
    or Color3.fromRGB(235, 65, 65)

  aimToggle.Text = "AIM"
  aimToggle.TextColor3 = Color3.new(1, 1, 1)
  aimToggle.TextSize = 12
  aimToggle.Font = Enum.Font.BuilderSansBold
  aimToggle.AutoButtonColor = false
  aimToggle.Visible = false
  aimToggle.Parent = nil

  Instance.new("UICorner", aimToggle).CornerRadius = UDim.new(1, 0)

  local uiStroke5 = Instance.new("UIStroke")
  uiStroke5.Color = Color3.fromRGB(255, 255, 255)
  uiStroke5.Thickness = 2
  uiStroke5.Transparency = 0.35
  uiStroke5.Parent = aimToggle

  v17 = false
  v18 = false
  position = nil
  position2 = nil

  f1(aimToggle.InputBegan, function(p12)
    local v87 = p12.UserInputType == Enum.UserInputType.MouseButton1
      or p12.UserInputType == Enum.UserInputType.Touch

    local connect5

    if v87 then
      v17 = true
      v18 = false
      position = p12.Position
      position2 = aimToggle.Position

      connect5 = nil

      connect5 = p12.Changed:Connect(function()
        if p12.UserInputState == Enum.UserInputState.End then
          v17 = false
          connect5:Disconnect()
        end
      end)
    end
  end)

  f1(userInputService.InputChanged, function(p13)
    if v17
      and (p13.UserInputType == Enum.UserInputType.MouseMovement
        or p13.UserInputType == Enum.UserInputType.Touch) then
      local v88 = p13.Position - position

      if math.abs(v88.X) > 4 or math.abs(v88.Y) > 4 then
        v18 = true
      end

      aimToggle.Position = UDim2.new(
        position2.X.Scale, position2.X.Offset + v88.X, position2.Y.Scale,
        position2.Y.Offset + v88.Y
      )
    end
  end)

  mainWindow = In
