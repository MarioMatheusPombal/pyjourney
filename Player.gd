extends Node

var vida: int = 100
var defesa: int = 0
var mao: Array[Resource] = []
var deck: Array[Resource] = []
var gamemanager: Node
var health_label = Node
var defense_label = Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var health_label = get_node("/root/Main/UI/PlayerInfo/PlayerStats/HealthLabel")
	var defense_label = get_node("/root/Main/UI/PlayerInfo/PlayerStats/DefenseLabel")
	var gamemanager = get_node("/root/Main/GameManager")
	inicializar_deck()
	comprar_mao_inicial()

func inicializar_deck():
	var carta_ataque = preload("res://Card.gd").new()
	carta_ataque.nome = "Ataque"
	carta_ataque.tipo = "Ataque"
	carta_ataque.descricao = "print('damage')"
	deck.append(carta_ataque)

func comprar_mao_inicial():
	for i in range(5):
		comprar_carta()

func comprar_carta():
	if deck.size() > 0:
		var carta = deck.pop_back()
		mao.append(carta)
		atualizar_interface_mao()
	else:
		print("O deck está vazio!")

func usar_carta(carta_index):
	var carta = mao[carta_index]
	mao.remove_at(carta_index)
	gamemanager.usar_carta(carta, self)
	atualizar_interface_mao()

func receber_dano(valor):
	var dano_final = valor - defesa
	if dano_final > 0:
		vida -= dano_final
		defesa = 0
	else:
		defesa -= valor
		atualizar_interface_status()

func aumentar_defesa(valor):
	defesa += valor
	atualizar_interface_status()

func atualizar_interface_mao():
	var mao_container = get_node("caminho/para/PlayerHand")
	mao_container.clear()
	for i in range(mao.size()):
		var carta = mao[i]
		var carta_scene = preload("res://Scenes/card.tscn").instantiate()
		carta_scene.card_data = carta
		carta_scene.indice_da_carta = i
		carta_scene.connect("carta_clicada", self, "usar_carta")
		mao_container.add_child(carta_scene)

func atualizar_interface_status():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
