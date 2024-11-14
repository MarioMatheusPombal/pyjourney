extends Panel

var card_data: Resource


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Nome.text = card_data.nome
	$Descricao.text = card_data.descricao
	$Textura.texture = card_data.icone


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
