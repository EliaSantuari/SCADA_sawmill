# Intelligent Distributed Systems - SCADA system for Multi-Line Sawmills
This repository contains the source code, simulation models, and analysis scripts for the final project of the Intelligent and Distributed Systems course. The project implements the simulation of an industrial sawmill, comparing a modern/distributed control approach (SCADA) with a traditional one (CLASSIC). The other cases analysed in the report we modified the simulation file and the other scripts in order to simulate what we wanted to compare. 


## File Structure
The project folder is organized as follows:
* **main_param_SCADA.m** (MATLAB Script): The main initialization script for the SCADA configuration. It contains all the parameters for the machines, the warehouse, and the simulation itself. It must be run before launching the main simulation.

* **SCADA_Sawmill.slx** (Simulink Model): The main simulation model where you can monitor the machine operations and interact with the SCADA interface.

* **main_param_CLASSIC.m** (MATLAB Script): The initialization script containing the parameters for the traditional control version.

* **Classic_Sawmill.slx** (Simulink Model): The simulation model for the classic version, to be launched if you want to view the system with a pre-established cutting schedule, non-distributed speed control, and a non-intelligent warehouse. 

* **prod_plot_tot.m** (MATLAB Script): Script to generate and display production histograms (warehouse status) for each production section.

* **prod_plot_machines.m** (MATLAB Script): Similar to the previous one, but provides deeper detail by showing exactly what each individual machine produced within each section.

* **prob_dist_width.m** (MATLAB Script): Script to analyze and display the trend of board width estimates, comparing the stages before and after the first cut.

* **real_vs_est_num_board.m** (MATLAB Script): Script to plot and compare the estimated versus the actual number of boards for each production line and each machine.

* **camera.m** (MATLAB Script): Script used to simulate and compare the camera's discrete error model against the continuous Gaussian error model used in the simulation.

* **diam_width_unc.nb** (Wolfram Mathematica Notebook): Analytical notebook used to derive the propagated uncertainty formula on the board width starting from the uncertainty of the log diameter measurement via symbolic computation.


### Note on Report and Reproducibility
For a comprehensive analysis of all investigated test cases, please refer to the main project report. Please note that while all results and plots documented in the report were generated exclusively using the files provided in this repository, they may be difficult to reproduce exactly. This is due to the high sensitivity of the system and the extensive number of interdependent parameters involved in the simulation runs.

## Authors & Credits
This project was developed for the **Intelligent Distributed Systems** course by:
* **Michelini Samuele** - [GitHub: samumiche / ]
* **Santuari Elia** - [GitHub: EliaSantuari / elia2001elia@gmail.com]

**Course Professor:** Prof. Fontanelli Daniele
**Academic Year:** 2025/2026