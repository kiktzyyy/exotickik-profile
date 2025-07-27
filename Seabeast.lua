        spawn(function()
			pcall(function()
				while wait() do
					if _G.Settings.SeaStack["Auto Attack Seabeasts"] then
						if (game:GetService("Workspace")):FindFirstChild("SeaBeasts") then
							for i, v in pairs((game:GetService("Workspace")).SeaBeasts:GetChildren()) do
								if CheckSeaBeast() then
									repeat
										(game:GetService("RunService")).Heartbeat:wait();
										CFrameSeaBeast = v.HumanoidRootPart.CFrame * CFrame.new(0, 200, 0);
										if (CFrameSeaBeast.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position).Magnitude <= 400 then
											_G.SeaSkill = true;
										else
											_G.SeaSkill = false;
										end;
										AutoHaki();
										Skillaimbot = true;
										AimBotSkillPosition = v.HumanoidRootPart.CFrame.Position;
										if SBAttacking then
											topos(CFrameSeaBeast * CFrame.new(math.random(100, 300), 100, math.random(100, 300)));
										else
											topos(CFrameSeaBeast * CFrame.new(0, 100, 0));
										end;
									until not _G.Settings.SeaEvent["Auto Farm Seabeasts"] or CheckSeaBeast() == false or (not v:FindFirstChild("Humanoid")) or (not v:FindFirstChild("HumanoidRootPart")) or v.Humanoid.Health < 0 or (not v.Parent);
									Skillaimbot = false;
									_G.SeaSkill = false;
								else
									Skillaimbot = false;
									_G.SeaSkill = false;
								end;
							end;
						end;
					end;
				end;
			end);
		end);
