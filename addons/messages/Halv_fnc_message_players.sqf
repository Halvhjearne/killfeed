/*
	a3 epoch killfeed message fuction
	By Halv
*/
_type = _this select 0;
_message = _this select 1;
_sender = if(count _this > 2)then{_this select 2}else{player};
switch (toLower _type)do{
	case "globalchat":{_sender globalChat _message;};
	case "sidechat":{_sender sideChat _message;};
	case "systemchat":{systemChat _message;};
	case "hint":{hint _message;};
	case "hintsilent":{hintSilent _message;};
	case "titletext":{titleText _message;};
	case "cuttext":{cutText _message;};
	case "dynamictext":{[_message,[safezoneX + 0.01 * safezoneW,2.0],[safezoneY + 0.01 * safezoneH,0.3],30,0.5] spawn BIS_fnc_dynamicText;};
	case "typetext2":{
		[
			[
				[(_message select 0),"align = 'center' size = '1' font='PuristaBold'"],
				["","<br/>"],
				[(_message select 1),"align = 'center' size = '0.5'"]
			]
		] spawn BIS_fnc_typeText2;
	};
};
