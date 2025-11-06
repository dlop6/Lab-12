module Main where

import System.Random (randomRIO)
import Control.Monad (replicateM)
import Data.List (sortBy, transpose)
import Data.Ord (comparing)

-- Ejercicio 1: ordenar una lista de "diccionarios" (aquí: registros) por una clave
data Car = Car { make :: String, model :: Int, color :: String } deriving (Show, Eq)

ejercicio1 :: String -> [Car]
ejercicio1 key =
  let dictExample = [ Car "Nokia" 216 "black"
                    , Car "Apple" 2 "white"
                    , Car "Samsung" 32 "blue"
                    , Car "Motorola" 4 "gray"
                    , Car "Xiaomi" 12 "red"
                    ]
      sorter = case key of
        "model" -> sortBy (\a b -> compare (model a) (model b))
        "make"  -> sortBy (\a b -> compare (make a) (make b))
        "color" -> sortBy (\a b -> compare (color a) (color b))
        _        -> id
  in sorter dictExample

-- Ejercicio 2: generar lista de enteros aleatorios, mostrarla y devolver cada elemento elevado a n
ejercicio2 :: Int -> IO [Int]
ejercicio2 n = do
  let len = (n * 10) `mod` 4 + 5
  nums <- replicateM len (randomRIO (1 :: Int, 15 :: Int))
  putStrLn $ "Lista de números: " ++ show nums
  let nEsima = map (\x -> x ^ n) nums
  return nEsima

-- Ejercicio 3: generar matriz aleatoria y mostrar su transpuesta
-- Transpose usando lambdas (versión recursiva)
transpose' :: [[a]] -> [[a]]
transpose' = \m -> if null m || any null m then [] else map (\x -> head x) m : transpose' (map (\x -> tail x) m)

ejercicio3 :: IO ()
ejercicio3 = do
  rows <- randomRIO (2 :: Int, 5 :: Int)
  cols <- randomRIO (2 :: Int, 5 :: Int)
  matriz <- replicateM rows (replicateM cols (randomRIO (1 :: Int, 10 :: Int)))
  putStrLn "Matriz original:"
  mapM_ print matriz
  putStrLn "Matriz transpuesta:"
  mapM_ print (transpose' matriz)

-- Ejercicio 4: generar lista original de letras (con repeticiones), generar lista de letras a borrar
-- (menos elementos que la lista original en general) y filtrar usando lambda + filter
ejercicio4 :: IO [Char]
ejercicio4 = do
  let alphabet = ['a'..'z']
  size <- randomRIO (6 :: Int, 12 :: Int)   -- tamaño de la lista original (con repeticiones)
  original <- replicateM size (do i <- randomRIO (0 :: Int, 25 :: Int); return (alphabet !! i))
  removeCount <- randomRIO (3 :: Int, 8 :: Int) -- cantidad de elementos a intentar borrar
  toRemove <- replicateM removeCount (do i <- randomRIO (0 :: Int, 25 :: Int); return (alphabet !! i))
  let filtered = filter (\x -> not (x `elem` toRemove)) original
  putStrLn $ "Lista original: " ++ show original
  putStrLn $ "Elementos a borrar: " ++ show toRemove
  putStrLn $ "Lista filtrada: " ++ show filtered
  return filtered

-- Main de demostración que ejecuta los cuatro ejercicios
main :: IO ()
main = do
  putStrLn "--- Ejercicio 1 (ordenar por 'model') ---"
  print (ejercicio1 "model")

  putStrLn "\n--- Ejercicio 2 (potencias) ---"
  res2 <- ejercicio2 3
  putStrLn $ "Resultado ejercicio2: " ++ show res2

  putStrLn "\n--- Ejercicio 3 (transpuesta) ---"
  ejercicio3

  putStrLn "\n--- Ejercicio 4 (filtrado con lambda) ---"
  _ <- ejercicio4
  return ()
