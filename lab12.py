
import random as rd

def ejercicio1(key):
    
    dict_example = [{"make": "Nokia", "model": 216, "color": "black"},
                    {"make": "Apple", "model": 2, "color": "white"},
                    {"make": "Samsung", "model": 32, "color": "blue"},
                    {"make": "Motorola", "model": 4, "color": "gray"},
                    {"make": "Xiaomi", "model": 12, "color": "red"}]

    sorted_list = sorted(dict_example, key=lambda x: x[key])
    return sorted_list


def ejercicio2(n):
    
    nums = [rd.randint(1, 15) for _ in range((n*10) % 4 + 5)]
    print("Lista de números:", nums)
    
    n_esima = list(map(lambda x: x**n, nums))

    return n_esima


def ejercicio3():

    rows = rd.randint(2, 5)
    cols = rd.randint(2, 5)
    matriz = [[rd.randint(1, 10) for _ in range(cols)] for _ in range(rows)]

    traspuesta = [list(fila) for fila in zip(*matriz)]

    print("Matriz original:")
    for fila in matriz:
        print(fila)

    print("Matriz transpuesta:")
    for fila in traspuesta:
        print(fila)

def ejercicio4():
    # generar listas aleatorias de letras del alfabeto dentro de la función
    alphabet = list('abcdefghijklmnopqrstuvwxyz')
    original = rd.choices(alphabet, k=rd.randint(6, 12))  # con posibles repeticiones
    to_remove = rd.sample(alphabet, k=rd.randint(3, 8))  # sin repeticiones, puede contener letras no presentes

    filtered_list = list(filter(lambda x: x not in to_remove, original))

    print("Lista original:", original)
    print("Elementos a borrar:", to_remove)
    print("Lista filtrada:", filtered_list)
    return filtered_list

# Llamada sin argumentos
ejercicio4()
