**HOW SEXUAL SELECTION INFLUENCES BODY SHAPE AND SIZE IN FIGHTING TORTOISES**

Author: Meghan Miehe

Date: 2/22/2026

This repository is the study on how sexual selection influences body shape and size in the fighting tortoise. I will be working with the data shown in the file 'Data', to further the understanding of the fighting tortoises and their morphology, analysing the data from various figures, which can be found in the file 'Study plots'. Two plots show the difference in length and width of male and female tortoises and another compares sex over all the measured variables. The dataset is from Justin O'Rian's previous study on these tortoises, and hence I attribute data collection to him and his team. The file 'Code' contains the methods to clean the raw dataset, as well as the general script that enables visualisation of the figures. 

**Study design and data collection:**
The dataset came from this paper, and hence I did not carry out data collection myself.
Data collection was carried out on the Dassen island population, which has a relatively even sex ratio. Collection was done in a relatively open field with low vegetation cover, in a period when the tortoises are generally active, for behavioral and shell measurements. The measurements taken were behavior, habitat, and the physical measurements as follows; gular length, plastron length, weight, rear width, curve width, mid width, length. How measurements were taken for each observation was standardised, and each tortoise was marked with a unique ID number, which is found under the data column 'no'. Behavior was categorised into 4 types, the agressive behavior named 'Fighting' was seperated from the other behaviors named as followed ' walking, passive, feeding.
Further detail on study design can be found in the paper: 
Mann, G.K.H., O’Riain, M.J. & Hofmeyr, M.D. 2006. Shaping up to fight: sexual selection influences body shape and size in the fighting tortoise ( Chersina angulata ). Journal of Zoology. 269(3):373–379. DOI: 10.1111/j.1469-7998.2006.00079.x.

Each column contains a variable recorded when collecting data from the tortoises, such as the ID number of the tortoise, its sex and its behaviour. The column named 'no' represents the ID number of each tortoise, eg. G1. Seven measurement types were done on each tortoise(listed under measurement type) and a corresponding measurement value recorded for each. Each row represents a new type of measurement for an individual, and a new individual is represented by a new ID number. The individuals are grouped per ID number as per long format, a new individual's measurements starting every 7th observation. 

**Code:**
RStudio, vesrion 4.5.2 of R, was used to clean, analyse and visualise the collected data.
The pacakages as followed were loaded: Tidyverse, dpylr, janitor and readxl. 
Janitor was used to clean the varaibale heading names, to a cleaner name that presented less issues with the R format ie. no spaces or capital letters.
Tidyverse and dplyr were used to tidy the code, converting the categorical variables, sex, habitat and behavior into factors and converting the table to long format.
ggplot2 was used to format and produce the plots.

Binder badge: 
[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/Meghan-M/D2---Tortoise-data-/HEAD)



