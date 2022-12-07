# Intel SD Training 

## Table of contents
+ **[ Day 0 - System/Tool Setup Check. GitHub ID creation ](https://github.com/teoh5128/intel-sd-training#day-0)**
  * [ Lab Topic -Setup Labs](https://github.com/teoh5128/intel-sd-training/blob/main/readme.md#lab-topic---setup-labs)
+ **[ Day 1 - Introduction to Verilog RTL design and Synthesis](https://github.com/teoh5128/intel-sd-training#day-1)**
  * [ Lab Topic - SKY130RTL D1SK2 L1 Lab1 introduction to lab](https://github.com/teoh5128/intel-sd-training/blob/main/readme.md#lab---sky130rtl-d1sk2-l1-lab1-introduction-to-lab)
+ **[ Day 2 - Timing libs(QTMs/ETMs), hierarchical vs flat synthesis and efficient flop coding styles](https://github.com/teoh5128/intel-sd-training/blob/main/readme.md#day-2)**
  * [ Lab Topic - SKY130RTL D2SK1 - Introduction to timing .libs

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



## Lab Topic - Setup Labs
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

![iVerilog Based Simulation Flow_1a](https://user-images.githubusercontent.com/62828746/205515413-06107299-7637-4000-a983-5ab9c8d46210.jpg)

1. **RTL design** and **testbench** are applied to iVerilog as inputs.
2. **iVerilog** simulating the design while any changes in value will be generated as VCD file.
3. **GTKwave** which is a graphic application helps in viewing the waveform.
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

1. **Netlist** and **testbench** are applied to iVerilog as inputs.
2. **iVerilog** simulating the design while any changes in value will be generated as VCD file.
3. **GTKwave** which is a graphic application helps in viewing the waveform.
4. Through the waveform, we can observe whether the input and output meet design specification. 

===========================================================================

### **How Flavours of Gate Effect Ciruit Operation Speed**

Combinational delay in logic path determine the maximum operation speed of digital logic circuit.

![Flavours of Gate (Fast vs Slow)](https://user-images.githubusercontent.com/62828746/205507225-0ab7c70d-3752-4aa8-8e97-dcf57d984a3f.jpg)

* The **minimum clock period** must be larger than the total time taken for propogation delay in both DFF A and combinational logic and setup time in DFF B.
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

* **Capacitance** - it's a load in digital logic ciruit. Faster charging/discharging rate will reduce cell delay and make cell A to drive cell B faster.
* **Transistor** - Wider transistor has higher capable of sourcing larger current and will result in faster capacitance charging/discharging rate. However, will wider transistor will consume larger area and power.

* In shorts, faster cells need to trade off with **area and power**.


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

## Lab Topic - SKY130RTL D1SK2 L2 Lab2 Introduction iverilog gtkwave part1
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
>> *read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
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
*mux2_1 is a multiplexer that will switch two input lines to a single common output line.*

## Lab - SKY130RTL D1SK4 L1 Lab3 Yosys 1 good mux Part3

#### Steps:
> 1. To write out synthesized netlist
>> *write_verilog good_mux_netlist.v*
> 2. To write out synthesized netlist in more simplified way.
>> *write_verilog -noattr good_mux_netlist.v*


#### Result:
![SKY130RTL D1SK4 L3 Lab3 Yosys 1 good mux Part3_result_0_0](https://user-images.githubusercontent.com/62828746/205514343-4116c058-f43d-449d-8772-dda8f0572d92.jpg)
*With no attribute switch, a more simplified netlist (without cell instantiation) will be generated.*


## Day 2
## Topic - Timing libs(QTMs/ETMs), hierarchical vs flat synthesis and efficient flop coding styles


## **Cell Library Characterization**
* Cell library characterization important for moedeling standard cells in library.
* Models suitable for each chip implementations flows are different due to variations.
* Standard cell characterization used for collection cell's information such as leakage power, area, pins and timing.
* Synthesis tools need to know cell logic function, load, speed of cell under variation, power consumed, area and etc to synthesize behavioral description for standard cells.
* Even variation exist will effect cell's performance, but we need to make Silicon die works well in every corner.

===========================================================================

## **PVT**
* Cells behavior strongly depends on factors such as PVT, input signals and output load.
* To make fabricated chips working in all possible condition, stimulate it at different corners of process, voltage and temperature.
* While looking at best and worst PVT conditions allows us to predict lower and upper limitation of cell bahvior which are important to ensure the overall functionality of the design.


P (Process)                                      | V (Voltage)                                    | T (Temperature)
---------------------------------------------    | ---------------------------------------------  | --------------------------------------------- 
Different task or die area (center/boundary) has different process variation during fabrication | IR drop or supply noise might cause voltage variation. Even supplied voltage might not be stable all the time |  Density of transistor is inconsistent throughout the chip and resulting in power dissipation and temperature variation across the chip

===========================================================================

## **Hierachical and Flat Synthesis**

Content   | Hierachical Synthesis | Flat Synthesis
---| --------------------  | -------------------- 
Definitions | Contains more than one module inside entire design. Each modules has interdependencies and have signals travelling between modules. | Contains only one module for entire design. It's a set of flat schematics and has no module interdependencies.
Pros | Sub-modules pins are accessible, it's easier to track path during functional debugging and timing analysis.  | Synthesis tool can optimize the circuit for better speed, area and power. 
Cons | Might cause issues when synthesize large design with massive sub-modules. | Debugging capabilities are limited.
Prefered | Prefered for human read-ability and debug purposes | Prefered when design has massive sub_modules, can synthezie one of it and stitch each netlist into top-level netlist.

===========================================================================

## **Glitch**
* For combinational logic, propagation delay will cause output glitch.
* **Glitch** is unwanted and must be fixed.

![Glitch](https://user-images.githubusercontent.com/62828746/206111766-51f85c9d-62fd-4a7e-a331-9750b338ed2e.jpg)

===========================================================================

## **DFF**
* To fix glitch we need an element to store value periodically.
* **D Flip-flop** - acts as an electronic memory component since the output remains constant unless deliberately changed by altering the state of the D input at the given edge of clock.

![glitch combi](https://user-images.githubusercontent.com/62828746/206115287-75f6b5b8-5554-4464-9063-b0a9d8635d4c.jpg)
* Combinational circuit for sure will have output glitch due to logic gate propagational delay.
* Continous combitional circuit will even cause output continously has glitchy output and never settle down.

![stable combi](https://user-images.githubusercontent.com/62828746/206115291-cb106a81-7ce0-43f9-ab94-e0edf2e222b8.jpg)
* To avoid that, insert DFF for each combinational circuit.
* DFF shielded from D through clock, which means Q will only change whenever clk edge rise/fall and will not effcted by D.
* Even input is glitch, output of DFF will become stable and feed stable signal to next combinational circuit.


===========================================================================

## **Different type of flop and function**
* Initial state of flip-flop is importtant to avoid next combinational logic grab and evaluate flip-flop value that are not yet initialized.
* Initialze of flip flop included set, reset, synchronous and asynchronous.

![asyn_dff](https://user-images.githubusercontent.com/62828746/206149008-ab6e106a-de71-4be7-a552-d327920d37b9.jpg)
* In **asynchronous reset**, the Flip Flop will not wait for the clock and sets the output right at the edge of the reset.
* Fast implmentation cause no need to wait for clock signal to be applied.

![sync_dff](https://user-images.githubusercontent.com/62828746/206149022-31e6c2b9-a46c-444c-89e1-e0c60325e8f3.jpg)
* In **synchronous Reset**, the Flip Flop waits for the next edge of the clock ( rising or falling), before applying the Reset of Data.
* If duration of rising edge of clock and reset edge is too short might causing metastability issues.
* DFF must have certain minimum time between reset edge and clock edge, which is reset recovery time. 

![asyn_sync_dff](https://user-images.githubusercontent.com/62828746/206149017-a90fa6d4-1492-46da-9d63-c432c00a727e.jpg)
* If both **aysnchronous reset and synchronous** reset are used, asynchronous reset has higher priority compared to synchronous reset.

===========================================================================

## Lab Topic - SKY130RTL D2SK1 - Introduction to timing .libs

## Lab - SKY130RTL D2SK1 L1 Lab4 Introduction to dot Lib part1

#### Steps:
> 1. Open library file and review what contains in .lib file. [*DO NOT EDIT .LIB FILE, ONLY READ]
>> *vim /lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
> 2. Tips to switch off syntax for more pleasant review experience. 
>> *:syn off*
> 3. Look into the information contains in .lib, such as library name, power, voltage and temperature of cell.

#### Result:

![SKY130RTL D2SK1 L1 Lab4 Introduction to dot Lib part1_result](https://user-images.githubusercontent.com/62828746/205701093-f65384e7-3f54-4ad0-b684-2d55bac72677.jpg)
*PVT information in .lib are important variations for a design to work.*

## Lab - SKY130RTL D2SK1 L2 Lab4 Introduction to dot Lib part2

#### Steps:
> 1. There are various type of standard cells inside .lib file, we will see each cell features inside .lib.
>> *refer to resut_1.jpg*
> 2. To understand cell functionality, can review its equivalent verilog model.
>> *:sp ../my_lib/verilog_model/*
> 3. Delay and leakage power for all possible combitional inputs for a cell are also listed inside .lib.
>> *refer to result_2.jpg*

#### Result:
![SKY130RTL D2SK1 L2 Lab4 Introduction to dot Lib part2_0a](https://user-images.githubusercontent.com/62828746/205701105-9d011958-99a0-49aa-9948-bd993caf6c6d.jpg)
*resut_1*

![SKY130RTL D2SK1 L2 Lab4 Introduction to dot Lib part2_1a](https://user-images.githubusercontent.com/62828746/205701108-a5bf7783-2d6f-49f1-9864-7d5cbe98d6df.jpg)
*resut_2*

![SKY130RTL D2SK1 L2 Lab4 Introduction to dot Lib part2_2a](https://user-images.githubusercontent.com/62828746/205701110-67e8a486-fd22-4e4b-9c24-6cb99faf31f3.jpg)

## Lab - SKY130RTL D2SK1 L3 Lab4 Introduction to dot Lib part3
Related with theory part: [How Capacitance Effect Circuit's Speed](https://github.com/teoh5128/intel-sd-training/blob/main/readme.md#how-capacitance-effect-circuits-speed)

#### Steps:
> 1. Same cell type with different flavour will have different value in leakage power and area.
>> *:vsp*

#### Result:
![SKY130RTL D2SK1 L3 Lab4 Introduction to dot Lib part3_result_0a](https://user-images.githubusercontent.com/62828746/205701114-6f4f12b9-da8b-4143-b160-bcab608269d4.jpg)
*Faster cell with higher power has larger transistor, and will trade off with area consumed.*


## Lab Topic - SKY130RTL D2SK2 - Hierarchical vs Flat Synthesis

## Lab - SKY130RTL D2SK2 L1 Lab05 Hier synthesis flat synthesis part1

#### Steps:
> 1.Take multiple_modules as example, may load multiple_modules.v file and review it's sub-module functionality.
>> *vim multiple_modules.v*
> 2. Run synthesis to see how top modules and sub-modules synthesis result make differences.
>> * *yosys*
>> * *read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *read_verilog multiple_modules.v*
>> * *synth -top multiple_modules*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show multiple_modules*
>> * *write_verilog -noattr multiple_modules_hier.v*
> 3. Open and review generated netlist.
>> * *!vim multiple_modules_hier.v*
>> * *refer to result_2.jpg*

#### Result:
![SKY130RTL D2SK2 L1 Lab05 Hier synthesis flat synthesis part1_result](https://user-images.githubusercontent.com/62828746/205941637-f46452bf-1c33-4c2a-9520-ec809fe51dd7.jpg)

![SKY130RTL D2SK2 L1 Lab05 Hier synthesis flat synthesis part1_result_0](https://user-images.githubusercontent.com/62828746/205940021-e3550d9f-5d2f-4093-abc5-bbf904e1ecc0.jpg)
*Instead of AND and OR logic gate, we see U1 and U2, this is the hierachical design*

![SKY130RTL D2SK2 L1 Lab05 Hier synthesis flat synthesis part1_result_1](https://user-images.githubusercontent.com/62828746/205940035-aca88f85-7eeb-4b22-adb1-09a46b43664d.jpg)
*result_2.jpg*


## Lab - SKY130RTL D2SK2 L2 Lab05 Hier synthesis flat synthesis part2

#### Steps:
> 1. Use command to write out flat netlist.
>> * *flatten*
>> * *write_verilog -noattr multiple_modules_flat.v*
> 2. Open and review generated netlist.
>> *!vim multiple_modules_flat.v*
> 3. Instead of multiple_modules, now try to do a sub-module level synthesis.
>> * *yosys*
>> * *read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib 
>> * *read_verilog multiple_modules.v*
>> * *synth -top sub_module1*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show*

#### Result:

![SKY130RTL D2SK2 L2 Lab05 Hier synthesis flat synthesis part2_0](https://user-images.githubusercontent.com/62828746/205951977-f5421835-b178-46d7-9fc5-6129d4cb07f0.jpg)

![SKY130RTL D2SK2 L2 Lab05 Hier synthesis flat synthesis part2_1](https://user-images.githubusercontent.com/62828746/205951986-657e5cee-aefa-4a79-9738-0303eba015ea.jpg)

![SKY130RTL D2SK2 L2 Lab05 Hier synthesis flat synthesis part2_2](https://user-images.githubusercontent.com/62828746/205951994-b0a98ae0-f52c-4d5e-baef-206a4ab6cb30.jpg)


## Lab Topic - SKY130RTL D2SK3 - Various Flop Coding Styles and optimization
## Lab - SKY130RTL D2SK3 L3 Lab flop synthesis simulations part1

#### Steps:
> 1. Take asynchronous reset flip flop as example. Run simulation by apply RTL Design (dff_asyncres.v) and testbench (tb_dff_asyncres.v) as inputs.
>> * *iverilog dff_asyncres.v tb_dff_asyncres.v*
>> * *./a.out*
>>  *gtkwave tb_dff_asyncres.vcd*
> 2. Take synchronous reset flip flop as example. Run simulation by apply RTL Design (dff_syncres.v) and testbench (tb_dff_syncres.v) as inputs.
>> * *iverilog dff_syncres.v tb_dff_syncres.v
>> * *./a.out*
>> * *gtkwave tb_dff_syncres.vcd*

#### Result:
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part1_0](https://user-images.githubusercontent.com/62828746/206079681-127eb22e-f0fd-4a01-8ba5-6c99e106ab35.jpg)
*asynchronous reset flip flop waveform*
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part1_1](https://user-images.githubusercontent.com/62828746/206079656-679d86f4-36e9-49f9-9add-94d2acdd0d80.jpg)
*asynchronous reset flip flop waveform*
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part1_2](https://user-images.githubusercontent.com/62828746/206079660-462b73df-ad21-476a-a32b-8c75b3a49aed.jpg)
*synchronous reset flip flop waveform*
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part1_3](https://user-images.githubusercontent.com/62828746/206079666-3ba2f68f-6a04-430d-aa37-8d51ac88a8aa.jpg)
*synchronous reset flip flop waveform*

## Lab - SKY130RTL D2SK3 L4 Lab flop synthesis simulations part2

#### Steps:
> 1. We have done simulation of flip flop in part1, now run synthesis for asynchronous_reset flip flop and see the netlist.
>> * *yosys*
>> * *read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *read_verilog dff_asyncres.v*
>> * *synth -top dff_asyncres*
>> * *dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib -> this will make it only looking for flip flop standard cell in .lib*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show*

> 2. Read asynchronous_set flip flop netlist.
>> * *read_verilog dff_async_set.v*
>> * *synth -top dff_async_set*
>> * *dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show*

> 3. Read synchronous_reset flip flop netlist.
>> * *read_verilog dff_syncres.v*
>> * *synth -top dff_syncres*
>> * *dfflibmap -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show*

#### Result:
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part2_0](https://user-images.githubusercontent.com/62828746/206079667-6627f537-235f-4f98-98dd-49e506b7e50a.jpg)
*Command dfflibmap used will only looking for flip flop standard cell in .lib file.*
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part2_1](https://user-images.githubusercontent.com/62828746/206079670-39d2ba3f-005f-4d7a-b9a6-0e71333b4d8c.jpg)
*Differences of asynchronous_reset with asynchronous_set*
![SKY130RTL D2SK3 L4 Lab flop synthesis simulations part2_2](https://user-images.githubusercontent.com/62828746/206079674-bc8452b9-4bfa-4194-a0ed-22dc56f95deb.jpg)
*Synchronous_reset flip flop grapgical block*

## Lab Topic - SKY130RTL D2SK3 - Various Flop Coding Styles and optimization
## Lab - SKY130RTL D2SK3 L5 Interesting optimisations part1

#### Steps:
1. Run multiplexer_2 synthesis and review it's netlist and grpahical block.
>> * *yosys*
>> * *read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib* 
>> * *read_verilog mult_2.v*
>> * *synth -top dff_asyncres*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show*
>> * *write_verilog -noattr mul2_net.v*

#### Result:
![SKY130RTL D2SK3 L5 Interesting optimisations part1_0](https://user-images.githubusercontent.com/62828746/206079676-189935c3-e858-4d57-8684-16880b3f6a6b.jpg)


## Lab - SKY130RTL D2SK3 L5 Interesting optimisations part1

#### Steps:
1. Run multiplexer_8 synthesis and review it's netlist and grpahical block.
>> * *yosys*
>> * *read_liberty -lib ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *read_verilog mult_8.v*
>> * *synth -top mult8*
>> * *abc -liberty ../lib/sky130_fd_sc_hd__tt_025C_1v80.lib*
>> * *show*
>> * *write_verilog -noattr mul8_net.v*

#### Result:
![SKY130RTL D2SK3 L5 Interesting optimisations part1_1](https://user-images.githubusercontent.com/62828746/206079678-c3a23b3d-59c1-4b40-bb79-010964f8ae09.jpg)
