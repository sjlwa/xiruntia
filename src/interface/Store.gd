extends Control


func _on_Barrel_pressed():
	if PlayerState.coins >= NewBarrels.getPrice():
		PlayerState.coins -= NewBarrels.getPrice()
		NewBarrels.addBarrel()
		$BuySound.play()
	else:
		$ErrorSound.play()
		

func _process(delta):
	$Panel/Barrel/price.text = str(NewBarrels.getPrice()) + ' Monedas'

	if NewBarrels.isLastBarrel():
		$Panel/Barrel.disabled = true
