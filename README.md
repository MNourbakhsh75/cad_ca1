# cad_ca1
In this assignment, you should design and implement a matrix multiplication module. The module is intended to calculate the
multiplication of two 𝑵 ∗ 𝑴 and 𝑴 ∗ 𝑵 matrix instances to get a new 𝑵 ∗ 𝑵 result
matrix (𝑀, 𝑁 ≥ 2).
The elements of each input matrix are 𝑫𝑾-bit integer numbers. The elements of the result
matrix in theory can reach up to 𝑅𝑊-bit numbers (𝑅𝑊 = 2 ∗ 𝐷𝑊 + ⌈log2 𝑀⌉), but you
should implement it in 𝑫𝑾-bit integer numbers and issue an “Overflow" signal in case of
overflow.
