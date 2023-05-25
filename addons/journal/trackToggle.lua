--[[
Copyright 2012-2023 João Cardoso
All Rights Reserved
--]]

local MODULE =  ...
local ADDON, Addon = MODULE:match('[^_]+'), _G[MODULE:match('[^_]+')]
local Toggle = Addon:NewModule('TrackToggle', CreateFrame('CheckButton', ADDON .. 'TrackToggle', PetJournal, 'InterfaceOptionsCheckButtonTemplate'))

function Toggle:OnEnable()
	self:Update()
	self:SetScript('OnClick', self.OnClick)
	self:RegisterSignal('OPTIONS_CHANGED', 'Update')
	self.Text:SetText(LibStub('AceLocale-3.0'):GetLocale(ADDON).TrackPets)
	self:SetPoint('RIGHT', CollectMeOpen2Button or PetJournalFindBattle, 'LEFT', -self.Text:GetWidth() - 15, -1)
end

function Toggle:OnClick()
	Addon.sets.trackPets = self:GetChecked()
	Addon:SendSignal('OPTIONS_CHANGED')
end

function Toggle:Update()
	self:SetChecked(Addon.sets.trackPets)
end
