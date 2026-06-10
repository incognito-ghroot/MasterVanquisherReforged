#include <Array.au3>
Local $vqrange = 1450
Global $ActionCounter = 1

Func VQTheAridSea()
    If GetMapID() = $SkywardReach_Map Then

        Local $aWaypointsA[10][4] = [ [-12517, 4131, " ", $vqrange] _
        , [-12517, 4131, " ", $vqrange] _
        , [-11612, -1888, " ", $vqrange] _
        , [-11216, -5092, " ", $vqrange] _
        , [-7847, -8855, " ", $vqrange] _
        , [-4358, -10956, " ", $vqrange] _
        , [-620, -14121, " ", $vqrange] _
        , [2951, -16579, " ", $vqrange] _
        , [5878, -17416, " ", $vqrange] _
        , [7200, -19500, " ", $vqrange] ]

        Local $aWaypointsB[58][4] = [ [-1879.55, 19088.14, " ", $vqrange] _
         , [-1011, 14688, " ", $vqrange] _
         , [2145, 14392, " ", $vqrange] _
         , [4579, 11634, " ", $vqrange] _
         , [5647, 8058, " ", $vqrange] _
         , [4848, 3638, " ", $vqrange] _
         , [6944, 266, " ", $vqrange] _
         , [9685, 68, " ", $vqrange] _
         , [13790, -1896, " ", $vqrange] _
         , [16285, -4276, " ", $vqrange] _
         , [16385, -9534, " ", $vqrange] _
         , [16613, -11922, " ", $vqrange] _
         , [15300, -15057, " ", $vqrange] _
         , [15161, -16996, " ", $vqrange] _
         , [12870, -18939, " ", $vqrange] _
         , [10087, -17498, " ", $vqrange] _
         , [9491, -15982, " ", $vqrange] _
         , [9182, -14634, " ", $vqrange] _
         , [7091, -13971, " ", $vqrange] _
         , [4317, -12524, " ", $vqrange] _
         , [12420, -18580, " ", $vqrange] _
         , [2420, -18580, " ", $vqrange] _
         , [-150, -17028, " ", $vqrange] _
         , [-2074, -19820, " ", $vqrange] _
         , [-5110, -17982, " ", $vqrange] _
         , [-7921, -19693, " ", $vqrange] _
         , [-11508, -20021, " ", $vqrange] _
         , [-15040, -17408, " ", $vqrange] _
         , [-14504, -16106, " ", $vqrange] _
         , [-15432, -11503, " ", $vqrange] _
         , [-17315, -6675, " ", $vqrange] _
         , [-16507, -533, " ", $vqrange] _
         , [-15460, 2643, " ", $vqrange] _
         , [-15136, 4402, " ", $vqrange] _
         , [-13592, 1783, " ", $vqrange] _
         , [-12978, 4596, " ", $vqrange] _
         , [-13163, 7424, " ", $vqrange] _
         , [-10824, 7473, " ", $vqrange] _
         , [-12215, 9148, " ", $vqrange] _
         , [-9360, 11683, " ", $vqrange] _
         , [-7461, 9757, " ", $vqrange] _
         , [-9475, 13352, " ", $vqrange] _
         , [-4393, 12093, " ", $vqrange] _
         , [-666, 8217, " ", $vqrange] _
         , [-309, 3936, " ", $vqrange] _
         , [-888, 807, " ", $vqrange] _
         , [-1533, -1247, " ", $vqrange] _
         , [-3547, -3366, " ", $vqrange] _
         , [-7609, -3668, " ", $vqrange] _
         , [-4391, -7590, " ", $vqrange] _
         , [-4197, -9582, " ", $vqrange] _
         , [-1597, -11135, " ", $vqrange] _
         , [3709, -11969, " ", $vqrange] _
         , [6771, -9109, " ", $vqrange] _
         , [4936, -4619, " ", $vqrange] _
         , [3948, 212, " ", $vqrange] _
         , [4243, 2236, " ", $vqrange] _
         , [964, 6154, " ", $vqrange] ]

        MoveandAggroVQ($aWaypointsA)

        WaitForLoad()
        MoveandAggroVQ($aWaypointsB)
        MoveandAggroVQReverse($aWaypointsB)

        MoveandAggroVQ($aWaypointsB)
        MoveandAggroVQReverse($aWaypointsB)
               
    EndIf
EndFunc

