# cad_ca1
In this assignment, you should design and implement a matrix multiplication module. The module is intended to calculate the
multiplication of two 𝑵 ∗ 𝑴 and 𝑴 ∗ 𝑵 matrix instances to get a new 𝑵 ∗ 𝑵 result
matrix (𝑀, 𝑁 ≥ 2).
The elements of each input matrix are 𝑫𝑾-bit integer numbers. The elements of the result
matrix in theory can reach up to 𝑅𝑊-bit numbers (𝑅𝑊 = 2 ∗ 𝐷𝑊 + ⌈log2 𝑀⌉), but you
should implement it in 𝑫𝑾-bit integer numbers and issue an “Overflow" signal in case of
overflow.
You should get the two input vectors from “DataIN” input (𝐷𝑊-bit width) and store them in
a memory. The receiving process should be started after a pulse on “Start” signal, so it takes
2 ∗ 𝑁 ∗ 𝑀 clock cycles (after the pulse on Start) to get the two matrices. The first 𝑁 ∗ 𝑀 bytes
you receive is the first matrix and the next 𝑀 ∗ 𝑁 bytes are the second matrix. Once the data
transmission completed, the two matrices are multiplied and the result matrix is stored in
the memory. The result matrix is also sent outside through the “DataOUT” 𝐷𝑊-bit port in
several cycles. The output matrix is sent to output in a column-major order (First, column
1 of the matrix is sent, from the first element to the last , then column 2 is sent and so on).
The assertion of “Done” signal indicates that the valid output is on the “DataOut” port.

Xilinx FPGAs have dedicated Multiplier and Block RAM modules. If you use these hardware
resources, the synthesizer uses them for synthesizing your design (instead of LUTs).
There are several ways for using these hardware resources: Using IP Cores, instantiating the
resources in the code, and using Coding Style. You must use the Coding Style method which
uses XST FPGA Constraints. For more information refer to “XST User Guide” Chapter 6 part
FPGA Constrains.
You should synthesize the hardware that is shown in Figure 1 with two different styles:
 By LUTs, in which all the logics are implemented on CLBs.
 By dedicated hardware resources. In this case, your design must use Block Multiplier
and Block RAM components.
In either mode, you are required to report the Device Utilization.


