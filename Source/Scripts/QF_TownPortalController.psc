;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_TownPortalController Extends Quest Hidden

;BEGIN ALIAS PROPERTY ReturnLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ReturnLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExitMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReturnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReturnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExitPortal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExitPortal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReturnPortal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReturnPortal Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Debug.Trace("Town Portal Controller: Stage 0 - Set up")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Debug.Trace("Town Portal Controller: Stage 10 - Go to town")
ReturnPortal.SetInactive()
PlayerRef.MoveTo(ReturnPortal)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("Town Portal Controller: Stage 20 - Return to original location")
ExitPortal.Destroy()
PlayerRef.MoveTo(ExitPortal)
ReturnPortal.Destroy()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
Debug.Trace("Town Portal Controller: Stage 100 - Shut down")
ExitPortal.Destroy()
ReturnPortal.Destroy()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property PlayerRef  Auto  

TownPortalActivator Property ExitPortal
    TownPortalActivator Function Get()
        return Alias_ExitPortal.GetReference() as TownPortalActivator
    EndFunction
EndProperty

TownPortalActivator Property ReturnPortal
    TownPortalActivator Function Get()
        return Alias_ReturnPortal.GetReference() as TownPortalActivator
    EndFunction
EndProperty
