## Table of Contents
- [Introduction](#Introduction)
- [SimulinkModel](#Simulink_Model)

# Introduction

This project aimed to analyze the response of an RLC filter. Using Simulink, I created a model containing the transfer function of a series RLC filter, applied various signals to the input, and analyzed the response using Matlab.

* Filters in electronics are circuits that process electrical signals to isolate or block specific frequency bands. They allow signals of certain frequencies to pass while reducing signals of other frequencies. 

* Filters are a key component in many electronic systems and have a wide range of applications in various fields such as MCU's.

* There are diffrent types of filters depending on the damping, examples:


![filter_pics](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/8442b89d-6303-4dac-9964-0a24cd54bc84)

* In this case, the filter is a band-pass filter. We achieved this property through the series connection of the RLC components. 

* Each component in the circuit has its task:
The inductor blocks high frequencies but allows low frequencies to pass.
The capacitor blocks low frequencies.
If both low and high frequencies are blocked by the inductor and capacitor, the only frequencies that pass are the mid-range frequencies within a specific band.
Each type of filter has its characteristic frequency. In the case of our band-pass filter, this is known as the center or resonant frequency, which is determined by the formula: 

​![Zrzut ekranu 2024-05-30 195308](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/ac3e8c48-a6f9-432f-a545-a05ff35f2108)


In our case, this frequency is 
𝑓 = 15.915 kHz

Adopted component values:

𝑅 = 100 Ω
𝐿 = 10 mH
C = 10nF
# Simulink Model
![model](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/67d89704-23b9-413f-b92a-0f7e0c206ded)
