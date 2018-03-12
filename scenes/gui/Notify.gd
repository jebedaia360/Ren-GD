## This is in-game gui example for Ren API ##
## version: 0.5.0 ##
## License MIT ##

extends Panel

func _ready():
	Ren.connect("enter_statement", self, "_on_statement")
	$Timer.connect("timeout", self, "hide")

func _on_statement(id, type, kwargs):
	if type == "notify":
		$Dialog.bbcode_text = kwargs.info
		if kwargs.has("length"):
			$Timer.wait_time=kwargs.length
		$Timer.start()
		show()
		Ren.emit_signal("notified")

