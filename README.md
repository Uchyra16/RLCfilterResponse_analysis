## Table of Contents
- [Introduction](#Introduction)
- [Theory](#Theory)
- [SimulinkModel](#Simulink)
- [BodePlots](#BodePlots)
- [ComparsionOfPhase](#ComparsionOfPhase)

# Introduction

This university project aimed to analyze the response of an RLC filter. Using Simulink, I created a model containing the transfer function of a series RLC filter, applied various signals to the input, and analyzed the response using Matlab.

# Theory

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
# Simulink
![model](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/67d89704-23b9-413f-b92a-0f7e0c206ded)

# BodePlots
* Bode plots are used to analyze the frequency response of the RLC filter. The plots include both magnitude and phase responses, providing a comprehensive view of the filter's performance across different frequencies. In this project, the Bode plots were generated using MATLAB/Simulink to visualize the behavior of the filter.

![bode](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/ab653bf5-3e97-4675-94ad-0ddda3901eaa)

* At the center frequency of 15.984 kHz, the magnitude plot of the series RLC filter illustrates how the amplitude of the output signal varies with frequency. Typically, at the center frequency, the magnitude response peaks, indicating the maximum amplitude of the output signal.
* The phase shift is typically measured in degrees and indicates the phase difference between the input and output signals. At the center frequency, the phase shift approaches zero



**Bode plot for sinus wave input:**
  
![sin](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/4b9d2c53-bd23-4a7c-8af6-8c192fe7da74)

**Bode plot for impulse input:**

![imp](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/6e0ef000-2755-43b3-aee9-15c4b416f1f2)
# ComparsionOfPhase
**Comparison of phase depending on the input frequency:**

![porownanieFazy](https://github.com/Uchyra16/RLCfilterResponse_analysis/assets/125763535/014e1828-04f2-4ad1-b624-66009d1505ad)

* According to the obtained Bode plot, frequencies below the resonant frequency are phase-shifted by +90 degrees, the resonant frequency aligns with the phase, and frequencies above are phase-shifted by -90 degrees.


