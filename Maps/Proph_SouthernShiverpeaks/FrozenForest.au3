#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQFrozenForest() ;Add VQ name

	If GetMapID() = $FrozenForest_Map Then    

		Local $aWaypoints[1][4] = [[0, 0, " ", $vqrange]]			
	
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc