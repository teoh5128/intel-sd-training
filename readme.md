# Intel SD Training 

## Table of contents
* [ Day 0 - System/Tool Setup Check. GitHub ID creation ](https://github.com/teoh5128/intel-sd-training#day-0)
* [ Day 1 - Introduction to Verilog RTL design and Synthesis](https://github.com/teoh5128/intel-sd-training#day-1)

## Day 0
## Topic - System/Tool Setup Check. GitHub ID creation

**Package** is a container that holds die and was connected to outside (external device) by using wire bonding.
Example of package - Quadruple in-line package (QIP) and Dual in-line package (DIP).

![die](https://user-images.githubusercontent.com/62828746/203833674-a44e1aa2-42f1-43eb-8890-016e0bc186e1.png)

* **Pad** - used to connect inside (core) to outside (I/O), good at ESD protection to prevent charge coming from outside damage the core inside.
* **Core** - consists of all the main logic gate (NMOS/PMOS) and cell block such as macro cell and foundry IP's.
* **I/O** - help in communication between die with external and will be connected to die by using wire bonding.

+ **Differences of macro vs foundry IP's**:
  * **Macro** - a simple core/cell with simple functionality and can be easily found online.
  * **Foundry IP's** - cell with more specific functionality and the design was patent/owned by a company. Has higher value compared to macro.
  
===========================================================================

How does a **software communicate with hardware**:

**Synthesis process** will help to convert software's instructions which is written in high level language to gate level language/machine language which is normally in binary format.

![software to hardware](https://user-images.githubusercontent.com/62828746/203840905-0b291241-5af6-40d1-9f6a-a8acb8176b7d.png)

**Synthesis process flow**:
1. **Specification/instructions** written in RTL (**high-level language** such as C, C++ or Java) as inputs.
1. **Compiler** will compile the instruction into **assembly language** (.exe).
1. **Assembler** will then convert **assembly language** into **gate level language** (low-level language.machine language) which is in binary format (operands), and it is the language understood by a computer.



## Lab 
#### Steps to enable labs:

* [Day0 Lab Steps](https://intel-my.sharepoint.com/:u:/r/personal/huifen_teoh_intel_com/Documents/Desktop/Intel_SD_Training/Lab/Day0_lab.msg?csf=1&web=1&e=Kat8QI)

#### Result:

![Day0 Lab Result](https://user-images.githubusercontent.com/62828746/203844716-f72c32ab-2353-4f42-bbd2-c3bb49c88ecb.PNG)



## Day 1
## Topic - Introduction to Verilog RTL design and Synthesis

### **HDL (Hardware description Language)**
* It is a language that used to model electronic circuit/system by describing their structure and behavior precisely.
* Commonly used in the design and verification of digital circuit.
* Most widely used and well-supported HDL used in industry: **Verilog** and VHDL (VHSIC Hardware Description Language)
* HDL code can be written in 3 model/levels of abstraction. (Behavioural, RTL and Gate-level)

### **RTL Design (Register Transfer Level)**
* It's a design abstraction which models the signal flow between hardware registers and also the logical operations that performed on those signals.
* RTL written in Verilog decribes how signal is changed as it passed from register to register. 
* In shorts, HDL is a language used to decribe circuit's specification (structure and bahaviour) while RTL is a way of describing the circuit. 

### **Synthesis**
* Synthesis tool (synthesizer) will turning an abstract design (**RTL**) into a correctly implmented chip in term of logic gates (**netlist**).
* Translation - Translate Verilog that describe design specification/functionality into basic logic gates.
* Mapping - Map logic gates to actual technology dependent logic gate that are readily avaiable in tech file.
* Optimization - Optimized mapped netlist while maintaining design's specification/functionality.



### **Testbench**

![testbench](https://user-images.githubusercontent.com/62828746/205500508-8e14ec1a-86b0-443f-aa71-f6570a717609.jpg)

* **Testbench** - is a setup to apply stimulus to the design and check whether the output meet required functionality and specification.
* **Stimulator** - it will apply stimulus to design input (stimulus generator) and obseve stimulus from design output (stimulus observer).
* **Design** - a verilog code/ a set of verilog codes that has intended functionality to meet required specification (Ex: an inverter).

===========================================================================

### **iVerilog (Icarus Verilog) Based RTL Design Simulation Flow**

**iVerilog** - is an open source verilog simulator tool that used to check design specification is adherence to RTL design or not.

![iVerilog Based Simulation Flow_0](https://user-images.githubusercontent.com/62828746/205501616-c40a5770-8b56-4c05-93ea-4dd2edde8919.jpg)

1. RTL design and testbench are applied to iVerilog as inputs.
2. iVerilog simulating the design while any changes in value will be generated as VCD file.
3. GTKwave which is a graphic application helps in viewing the waveform.
4. Through the waveform, we can observe whether the input and output meet design specification. 

===========================================================================

### **yosys (Yosys Open SYnthesis Suite) Based Synthesis Flow**

**yosys** is a framework for RTL synthesis tools that is used to convert RTL to netlist.

![yosys synthesizer_0](https://user-images.githubusercontent.com/62828746/205504038-a06b8354-b6de-4f03-96fe-faca348a5c34.jpg)

* **Design** - it's a behaviour verilog code.
* **.lib** - a collection of standard cell/logical modules. It includes basic logic gates (Ex: AND,OR,NAND,NOR) of different flavor such as number of inputs, speeds (slow, medium or fast) and functionality.
* **Netlist** - it's the representation of design in term of standard cell stored in the .lib.

===========================================================================

### **iVerilog (Icarus Verilog) Based Synthesized Netlist Simulation Flow**

To confirm the netlist generated in synthesis is meet the requirement, will need to verify the netlist by using the simulator tool.

![iVerilog Based Synthesized Netlist Simulation Flow_0](https://user-images.githubusercontent.com/62828746/205505409-509251fa-7141-44ae-9b70-05ff0b15d704.jpg)

**Simulation flow** and the **outputs waveform** for both RTL design and synthesized netlist will be the same. The only difference is the inputs (RTL design[.v] or synthesized netlist[netlist.v]).

1. Netlist and testbench are applied to iVerilog as inputs.
2. iVerilog simulating the design while any changes in value will be generated as VCD file.
3. GTKwave which is a graphic application helps in viewing the waveform.
4. Through the waveform, we can observe whether the input and output meet design specification. 

===========================================================================

### **How Flavours of Gate Effect Ciruit Operation Speed**

Combinational delay in logic path determine the maximum operation speed of digital logic circuit.

![Flavours of Gate (Fast vs Slow)](https://user-images.githubusercontent.com/62828746/205507225-0ab7c70d-3752-4aa8-8e97-dcf57d984a3f.jpg)

* The minimum clock period must be larger than the total time taken for propogation delay in both DFF A and combinational logic and setup time in DFF B.
* Minimum clock period signal let signals have enough time to travel from DFF A to DFF B.
* Better performance circuit must have **low clock period** and **high clock frequency**, so that operation speed will be higher.
* High speed standard cells can help in reduce propogation delay and thus reduce overall clock period.
* However, high speed cells might cause DFF B capture signal too fast and missed the data that supposed to catch.
* For this reason, hold time is required to have minimum delay from DFF A to DFF B.
* Slower cells can help in meeting the required hold time.
* In shorts, we need **fast cells to meet required performance** and also need **slow cells to meet minimum hold time**.


===========================================================================

### **How Capacitance Effect Circuit's Speed**

![How Capacitance Effect Circuit's Speed](https://user-images.githubusercontent.com/62828746/205509103-b8a090bb-48eb-4854-abff-5e7c4500ab87.jpg)

* Capacitance - it's a load in digital logic ciruit. Faster charging/discharging rate will reduce cell delay and make cell A to drive cell B faster.
* Transistor - Wider transistor has higher capable of sourcing larger current and will result in faster capacitance charging/discharging rate. However, will wider transistor will consume larger area and power.

* In shorts, faster cells need to trade off with area and power.


===========================================================================

### **Cell Selection and Trade Off**

Synthesizer required **constraints** as guidance in cell selection to select correct cell flavour that is optimum for logic circuit implementation.

Trade Off for Fast Cell                          | Trade off for Slow Cell
---------------------------------------------    | --------------------------------------------- 
Bad ciruit in term of area and power             | Slow speed circuit
Concern in hold time violation                   | Failed required performance

===========================================================================

## Lab - SKY130RTL D1SK2 L1 Lab1 introduction to lab

#### Steps:

> 1. Clone directory "sky130RTLDesignAndSynthesisWorkshop" from Kunal's github.
> > *git clone https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git*
> 2. Explore copied directory and confirm there's all the required folders and files.
> > *cd sky130RTLDesignAndSynthesisWorkshop/*
> 3. Goto my_lib/ to explore stored verilog model.
> > *cd my_lib/*
> 4. Goto lib/ and make sure "sky130_fd_sc_hd__tt_025C_1v80.lib" lib is inside.
> > *cd lib/*
> 5. Goto verilog_files which stored all the verilog and testbench fill that will be used in subsequent labs.
>> *cd verilog_files/*

#### Result:
![SKY130RTL D1SK2 L1 Lab1 introduction to lab_result](https://user-images.githubusercontent.com/62828746/205509273-3c3774d7-75c2-4293-8306-29d9af55b0c8.jpg)

## Lab - SKY130RTL D1SK2 L2 Lab2 Introduction iverilog gtkwave part1
Related with theory part: [iVerilog (Icarus Verilog) Based RTL Design Simulation Flow](https://github.com/teoh5128/intel-sd-training/edit/main/readme.md#iverilog-icarus-verilog-based-synthesized-netlist-simulation-flow)

#### Steps:
> 1. Take good_mux cell as example. Run simulation by apply RTL Design (good_mux.v) and testbench (tb_good_mux.v) as inputs.
> > *iverilog good_mux.v tb_good_mux.v*
> 2. a.out file is now created, then exectue a.out file to dump vcd file.
> > *./a.out*

#### Result:
![SKY130RTL D1SK2 L2 Lab2 Introduction iverilog gtkwave part1_result_1](https://user-images.githubusercontent.com/62828746/205509351-9d96c79a-bd4b-4f1e-b1cb-4f00a4f974c0.jpg)

#### Steps:
> 1. Load generated vcd file in graphic application, GTKwave.
> > *gtkwave tb_good_mux.vcd*
> 2. Review waveform in GTKwave after pull all the signals to "signal" column and zoom to fit.

![SKY130RTL D1SK2 L2 Lab2 Introduction iverilog gtkwave part1_result_2_a](https://user-images.githubusercontent.com/62828746/205514717-bdef7d9c-0f8a-4c13-a65e-58a95c6f1df0.jpg)


## Lab - SKY130RTL D1SK2 L2 Lab2 Introduction iverilog gtkwave part2

#### Steps:
> 1. Explore verilog file and testbench file to compare it with generated waveform.
>> *vim tb_good_mux.v -o good_mux.v*
> 2. Review generated waveform, result must follow all the specification in verilog and testbench.

#### Result:

![SKY130RTL D1SK2 L3 Lab2 Introduction iverilog gtkwave part2_result_1](https://user-images.githubusercontent.com/62828746/205509398-b41f44e7-e9e7-445a-8a4d-e79a5a9e11bf.jpg)
*Testbench contains design instantiation (UUT) and will not have primary inputs/outputs assigned.*

![SKY130RTL D1SK2 L3 Lab2 Introduction iverilog gtkwave part2_result_3_0](https://user-images.githubusercontent.com/62828746/205514404-3c9b3de8-51e6-4135-9a5a-41bcff2d1d22.jpg)
*Testbench contains stimulus to generate waveform such as input initial value and triggered period.*

![SKY130RTL D1SK2 L3 Lab2 Introduction iverilog gtkwave part2_result_4_0](https://user-images.githubusercontent.com/62828746/205514407-834c9498-e069-4f39-98bb-5c7279cc45b5.jpg)
*After 50ns, sel is triggered, hence output will follow i0 value, y=1.*

![SKY130RTL D1SK2 L3 Lab2 Introduction iverilog gtkwave part2_result_5_0](https://user-images.githubusercontent.com/62828746/205514403-96f1e1e3-26bb-436a-ada1-e415a13627ab.jpg)
*After 75ns, sel is triggered, hence output will follow i1 value, y=0.*

## Lab - SKY130RTL D1SK4 L1 Lab3 Yosys 1 good mux Part1
Related with theory part: [yosys (Yosys Open SYnthesis Suite) Based Synthesis Flow](https://github.com/teoh5128/intel-sd-training/edit/main/readme.md#yosys-yosys-open-synthesis-suite-based-synthesis-flow)

#### Steps:
> 1. Invoke synthesizer tools, yosys
>> *yosys*
> 2. Read the library
>> *read_library -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
> 3. Read the design. there should no error and will see "successfully finished verilog frontend" printed.
>> *read_verilog good_mux.v*
> 4. Link to the module name that want to be synthesized.
>> *synth -top good_mux*
> 5. Generate netlist, "abc" is the command which will convert rtl file into gate specified in the library "sky130_fd_sc_hd__tt_025C_1v80.lib".
>> *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
> 6. To see graphical version of the logic it does realized.
>> *show*


#### Result:
![SKY130RTL D1SK4 L1 Lab3 Yosys 1 good mux Part1_result_1_0](https://user-images.githubusercontent.com/62828746/205514365-a1c5b714-5856-4f31-8220-0ede601699a9.jpg)
*Total inputs, library version used and total outputs shown in graphic should be the same with the ABC results.*

## Lab - SKY130RTL D1SK4 L1 Lab3 Yosys 1 good mux Part2

#### Steps:
> 1. Load verilog file and review it togther with graphical version of the logic.
>> *!vim good_mux_netlist.v*

#### Result:
![SKY130RTL D1SK4 L1 Lab3 Yosys 1 good mux Part1_result_1_0_0](https://user-images.githubusercontent.com/62828746/205514500-9fedde6a-dd2c-4a7a-b86a-094072f3f2a5.jpg)
*mux2_1 is a multiplexer that will switch switch two input lines to a single common output line.*

## Lab - SKY130RTL D1SK4 L1 Lab3 Yosys 1 good mux Part3

#### Steps:
> 1. To write out synthesized netlist
>> *write_verilog good_mux_netlist.v*
> 2. To write out synthesized netlist in more simplified way.
>> *write_verilog -noattr good_mux_netlist.v*


#### Result:
![SKY130RTL D1SK4 L3 Lab3 Yosys 1 good mux Part3_result_0_0](https://user-images.githubusercontent.com/62828746/205514343-4116c058-f43d-449d-8772-dda8f0572d92.jpg)
*With no attribute switch, a more simplified netlist (without cell instantiation) will be generated.*
