extends Control

var soundPlayed = false

func hide_alert():
	Resources.alert_message_visible = false
	Resources.is_alert_message_timer_blocked = false
	soundPlayed = false

func _ready():
	$Timer.connect("timeout", self, 'hide_alert')
	
func _process(delta):
		
	self.visible = Resources.alert_message_visible
	$Label.text = Resources.alert_message_text
	
	if self.visible && !Resources.is_alert_message_timer_blocked:
			Resources.is_alert_message_timer_blocked = true
			$Timer.start()
			
	if self.visible && !soundPlayed:
		$Sound.play()
		soundPlayed = true
