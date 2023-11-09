extends Node

func get_dialog():
	if PlayerState.day == 1:
		return [
			"Buenos dias joven...",
			"¿Como te llamas? Me recuerdas a mi nieto, pero el pobre se deshidrato y se murio.",
			"Solo me queda mi nieta Khali... Con este calor siempre juega en la sombra aquel arbol. ",
			"Intento sacar agua del pozo, pero esta contaminada y yo ya estoy viejo.",
			"No tenemos agua para refrescarnos, hay gente que no entiende que el mundo se esta secando.",
			"Como Xiruntia es un un pueblo indigena al que nadie le importa, somos los primeros afectados.",
			"Tenemos que enfrentar a los que desperdician nuestra preciada agua.",
			"Creo que debemos insistirles hasta convencerlos.",
			"¿Nos ayudas?"
		]
	elif PlayerState.day == 2:
		return [
			"Hola jeje, acabo de juntar 4 litros, ya puedo bañarme jeje... \nSi junto mas, podre lavarme los dientes"
		]
	elif PlayerState.day > 2:
		return [
			"Que tal joven... Es un milagro que tengamos agua, \nOjala no se nos vaya tan pronto..."
		]
