Automatic Experiments Interface of the SPARC4 (AutoExp)
=======================================================

This repo has the Automatic Experiments Interface of the SPARC4 (AutoExp). The AutoExp was developed to allow the automatic image acquisition of the SPARC4 cameras for engineering purposes. The AutoExp receives as a input a .txt file with a pseudo-langugage to control the software. This pseudo-langugage allows some basic commands like start an acquisition, set temperature, and wait until the thermal stabilization. Also, in this file, the CCD operation mode should be provided as a json format. For the image acquisition, the AutoExp communicates using the TCP-IP protocol with the SPARC4 Acquisition Control System ([ACS](https://github.com/DBernardes/SPARC4_ACS)). The ACS is responsible for all the management of the cameras during the acquisition of a image series. Even though you do not have a Andor EMCCD camera attached to your computer, the ACS runs in a simulation mode. This mode simulates the communication with the cameras, allowing the image acquisition.

This README presents a step-by-step tutorial to download the latest version of the code and run a simple image acquisition test. Figure below presents an image of the AutoExp. 

<p align="center">
  <img src="https://github.com/DBernardes/AutoExp/blob/main/Images/main.png" />
</p>

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

First, you need to clone the ACS repo in your local computer. Therefore, use the following command: 

``` git clone https://github.com/DBernardes/SPARC4_ACS.git ```

Then, there are some packages that need to be installed before running the software. The first one is the Software Development Kit (SDK) developed by Andor Technology to control the CCDs. The second one is the GFITSIO package, used to save the data acquired by the camera in FITS format. 

[Software Development Kit (SDK)](https://andor.oxinst.com/products/software-development-kit/)

[GFITSIO](https://github.com/USNavalResearchLaboratory/GFITSIO)


### Installing
Clone this repo using ``` git clone https://github.com/DBernardes/AutoExp.git ```

## Running the tests
1. Open the ACS project and run the S4ACS_Controller.vi. This will star the communications with the cameras.
2. Open the AutoExp project and run the main.vi.
3. Wait until the green leds turn on
4. Choose the script file. If you do not have a script file, you can find some example files in the "Scripts" folder.
5. Press start. The AutoExp should start the procedure found in the script file.

## Description of the pseudo-languge of the script files

Using a single .txt file, it is possible to configure the AutoExp to execute a set of tasks related with the control of the four SPARC4 cameras. For this purpose, the AutoExp uses a pseudo-language. This pseudo-language, in turn, follows a set of strucutral rules and build-in tags, that allows the user to control the cameras temperature, as well as, the image acquisition. Following, is presented the explanaition to write a .txt file that the AutoExp can understand.

First of all, each command should be followed by a carrier return. So, the sequence of commands

```properties
SET_TEMPERATURE 10 EXPOSE
```

will return an error. The correct sequence should be

```properties
SET_TEMPERATURE 10
EXPOSE
```

Second, the AutoExp interprets that a blank line finishes the set of commands related with a channel. So, the sequences

```properties
SET_TEMPERATURE 10
EXPOSE

SET_TEMPERATURE 10
EXPOSE
```

are provided for two different channels.  
To distinguish between channels, the tag ```CHANNEL_X```, where ```X``` is the channel number, **must** precede a sequence of commands.
So, the correct syntax of the previous sequence of commands would be 

```properties
CHANNEL_1
SET_TEMPERATURE 10
EXPOSE

CHANNEL_2
SET_TEMPERATURE 10
EXPOSE
```

In addition, the sequence of commands

```properties
CHANNEL_1
SET_TEMPERATURE 10
EXPOSE
```

will return the same result of

```properties
CHANNEL_1
SET_TEMPERATURE 10

CHANNEL_1
EXPOSE
```

The command ```WRITE_SETUP``` allows the user to set the operation mode of the camera. This command **must** be followed by a set of the parameters in the JSON format that will be provided to the camera. These parameters are the exposure time (EXPTIME) in seconds, the pre-amplification gain (PREAMP), the readout rate (READOUT_RATE) in MHz, the Electron Multiplying mode (EM_MODE), the Electron Multiplying gain (EM_GAIN), the binning of the pixel (BINNING), the initial line (INITIAL_LINE), initial column (INIT_AL_COLUMN), final line (FINAL_LINE), and the final column (FINAL_COLUMN) of the image, the number of frames in a image cube (#FRAMES), and the number of cubes in a sequence (#CUBES). Below is one example to set the operation mode

```properties
WRITE_SETUP
{"EXPTIME":1,
"PREAMP":0,
"READOUT_RATE":3,
"EM_MODE":0,
"EM_GAIN":2,
"BINNING":1,
"INITIAL_LINE":1,
"INITIAL_COLUMN":1,
"FINAL_LINE":1024,
"FINAL_COLUMN":1024,
"#FRAMES":1,
"#CUBES":10}
```




## Authors and Contact

* **Denis Bernardes**: 

email: denis.bernardes099@gmail.com 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details





