local TPZ = exports.tpz_core:getCoreAPI()

-----------------------------------------------------------
--[[ Events  ]]--
-----------------------------------------------------------

RegisterServerEvent("tpz_death_logs:server:trigger")
AddEventHandler("tpz_death_logs:server:trigger", function(deathReason, deathCauseHash, killedByPlayer, killedByWeapon)
  local _source        = source
  local xPlayer        = TPZ.GetPlayer(_source)
  local identifier     = xPlayer.getIdentifier()
  local charIdentifier = xPlayer.getCharacterIdentifier()
  local fullname       = xPlayer.getFirstName() .. ' ' .. xPlayer.getLastName()
  local steamName      = GetPlayerName(_source)

  if killedByPlayer ~= nil then 

    local tPlayer    = TPZ.GetPlayer(tonumber(killedByPlayer))
    local tfullname  = tPlayer.getFirstName() .. ' ' .. tPlayer.getLastName()
    killedByPlayer   = tfullname .. '( Steam Name: ' .. GetPlayerName(tonumber(killedByPlayer)) .. ', Online Id: ' .. killedByPlayer .. ' )'
  end

  local webhook        = 'https://discord.com/api/webhooks/1438773392688812162/0AQN4585qQETdLruSONuUqDfr44mNe5K1HBr65RiPe9yFxp9W1zbP5uXyo2fcL6bCr3Z'
  local description    = string.format('Death Reason: %s\nDeath Cause Hash: %s\nKilled By: %s\nKilled By Weapon: %s', deathReason, deathCauseHash, killedByPlayer, killedByWeapon)
  TPZ.SendToDiscordWithPlayerParameters(webhook, "", _source, steamName, fullname, identifier, charIdentifier, description, 10038562)
end)
