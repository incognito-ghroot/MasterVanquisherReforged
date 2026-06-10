;~ #include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQSAMPLE()
	If GetMapID() = $ShadowsPassage_Map Then

		Local $aWaypoints[6][4] = [ [3396, 16639, " ", $vqrange] _
		, [2094, 18885, " ", $vqrange] _
		, [61, 18889, " ", $vqrange] _
		, [-682, 13737, " ", $vqrange] _
		, [-3699, 14519, " ", $vqrange] _
		, [-4255, 16101, " ", $vqrange] ]

		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

    EndIf
EndFunc

