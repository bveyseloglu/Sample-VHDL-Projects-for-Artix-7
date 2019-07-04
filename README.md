## Sample-VHDL-Projects-for-Artix-7
My laboratory work from Digital Systems II course.

## License
Only .vhd files are under MIT license.

## Project Descriptions
### 1. Combinational Circuit (An Arbitrary Example)
A combinational circuit with different concurrent signal assignment techniques. VDHL description of this truth table given below.

<p align="center"> 
  <img src="https://dl.dropboxusercontent.com/s/ksgjdm3oew0nklw/TruthTable.PNG">
</p>

### 2. 4-bit ALU
An Arithmetic and Logic Unit (ALU) is a combinational circuit that performs logical and arithmetic operations on a pair of n-bit operands (in this case, A[3:0] and B[3:0]). The operations performed by an ALU are controlled by a set of operation-select inputs. In this work, 4-bit ALU has 3 operation-select inputs, S[2:0]. Logical operations take place on the bits that comprise a value (known as bitwise operations), while arithmetic operations treat inputs and outputs as two’s complement integers.

The block diagram and the truth table for the ALU are shown below.

<p align="center"> 
  <img src="https://dl.dropboxusercontent.com/s/cl5yxw5zzegb3ys/ALU.png">
</p>

### 3. Sequential Design - Digital Clock
A 32-bit up_down counter with a synchronous reset and an enable input. In up mode, counter will count up to until "upperlimit" and then reset to zero. In down mode, counter will count down to zero and then reset to "upperlimit".

### 4. Sequential Design - Rotating Squares
This project implements the rotating squares on seven segments as shown in this figure:

<p align="center"> 
  <img src="https://dl.dropboxusercontent.com/s/tr9v1q015tcgth0/RotatingSquares.png">
</p>

### 5. Finite State Machine - Sequence Detector
Moore type sequence detector that samples 1-bit serial data input coming from a switch with a 1 Hz clock signal. FSM circuit searches the pattern 1101 on the serial data input if the active-high enable signal is asserted. The end of one pattern can be the start of another. For example, your circuit should detect the search pattern twice for the input sequence of 1101101.
The latest eight serial data inputs are shown on LEDs. Furthermore, this design shows the number of detected sequences on the first two 7-segment displays and the current state on another 7-segment display.

### 6. Finite State Machine - Vending Machine
This work is an FSM of a vending machine that has these specifications:
* An item is selected with two switches. Possible items and their costs are given in table below.
| Item      | Price |
|-----------|-------|
| Water     | 1     |
| Chocolate | 2     |
| Coke      | 3     |
| Cookies   | 4     |
* When an item is selected, it should be notified by the request button.
* The machine accepts only 1 TL. Depositing 1 TL is signaled by asserting one_tl input.
* After money is deposited, the machine waits for 1 second to calculate the total money.
* If the total money is enough to buy the corresponding item, one of the LEDs is turned on. Otherwise, the machine waits for the next 1 TL.
* The client can take the item, with the take_item button. When the item is taken, the LED is turned off.

### 7. Finite State Machine with Datapath - Iterative Divider
