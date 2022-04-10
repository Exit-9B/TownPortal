Scriptname TownPortalDiscoveryPlayerScript extends ReferenceAlias

LocationAlias Property Alias_Town Auto
Keyword Property TownPortalUpdateKeyword Auto

Event OnInit()
    GotoState("Discovery")
EndEvent

State Discovery

    Event OnBeginState()
        RegisterForTrackedStatsEvent()
    EndEvent

    Event OnTrackedStatsEvent(string asStatFilter, int aiStatValue)
        if asStatFilter == "Locations Discovered"
            Location town = Alias_Town.GetLocation()
            GetOwningQuest().Stop()
            TownPortalUpdateKeyword.SendStoryEvent(town)
        endif
    EndEvent

    Event OnLocationChange(Location akOldLoc, Location akNewLoc)
        if !GetReference().IsInLocation(Alias_Town.GetLocation())
            GetOwningQuest().Stop()
        endif
    EndEvent

EndState
