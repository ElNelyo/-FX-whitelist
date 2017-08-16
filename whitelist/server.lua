

local WhiteList = {}







 local notwhitelisted = "Vous devez être whitelisted pour rejoindre ce server, rejoignez discord.gg/HY6D2UZ"
 local steamiderr = "Erreur: Impossible de récupérer votre steamID"
 local trouve = false 


 AddEventHandler("playerConnecting", function(playerName, setKickReason)

    local steamID = GetPlayerIdentifiers(source)[1] or false
     print("Whitelist: "..playerName.."["..steamID.."] tente de se connecter")


       if not steamID then

        setKickReason(steamiderr)
        CancelEvent()

        print("Whitelist: "..playerName.." a été kick, aucun IDSteam")


       end


       local result = MySQL.Sync.fetchAll('SELECT * FROM whitelist')

        for i=1, #result, 1 do
            local id   = result[i].identifier
        
            table.insert(WhiteList, tostring(id))
            --print ("Trouve dans la bdd : " ..id)
            --print ("Tente de se conencter : "..steamID)
        end

      for i=1, #WhiteList, 1 do
       --print(tostring(WhiteList[i]))
       --print(tostring(steamID))

          if(tostring(WhiteList[i]) == tostring(steamID))then
              trouve = true


         end



      end


      --print(trouve)
      if(trouve)then 
           print("Whitelist: "..playerName.."["..steamID.."]  a rejoins , trouve dans whitelist")
           trouve = false
           WhiteList = {}

                   
      else
                 setKickReason(notwhitelisted)
                    CancelEvent()

                    print("Whitelist: "..playerName.."["..steamID.."] a ete kick, non whiteliste ")
                    trouve = false
                    WhiteList = {}
                    return


                 

      end


end)