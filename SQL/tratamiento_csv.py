import csv

# Corregir la ruta del archivo original y el archivo limpio
archivo_original = r"C:\Users\LENOVO\Documents\EXAMEN\raw\Flights_2020_1.csv"
archivo_limpio = r"C:\Users\LENOVO\Documents\EXAMEN\raw\Flights_2020.csv"

# Leer el archivo original y escribir el nuevo sin comillas
with open(archivo_original, 'r', newline='', encoding='utf-8') as entrada:
    with open(archivo_limpio, 'w', newline='', encoding='utf-8') as salida:
        lector = csv.reader(entrada)
        escritor = csv.writer(salida)

        # Procesar cada fila
        for fila in lector:
            # Quitar comillas dobles de cada elemento de la fila
            fila_sin_comillas = [campo.replace('"', '') for campo in fila]
            escritor.writerow(fila_sin_comillas)

print("Archivo limpio generado sin comillas dobles.")
