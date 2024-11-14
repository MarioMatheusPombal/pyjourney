extends Node

var cartas_na_mao: Array[Resource] = []

func comprar_carta():
	if Deck.cartas.size() > 0:
		var carta = Deck.cartas.pop_back()
		cartas_na_mao.append(carta)
		atualizar_interface()
		
func atualizar_interface():
	# Atualiza a exibição das cartas na mão do jogador
	pass
	
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
