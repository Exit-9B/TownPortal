;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_TownPortalEnterTown Extends Quest Hidden

;BEGIN ALIAS PROPERTY Town
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Town Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("Town Portal: Enter Town")
TownPortalUpdateKeyword.SendStoryEvent(Alias_Town.GetLocation())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property TownPortalUpdateKeyword  Auto  
