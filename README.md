# Acoustic Holography Measurement Dataset

This repository contains the raw measurement data acquired for the Near-Field Acoustic Holography (NAH) experiments together with the MATLAB script used to convert the measurements into MATLAB .mat files for further processing.

## Microphone Array
Measurements were acquired using a **6 × 10 planar microphone array** (60 microphones) with 7.5 cm spacing between adjacent microphones.

## Measurement Configurations
The dataset contains measurements for three loudspeaker positions:

- **Central near position** – loudspeaker centered to the center of the array with a measurement distance of 5 cm.
- **Central far position** – loudspeaker centered to the center of the array with a measurement distance of 18 cm.
- **Right-bottom corner near position** – loudspeaker located at the lower-right corner of the array with a measurement distance of 5 cm.

## Repository Contents

### RawData/
Contains the original measurement files in `.txt` format organized in 3 subfolders, one for each measurement position. Each measurement consists of a set of 60 files, corresponding to the 60 microphone positions of the array. 
The files are ordered such that the first file should refer to the microphone at the right bottom corner of the array. Then they proceed by columns going up. So the first file refers to the microphone 6x10 then the next is 5x10 the next 4x10 etc (assuming the first row and column have index 1).
A total of 3 measurements were done, the folders name indicate the position of the source they refer to in respect to the array. For each measurement there's also another subfolder (NoiseFloor/) that contains the autospectrum of 1 microphone (the one at the rigt bottom corner) recorded while the source was On and Off,, along with screenshots; this can be used to compute the SNR. 

### DataMatlabExtract/
Here there's the MATLAB script that reads each set of 60 text files and stores the pressure measurements in a single `.mat` file for use in later NAH processing. You may need to change the folder path the script looks into to choose a certain measurement set of files. In the folder the correspondent `.mat` files are already included.

### ProjectPulseBackup/
Contains the B&K Pulse project file used for the measurements.

### Report/
Contains a copy of the report done in the course.

