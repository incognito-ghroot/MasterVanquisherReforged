#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQDreadnoughtsDrift() ;Add VQ name

	If GetMapID() = $DreadnoughtsDrift_Map Then    

		Local $aWaypoints[1][4] = [[0, 0, " ", $vqrange]]			
	
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc