Scriptname TownPortalCastScript extends ObjectReference

Quest Property TownPortalController Auto
ReferenceAlias Property Alias_MapMarker Auto
Keyword Property TownPortalStartKeyword Auto

GlobalVariable Property TownPortalMinDistance Auto
Message Property TownPortalCannotTravel Auto
Message Property TownPortalNoDestination Auto
Message Property TownPortalDestinationTooClose Auto

Event OnInit()
    ObjectReference returnMarker = Alias_MapMarker.GetReference()
    if returnMarker == None
        TownPortalNoDestination.Show()
        self.Delete()
        return
    endif

    if IsTooClose(returnMarker)
        TownPortalDestinationTooClose.Show()
        self.Delete()
        return
    endif

    self.SetAngle(0.0, 0.0, self.GetAngleZ())

    if TownPortalController.IsRunning()
        TownPortalController.SetStage(100)
    endif

    TownPortalStartKeyword.SendStoryEvent(\
        akLoc = returnMarker.GetCurrentLocation(), \
        akRef1 = self)
EndEvent

bool Function IsTooClose(ObjectReference akObjectRef)
    Cell targetCell = self.GetParentCell()
    Cell objectCell = akObjectRef.GetParentCell()
    if targetCell != objectCell
        if targetCell && targetCell.IsInterior() || objectCell && objectCell.IsInterior()
            return false
        endif
    endif

    return akObjectRef.GetDistance(self) <= TownPortalMinDistance.GetValue()
EndFunction
