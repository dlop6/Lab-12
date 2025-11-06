# Laboratorio 12 - Diego López #23747

Vídeo: <https://youtu.be/oe8b3t0fkrU>


Requisitos mínimos
- Python 3 instalado (para `lab12.py`).
- GHC/Stack o Cabal instalados para compilar/ejecutar Haskell.

Cómo ejecutar

PowerShell — Python:
```powershell
python .\lab12.py
```

PowerShell — Haskell (usar Stack, resuelve dependencias automáticamente):
```powershell
stack script --resolver lts --package random lab12.hs
```

O compilar con GHC:
```powershell
ghc lab12.hs -o lab12.exe
.\lab12.exe
```

Notas
- Las versiones en Haskell generan datos aleatorios para demostrar casos distintos; si necesita entradas fijas o funciones puras, puede usar las funciones auxiliares definidas en `lab12.hs`.
- Si faltan paquetes Haskell, instálelos con `cabal v2-install --lib <paquete>` o use `stack` como arriba.
