#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQDivinersAscent()

	If GetMapID() = $DivinersAscent_Map Then    

		Local $aWaypoints[1][4] = [[0, 0, " ", $vqrange]]			
	
		MoveandAggroVQ($aWaypoints)
		MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc