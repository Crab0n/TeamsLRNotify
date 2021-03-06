param(
[string]$AlarmId, #AlarmID Alarm <remv1:AlarmId />
[string]$AlarmDate, #AlarmDate
[string]$AlarmRuleName, #AlarmRuleName Alarm <remv1:AlarmRuleName />
)

<### Update these ###>
Import-Module C:\whereverthehellitis\PSMicrosoftTeams

#Your Teams Webhook URL
$URI = "https://outlook.office.com/webhook/xxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx@xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/IncomingWebhook/xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

#Your LR Web Console URL
$URL = "https://webconsoleurl/alarms/" + $AlarmId
<####################>

### Set webhook payload

$messageType = "Information"
$messageTitle = "New LogRhythm Alarm: $AlarmRuleName"
$messageBody = "$AlarmDate"

$buttons = @(
	@{ name = 'View Alarm'; value = @("$URL")}
)

### Send webhook
Send-TeamChannelMessage -messageType $messageType -messageTitle $messageTitle -messageBody $messageBody -buttons $buttons -URI $URI; exit 0;