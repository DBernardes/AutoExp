Using a single .txt file, it is possible to configure the AutoExp to execute a set of tasks related with the control of the four SPARC4 cameras. 
For this purpose, the AutoExp uses a pseudo-language. This pseudo-language, in turn, follows a set of strucutral rules and build-in tags, 
that allows the user to control the cameras temperature, as well as, the image acquisition. Following, is presented a step-by-step explanaition to write a 
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

