#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQSkywardReach()
	If GetMapID() = $SkywardReach_Map Then    
   	Local $aWaypoints[9][4] = [ [-13621.20, 4515.99, " ", $vqrange] _
          , [-12517, 4131, " ", $vqrange] _
          , [-11612, -1888, " ", $vqrange] _
          , [-11216, -5092, " ", $vqrange] _
          , [-7847, -8855, " ", $vqrange] _
          , [-4358, -10956, " ", $vqrange] _
          , [-620, -14121, " ", $vqrange] _
          , [2951, -16579, " ", $vqrange] _
          , [5878, -17416, " ", $vqrange] ]
		
		MoveandAggroVQ($aWaypoints)
      MoveandAggroVQReverse($aWaypoints)
   EndIf		
EndFunc