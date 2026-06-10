Global Const $CHECK_INTERVAL = 15000 ; 30 secondi
Global Const $REWARD_WAIT_TIME = 1800000 ; 30 minuti
Global Const $CARTO_MODE_SLEEP = 3600000 ; 1 ora
Global $ActionCounter = 0
Global $Gui_CartoMode ; Inizializzare opportunamente
Global $LEGIONARY_STONE_ID = 37810
Global $Gui_Legio
Global $BlockCount = 20
Global $RangeLimit = 1450

Func MoveandAggroVQ($aWaypoints)
    Local $timer = TimerInit()
    $BlockCount = 20
    For $Index = 0 To UBound($aWaypoints) - 1
        $RangeLimit = $aWaypoints[$Index][3]
        If TimerDiff($timer) >= $CHECK_INTERVAL Then
            $timer = TimerInit()
            If GetFoesToKill() = 0 Then
                If _IsCartoModeEnabled() Then
					SoundPlay("Sounds\CartoMode.wav")
					Sleep($CARTO_MODE_SLEEP)
                Else
                    SoundPlay("Sounds\MissionComplete.wav")
                    Sleep (3600000)
                    Return
                EndIf
            EndIf
        EndIf
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
        If $DeadOnTheRun Then
            CurrentAction("We died fighting at: " & $aWaypoints[$Index][2] & $ActionCounter & ", restarting waypoints.")
            $ActionCounter = 1
        	$Index = 0
        	$DeadOnTheRun = 0
            $BlockCount = 2; let's try and get back to our spot ASAP 
        EndIf
    Next
EndFunc

Func MoveandAggroVQWurm($aWaypoints)
    Local $timer = TimerInit()
    For $Index = 0 To UBound($aWaypoints) - 1
        If TimerDiff($timer) >= $CHECK_INTERVAL Then
            $timer = TimerInit()
            If GetFoesToKill() = 0 Then
                If _IsCartoModeEnabled() Then
					SoundPlay("Sounds\CartoMode.wav")
					Sleep($CARTO_MODE_SLEEP)
                Else
                    SoundPlay("Sounds\MissionComplete.wav")
                    Sleep (3600000)
                    Return
                EndIf
            EndIf
        EndIf
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
		Sleep(7000)
    Next
EndFunc

Func MoveandAggroVQReverse($aWaypoints)
    Local $timer = TimerInit()
    For $Index = UBound($aWaypoints) - 1 To 0 Step -1
        If TimerDiff($timer) >= $CHECK_INTERVAL Then
            $timer = TimerInit()
            If GetFoesToKill() = 0 Then
                If _IsCartoModeEnabled() Then
								SoundPlay("Sounds\CartoMode.wav")
								Sleep($CARTO_MODE_SLEEP)
                Else
                    SoundPlay("Sounds\MissionComplete.wav")
                    Return
                EndIf
            EndIf
        EndIf
        AggroMoveTo($aWaypoints[$Index][0], $aWaypoints[$Index][1], $aWaypoints[$Index][2] & $ActionCounter, $aWaypoints[$Index][3])
        $ActionCounter += 1
        If $DeadOnTheRun Then
            CurrentAction("We died fighting at: " & $aWaypoints[$Index][2] & $ActionCounter & ", restarting waypoints.")
            $ActionCounter = 1
        	$Index = UBound($aWaypoints) - 1
        	$DeadOnTheRun = 0
            $BlockCount = 2; let's try and get back to our spot ASAP 
        EndIf
    Next
    If GetFoesToKill() <> 0 Then
        SoundPlay("Sounds\ManualCheck.wav")
		Sleep (3600000)
    EndIf
EndFunc

Func _IsCartoModeEnabled()
    Return GUICtrlRead($Gui_CartoMode) = $GUI_CHECKED
EndFunc

Func UseLegionaryStone()
    While GUICtrlRead($Gui_Legio) = $GUI_CHECKED

        UseItem($LEGIONARY_STONE_ID)

        Sleep(600000)
    WEnd
EndFunc

Func AggroMoveTo($x, $y, $s = "", $z = 1450)

	CurrentAction("Moving to Waypoint:" & $s)
	$random = 50
	$iBlocked = 0
	$boolOpenChests = _IsOpenChestsEnabled()
	$boolUseConset = _IsConsetEnabled()

	Move($x, $y, $random)

	$lMe = GetAgentByID(-2)
	$coordsX = DllStructGetData($lMe, "X")
	$coordsY = DllStructGetData($lMe, "Y")

	Do
		If $DeadOnTheRun Then ExitLoop
		If $boolUseConset Then UseConset()
		RndSleep(250)
		$oldCoordsX = $coordsX
		$oldCoordsY = $coordsY
		$nearestenemy = GetNearestEnemyToAgent(-2, $z)
		If $nearestenemy <> 0 Then
			$lDistance = GetDistance($nearestenemy, -2)
			If $lDistance < $z And _Vanquisher_AgentID($nearestenemy) <> 0 Then
				Fight($z, $s)
				$iBlocked = 0
				Move($x, $y, $random)
			EndIf
		EndIf
		If $boolOpenChests Then 
			CheckForChest()
		EndIf


		If $DeadOnTheRun Then ExitLoop
		RndSleep(250)
		$lMe = GetAgentByID(-2)
		$coordsX = DllStructGetData($lMe, "X")
		$coordsY = DllStructGetData($lMe, "Y")
		If ComputeDistance($coordsX, $coordsY, $x, $y) >= 250 Then
			Move($x, $y, $random)
		EndIf
		If $oldCoordsX = $coordsX And $oldCoordsY = $coordsY Then
			$iBlocked += 1
			Move($coordsX, $coordsY, 500)
			RndSleep(350)
			Move($x, $y, $random)
		EndIf
		If $boolOpenChests Then 
			CheckForChest()
		EndIf
	Until ComputeDistance($coordsX, $coordsY, $x, $y) < 250 Or $iBlocked > $BlockCount
EndFunc   ;==>AggroMoveTo


Func _IsOpenChestsEnabled()
    If $Bool_OpenChests Then Return True
    Return GUICtrlRead($Gui_OpenChests) = $GUI_CHECKED
EndFunc

Func _IsConsetEnabled()
    If $Bool_Conset Then Return True
    Return GUICtrlRead($Gui_Conset) = $GUI_CHECKED
EndFunc

Func GetMaxPartySize($mapid)
    Return 8
EndFunc
