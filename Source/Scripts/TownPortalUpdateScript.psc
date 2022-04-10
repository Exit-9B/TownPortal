Scriptname TownPortalUpdateScript extends ReferenceAlias

Keyword Property LocTypeCity Auto
Keyword Property LocTypeTown Auto

Keyword Property TownPortalUpdateKeyword Auto

LeveledItem Property LItemSpellVendorScrolls75 Auto
LeveledItem Property LItemSpellTomes75Conjuration Auto
LeveledItem Property LItemSpellTomes75AllConjuration Auto

LeveledItem Property TownPortalLItemScroll Auto
LeveledItem Property TownPortalLItemSpellTome Auto

GlobalVariable Property TownPortalVersionCurrent Auto
GlobalVariable Property TownPortalVersionLastKnown Auto

Event OnInit()
    RunUpdates()
EndEvent

Event OnPlayerLoadGame()
    RunUpdates()
EndEvent

Function RunUpdates()
    Debug.Trace("Town Portal: Checking for updates")

    CheckForVersionUpdates(TownPortalVersionLastKnown.GetValueInt())
    TownPortalVersionLastKnown.SetValueInt(TownPortalVersionCurrent.GetValueInt())

    CheckInTown()
EndFunction

Function CheckForVersionUpdates(int aiLastKnownVersion)
    if aiLastKnownVersion < 10000
        LItemSpellVendorScrolls75.AddForm(TownPortalLItemScroll, 1, 1)
        LItemSpellTomes75Conjuration.AddForm(TownPortalLItemSpellTome, 1, 1)
        LItemSpellTomes75AllConjuration.AddForm(TownPortalLItemSpellTome, 1, 1)
    endif
EndFunction

Function CheckInTown()
    Actor playerRef = self.GetActorReference()
    Location currentLoc = playerRef.GetCurrentLocation()

    if currentLoc.HasKeyword(LocTypeCity) || currentLoc.HasKeyword(LocTypeTown)
        TownPortalUpdateKeyword.SendStoryEvent(currentLoc)
    endif
EndFunction
