#include "settings.sqf";

player addEventHandler ["HandleDamage",{(_this select 0) setVariable ["HALVWTD",(_this select 1),true];(_this select 2)}];

_HALV_studyaction = -1;

while{alive player}do{
	_ct = cursorTarget;
	if(!isNull _ct && player == vehicle player)then{
		if(_ct isKindOf "Man" && !alive _ct && player distance _ct < 4)then{
			if(_HALV_studyaction < 0)then{
				_HALV_studyaction = player addAction ["<t color='#0096ff'>Study Body</t>",(_folder + "HALV_studybody.sqf"), _ct, -10, true, true, "", ""];
			};
		}else{
			player removeAction _HALV_studyaction;
			_HALV_studyaction = -1;
		};
	}else{
		player removeAction _HALV_studyaction;
		_HALV_studyaction = -1;
	};
	sleep 2;
};
