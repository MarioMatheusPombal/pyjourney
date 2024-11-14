extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("gui_input", self, "_on_gui_input")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		emit_signal("carta_clicada", indice_da_carta)
