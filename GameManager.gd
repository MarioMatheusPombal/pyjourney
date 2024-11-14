extends Node

var turno_do_jogador: bool = true
var jogador: Node
var npc: Node

func iniciar_jogo():
	turno_do_jogador = true
	# Inicialize mãos, decks, etc.

func passar_turno():
	turno_do_jogador = !turno_do_jogador
	if turno_do_jogador:
		iniciar_turno_jogador()
	else:
		iniciar_turno_npc()

func iniciar_turno_jogador():
	# Permitir que o jogador jogue cartas
	pass

func iniciar_turno_npc():
	npc.jogar_carta()
	passar_turno()
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	jogador = get_node("/root/Main/Player")
	npc = get_node("/root/Main/NPC")
	iniciar_jogo()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func usar_carta(carta: Resource, jogador_atual):
	match carta.tipo:
		"Ataque":
			aplicar_ataque(jogador_atual, carta)
		"Defesa":
			aplicar_defesa(jogador_atual, carta)
		"Loop":
			jogador_atual.ativar_loop(carta)

func aplicar_ataque(jogador_atual, carta):
	if jogador_atual == jogador:
		npc.receber_dano(10)
	else:
		jogador.receber_dano(10)

func aplicar_defesa(jogador, carta):
	jogador.aumentar_defesa(10)
	
var fase_atual: int = 1

func verificar_fim_da_fase():
	if npc.vida <= 0:
		fase_atual += 1
		carregar_nova_fase()

func carregar_nova_fase():
	pass
