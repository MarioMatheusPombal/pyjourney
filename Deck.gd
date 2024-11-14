extends Node

var cartas: Array[Resource] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	carregar_cartas()


func carregar_cartas():
	var carta_ataque = preload("res://Card.gd").new()
	carta_ataque.nome = "Ataque"
	carta_ataque.tipo = "Ataque"
	carta_ataque.descricao = "print('damage')"
	cartas.append(carta_ataque)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
