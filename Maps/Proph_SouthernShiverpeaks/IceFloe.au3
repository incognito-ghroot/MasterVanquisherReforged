#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQIceFloe() ;Add VQ name

	If GetMapID() = $IceFloe_Map Then    

		Local $aWaypoints[][4] = [[0, 0, " ", $vqrange]]			
			, [7202, -11110, " ", $vqrange] _
			, [7940, -8847, " ", $vqrange] _
	MoveandAggroVQ($aWaypoints)
	MoveAndAggroVQReverse($aWaypoints)

	EndIf
EndFunc
