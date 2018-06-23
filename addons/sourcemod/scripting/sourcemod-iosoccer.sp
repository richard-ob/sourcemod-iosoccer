#include <sourcemod>
 
public Plugin myinfo =
{
	name = "Sourcemod IOSoccer",
	author = "Thing'e'",
	description = "Provide extra basic Sourcemod functionality for IOSoccer",
	version = "1.0",
	url = "http://www.iosoccer.com"
};
 
public void OnPluginStart()
{
    LoadTranslations("common.phrases");
	RegAdminCmd("sm_bench", Command_Bench, ADMFLAG_SLAY);
}

public Action Command_Bench(int client, int args)
{
    char argstring[255];
	GetCmdArgString(argstring, sizeof(argstring));

    int target = FindTarget(client, argstring);
	if (target == -1)
	{
		return Plugin_Handled;
	}
	int userId = GetClientUserId(target);
	char userIdString[10]
	IntToString(userId, userIdString, sizeof(userIdString));
	ServerCommand("benchid %s", userIdString);

    char name[MAX_NAME_LENGTH]; 
	GetClientName(target, name, sizeof(name));
    ShowActivity2(client, "[SM] ", "Benched %s", name);

	return Plugin_Handled;
}