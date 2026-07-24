Acoustic Holography Measurement Dataset

This repository contains the raw measurement data acquired for the Near-Field Acoustic Holography (NAH) experiments together with the MATLAB script used to convert the measurements into MATLAB .mat files for further processing.

Repository contents
RawData/
Original measurement files in .txt format. Each measurement consists of a set of 60 files, corresponding to the 60 microphone positions of the array.
txt2mat.m
MATLAB script that reads each set of 60 text files and stores the pressure measurements in a single .mat file for use in the NAH processing pipeline.
Microphone array

Measurements were acquired using a 6 × 10 planar microphone array (60 microphones) with 34 mm spacing between adjacent microphones. The array dimensions are approximately 0.34 m × 0.18 m, providing spatial sampling suitable for measurements up to approximately 5 kHz according to the spatial Nyquist criterion.

Measurement configurations

The dataset contains measurements for three loudspeaker positions:

Central near position – loudspeaker centered with a measurement distance of 5 cm.
Central far position – loudspeaker centered with a measurement distance of 18 cm.
Right-bottom corner near position – loudspeaker located near the lower-right corner of the array with a measurement distance of 5 cm.

Each configuration contains the corresponding set of 60 microphone recordings that can be converted into MATLAB format using the provided script.