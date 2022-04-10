Scriptname TownPortalActivator extends ObjectReference

Actor Property PlayerRef Auto
Quest Property TownPortalController Auto
Light Property TownPortalLight Auto
Activator Property TriggerBase Auto

ObjectReference Property LightRef Auto
TownPortalTrigger Property TriggerRef Auto
int Property TargetStage Auto

Function SetInactive()
    GotoState("Inactive")
    TriggerRef.GotoState("Inactive")
EndFunction

Function Destroy()
    TriggerRef.DisableNoWait()
    TriggerRef.Delete()
    LightRef.Delete()
    self.DisableNoWait(true)
    self.Delete()
EndFunction

Event OnInit()
    TriggerRef = self.PlaceAtMe(TriggerBase) as TownPortalTrigger
EndEvent

Auto State Active

    Event OnBeginState()
        self.PlayAnimation("playAnim02")
        RegisterForSingleUpdate(2.0)
    EndEvent

    Event OnLoad()
        self.PlayAnimation("playAnim02")
        RegisterForSingleUpdate(2.0)
    EndEvent

    Event OnUpdate()
        if LightRef == None
            LightRef = self.PlaceAtMe(TownPortalLight)
        endif

        LightRef.EnableNoWait()
        TriggerRef.GotoState("Active")
    EndEvent

    Event OnActivate(ObjectReference akActionRef)
        if akActionRef == PlayerRef
            TownPortalController.SetStage(TargetStage)
        endif
    EndEvent

EndState

State Inactive

    Event OnBeginState()
        self.PlayAnimation("playAnim01")
        LightRef.DisableNoWait()
    EndEvent

EndState
