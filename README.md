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
Contains the original measurement files in `.txt` format. Each measurement consists of a set of 60 files, corresponding to the 60 microphone positions of the array. A total of 3 measurements were done, the folders name indicates the position of the source they refer to in respect to the array.

### DataMatlabExtract/
Here there's the MATLAB script that reads each set of 60 text files and stores the pressure measurements in a single `.mat` file for use in later NAH processing. You may need to change the folder path the script looks into to choose between a certain measurement set of file or another one. In the folder the correspondent `.mat` files are already included.

### ProjectPulseBackup/
Contains the B&K Pulse project file used for the measurements.

### Report/
Contains a copy of the report done in the course.

