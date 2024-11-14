extends Node

var vida: int = 100
var defesa: int = 0
var pilha_cartas: Array[Resource] = []
var gamemanager: Node


func _ready():
	var gamemanager = get_node("/root/Main/GameManager")
	carregar_pilha()

func carregar_pilha():
	# Carregue as cartas na ordem desejada.
	var carta_ataque = preload("res://Card.gd").new()
	carta_ataque.nome = "Ataque"
	carta_ataque.tipo = "Ataque"
	carta_ataque.descricao = "print('damage')"
	pilha_cartas.append(carta_ataque)

func jogar_carta():
	if pilha_cartas.size() > 0:
		var carta = pilha_cartas.pop_front()
		gamemanager.usar_carta(carta, self)
	else:
		print("O NPC não tem mais cartas para jogar.")

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

func atualizar_interface_status():
	# Atualiza a UI de vida e defesa do NPC.
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
