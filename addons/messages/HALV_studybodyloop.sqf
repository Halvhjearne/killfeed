/*
	a3 epoch killfeed studybody loop
	By Halv
*/

#include "settings.sqf";

/*
	//disabled HDevent for now, since it does not work with most antihacks, add this in run.sqf or security_checks.h for handle damage:
	//(_this select 0) setVariable ['HALVWTD',(_this select 1),true];
*/

_HALV_studyaction = -1;
_HALV_burybodyaction = -1;

while{alive player}do{
	_ct = cursorTarget;
	if(!isNull _ct && player == vehicle player)then{
		if(_ct isKindOf "CAManBase" && !alive _ct && player distance _ct < 4 && {_ct isKindOf _x}count["Epoch_Cloak_F","GreatWhite_F","Epoch_Sapper_F","Epoch_SapperB_F","PHANTOM","Animal"] < 1)then{
			if(_HALV_burybodyaction < 0 && _enableburybody)then{
				_HALV_burybodyaction = player addAction ["<t color='#0096ff'>Bury Body</t>",(_folder + "burybody.sqf"), _ct, -9, true, true, "", ""];
			};
			if(_HALV_studyaction < 0 && _enablestudybody)then{
				_HALV_studyaction = player addAction ["<t color='#0096ff'>Study Body</t>",(_folder + "HALV_studybody.sqf"), _ct, -10, true, true, "", ""];
			};
		}else{
			player removeAction _HALV_burybodyaction;
			_HALV_burybodyaction = -1;
			player removeAction _HALV_studyaction;
			_HALV_studyaction = -1;
		};
	}else{
		player removeAction _HALV_burybodyaction;
		_HALV_burybodyaction = -1;
		player removeAction _HALV_studyaction;
		_HALV_studyaction = -1;
	};
	sleep 2;
};
