;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_TownPortalUpdateLocation Extends Quest Hidden

;BEGIN ALIAS PROPERTY Town
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Town Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VisibleMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VisibleMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerRefType
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarkerRefType Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("Town Portal: Update Location")

ObjectReference mapMarker = Alias_MapMarker.GetReference()
if mapMarker != None && mapMarker.IsMapMarkerVisible() && mapMarker.CanFastTravelToMarker()
    MainQuest_TargetMarker.ForceRefTo(mapMarker)
else
    TownPortalDiscoveryKeyword.SendStoryEvent(Alias_Town.GetLocation())
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property MainQuest_TargetMarker  Auto  

Keyword Property TownPortalDiscoveryKeyword  Auto  
