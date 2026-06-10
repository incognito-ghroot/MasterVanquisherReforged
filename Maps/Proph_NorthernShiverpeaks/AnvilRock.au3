#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQAnvilRock()

	If GetMapID() = $AnvilRock_Map Then    

		Local $aWaypoints[1][4] = [[0, 0, " ", $vqrange]]			
	
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc