# Introduction

Using a single .txt file, it is possible to configure the AutoExp to execute a set of tasks related to the control of the four SPARC4 cameras. 
For this purpose, AutoExp uses a pseudo-language. This pseudo-language, in turn, follows a set of structural rules and build-in commands, 
that allow the user to control the temperature of the camera, as well as, the image acquisition. Following is presented a step-by-step explanation to write a 
.txt file that the AutoExp can understand.

First of all, each command should be followed by a carrier return. So, the sequence of commands

```properties
SET_TEMPERATURE 10 EXPOSE
```

will return an error. The correct sequence should be

```properties
SET_TEMPERATURE 10
EXPOSE
```

Second, the AutoExp interprets that a blank line finishes the set of commands related to a channel. So, the sequences

```properties
SET_TEMPERATURE 10
EXPOSE

SET_TEMPERATURE 10
EXPOSE
```

are provided for two different channels. To distinguish between channels, the tag ```CHANNEL_X```, where ```X``` is the channel number, **must** precede a sequence of commands.
So, the correct syntax of the previous sequence is

```properties
CHANNEL_1
SET_TEMPERATURE 10
EXPOSE

CHANNEL_2
SET_TEMPERATURE 10
EXPOSE
```

In addition, the sequence

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

The AutoExp reads the entire file searching for the respective channel tag. If there are different command blocks with the tag ```CHANNEL_1```, each block is appended to the channel command list in the same order that they appear in the file. However, it should be highlighted that the command list of two different channels will be executed by the AutoExp at the same time. For example, with the following script

```properties
CHANNEL_1
EXPOSE

CHANNEL_2
EXPOSE
```

the AutoExp does not wait until the end of the acquisition of channel 1 to start the acquisition of channel 2. These two commands are executed at the same time.

# List of commands

Below, there is a description of the commands allowed by the AutoExp. These commands are: ```WRITE_SETUP```, ```SET_COOLER```, ```SET_TEMPERATURE```, ```SET_WAIT_TIME``` and ```EXPOSE```.


* WRITE_SETUP: this command allows the user to set the operation mode of the camera. This command **must** be followed by a set of the parameters in the JSON format that will be provided to the camera. These parameters are the exposure time (EXPTIME) in seconds, the pre-amplification gain (PREAMP), the readout rate (READOUT_RATE) in MHz, the Electron Multiplying mode (EM_MODE), the Electron Multiplying gain (EM_GAIN), the binning of the pixel (BINNING), the initial line (INITIAL_LINE), initial column (INIT_AL_COLUMN), final line (FINAL_LINE), and the final column (FINAL_COLUMN) of the image, the number of frames in an image cube (#FRAMES), and the number of cubes in a sequence (#CUBES). Below is an example to set the operation mode

```properties
WRITE_SETUP
{"EXPTIME":1,
"PREAMP":0,
"EM_MODE":0,
"EM_GAIN":2,
"READOUT_RATE":3,
"BINNING":1,
"INITIAL_LINE":1,
"INITIAL_COLUMN":1,
"FINAL_LINE":1024,
"FINAL_COLUMN":1024,
"#FRAMES":1,
"#CUBES":10}
```

The allowed values of each parameter are associated with the Software Development Kit (SDK) package provided by Andor to control the cameras. The minimal exposure time value should be 1e-5 s. The pre-amplification gain has two values: 1 and 2. The EM mode would be 0 (EM) or 1 (Conventional). The EM gain should be in the range [2, 300]. The readout rate would be 0 (0.1 MHz) or 1 (1 MHz) for the conventional mode, or 0 (30 MHz), 1 (20 MHz), 2 (10 MHz), or 3 (1 MHz) for the EM mode. The binning should be an integer in the range [1, 1024]. The initial line, initial column, final line, and final columns should be an integer in the range [1, 1024]. The number of framers should be an integer in the range [1, 1000], and the number of cubes should be an integer with a minimum value of 1.

* SET_COOLER: this command allows to control the cooler of the CCD. This command should be followed by a 0 to turn off, or 1 to turn on the cooler. Before the ```SET_TEMPERATURE``` command, the expression ```SET_COOLER 1``` should be provided to the AutoExp.

* SET_TEMPERATURE: this command allows to set the CCD temperature. This command should be followed by the CCD temperature. This temperature should be in the range of [10, -80] ºC. After this command, the AutoExp will set the camera temperature and wait until the return of the expression ```TEMPERATURE_STABILZED``` provided by the cameras. After this, the AutoExp is programmed to wait an extra time interval to guarantee thermal stabilization. This time was set to 20 minutes, but it could be set by the user using the ```SET_WAIT_TIME``` command.

* SET_WAIT_TIME: this command allows to set the time interval that the AutoExp stays idle after the thermal stabilizations of the CCDs. This command should be followed by a float number.

* EXPOSE: this command starts an acquisition

# Example of a script

Below is an example of a script that sets the operation mode of channel 1, turns on the cooler, sets the CCD temperature, and starts an exposure.

```properties
CHANNEL_1
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
"#CUBES":1,
"TRIGGER_MODE":0}
SET_COOLER 1
SET_TEMPERATURE -60
EXPOSE
```

