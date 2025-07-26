	spawn(function()
		pcall(function()
			while wait(0.2) do
				if game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
					TimeRaid:SetDesc(game:GetService("Players").LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Text)
				else
					TimeRaid:SetDesc("Wait For Raid")
				end
			end
		end)
	end)
	spawn(function()
		pcall(function()
			while wait(0.2) do
				if game.Workspace.Map.RaidMap:FindFirstChild("RaidIsland5") then
					Island:SetDesc("🏝️ Island 5")
				elseif game.Workspace.Map.RaidMap:FindFirstChild("RaidIsland4") then
					Island:SetDesc("🏝️ Island 4")
				elseif game.Workspace.Map.RaidMap:FindFirstChild("RaidIsland3") then
					Island:SetDesc("🏝️ Island 3")
				elseif game.Workspace.Map.RaidMap:FindFirstChild("RaidIsland2") then
					Island:SetDesc("🏝️ Island 2")
				elseif game.Workspace.Map.RaidMap:FindFirstChild("RaidIsland1") then
					Island:SetDesc("🏝️ Island 1")
				else
					Island:SetDesc("Start Raid")
				end
			end
		end)
	end)
	print("0")
	function ChechRaidMapIsland(island)
		return game.Workspace.Map.RaidMap:FindFirstChild(island);
	end;
	function NextRaidIsland()
		local RaidPos = CFrame.new(0, 35, 0);
		if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
			if (game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 5") then
				topos(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 5")).CFrame * RaidPos);
			elseif (game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 4") then
				topos(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 4")).CFrame * RaidPos);
			elseif (game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 3") then
				topos(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 3")).CFrame * RaidPos);
			elseif (game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 2") then
				topos(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 2")).CFrame * RaidPos);
			elseif (game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 1") then
				topos(((game:GetService("Workspace"))._WorldOrigin.Locations:FindFirstChild("Island 1")).CFrame * RaidPos);
			end;
		end;
	end;
	function CheckMonRaids()
		for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
			if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
				return true;
			else
				return false;
			end;
		end;
	end;
	spawn(function()
		pcall(function()
			while wait(0.2) do
				if _G.Settings.Raid["Auto Raid"] then
					if (game:GetService("Players")).LocalPlayer.PlayerGui.Main.TopHUDList.RaidTimer.Visible == true then
						if CheckMonRaids() then
							for i, v in pairs((game:GetService("Workspace")).Enemies:GetChildren()) do
								if v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and v.Humanoid.Health > 0 then
									if (v.HumanoidRootPart.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude <= 300 then
										pcall(function()
											repeat
												wait();
												Attack();
												EquipWeapon(_G.Settings.Main["Selected Weapon"]);
												topos(v.HumanoidRootPart.CFrame * Pos);
												v.HumanoidRootPart.CanCollide = false;
												v.Humanoid.WalkSpeed = 0;
												v.Head.CanCollide = false;
												v.HumanoidRootPart.Size = Vector3.new(1, 1, 1);
											until not _G.Settings.Raid["Auto Raid"] or (not v.Parent) or v.Humanoid.Health <= 0;
										end);
									end;
								end;
							end;
						else
							NextRaidIsland();
						end;
					end;
				end;
			end;
		end);
	end);
	Raidslist = {};
	RaidsModule = require(game.ReplicatedStorage.Raids);
	for i, v in pairs(RaidsModule.raids) do
		table.insert(Raidslist, v);
	end;
	for i, v in pairs(RaidsModule.advancedRaids) do
		table.insert(Raidslist, v);
	end;
