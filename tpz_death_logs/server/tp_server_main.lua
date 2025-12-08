local TPZ = exports.tpz_core:getCoreAPI()

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_death_logs:server:trigger")
AddEventHandler("tpz_death_logs:server:trigger", function(deathReason, deathCauseHash, killedByPlayer, killedByWeapon)
  local _source = source

  if _source == nil then return end

  local xPlayer = TPZ.GetPlayer(_source)

  if not xPlayer.loaded() then 
    return
  end

  local identifier     = xPlayer.getIdentifier()
  local charIdentifier = xPlayer.getCharacterIdentifier()
  local fullname       = xPlayer.getFirstName() .. ' ' .. xPlayer.getLastName()
  local steamName      = GetPlayerName(_source)

  if killedByPlayer ~= nil and GetPlayerName(tonumber(killedByPlayer)) ~= nil then 

    local tPlayer = TPZ.GetPlayer(tonumber(killedByPlayer))

    if tPlayer.loaded() then 
      local tfullname  = tPlayer.getFirstName() .. ' ' .. tPlayer.getLastName()
      killedByPlayer   = tfullname .. '( Steam Name: ' .. GetPlayerName(tonumber(killedByPlayer)) .. ', Online Id: ' .. killedByPlayer .. ' )'
    end

  end

  local webhook        = 'https://discord.com/api/webhooks/1443341878543122664/TS6rkZzk3lKAB1_ArOXAxqe28LqWgbjPNcdk5wE_-MIrUtR6hMzsjpR5ekatJrRtsAss'
  local description    = string.format('Death Reason: %s\nDeath Cause Hash: %s\nKilled By: %s\nKilled By Weapon: %s', deathReason, deathCauseHash, killedByPlayer, killedByWeapon)
  TPZ.SendToDiscordWithPlayerParameters(webhook, "", _source, steamName, fullname, identifier, charIdentifier, description, 10038562)
end)
