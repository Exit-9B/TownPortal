Scriptname TownPortalTrigger extends ObjectReference

Actor Property PlayerRef Auto
ReferenceAlias Property Alias_Portal Auto

TownPortalActivator Property Portal
    TownPortalActivator Function Get()
        return Alias_Portal.GetReference() as TownPortalActivator
    EndFunction
EndProperty

Function SetActive()
    if Portal.GetState() != "Active"
        Portal.GotoState("Active")
    endif
EndFunction

State Active

    Event OnBeginState()
        if PlayerRef.GetDistance(self) < 128.0
            Portal.Activate(PlayerRef)
        endif
    EndEvent

    Event OnTriggerEnter(ObjectReference akActionRef)
        Portal.Activate(akActionRef)
    EndEvent

EndState

Auto State Inactive

    Event OnBeginState()
        if Portal.GetState() != "Active"
            RegisterForSingleUpdate(1.0)
        endif
    EndEvent

    Event OnUpdate()
        if PlayerRef.GetDistance(self) > 256.0
            SetActive()
        else
            RegisterForSingleUpdate(1.0)
        endif
    EndEvent

    Event OnTriggerLeave(ObjectReference akActionRef)
        if akActionRef == PlayerRef
            SetActive()
        endif
    EndEvent

EndState