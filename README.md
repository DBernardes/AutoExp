Automatic Experiments Interface of the SPARC4 (AutoExp)
=======================================================

This repo has the Automatic Experiments Interface of the SPARC4 (AutoExp). It was developed to allow the automatic image acquisition of the SPARC4 cameras for engineering purposes. The AutoExp receives as a input a .txt file with a pseudo-langugage to control the software. This pseudo-langugage allows some basic commands like start an acquisition, set temperature, and wait until the thermal stabilization. Also, in this file, the CCD operation mode should be provided as a json format. To the image acquisition, the AutoExp communicates using the TCP-IP protocol with the SPARC4 Acquisition Control System ([ACS](https://github.com/DBernardes/SPARC4_ACS)). The ACS is responsible for all the management of the cameras during the acquisition of a image series. 

<p align="center">
  <img src="https://github.com/DBernardes/AutoExp/blob/main/Images/main.png" />
</p>

This README presents a step-by-step tutorial to download the latest version of the code and run a simple image acquisition test. Figure below presents an image of the AutoExp. Even though, you do not have a Andor EMCCD camera attached to your computer, the ACS runs in a simulation mode. This mode simulates the communication with the cameras, allowing the image acquisition.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites
There are some packages that need to be installed before running the software. The first one is the Software Development Kit (SDK) developed by Andor Technology to control the CCDs. The second one is the GFITSIO package, used to save the data acquired by the camera in FITS format. 

[Software Development Kit (SDK)](https://andor.oxinst.com/products/software-development-kit/)

[GFITSIO](https://github.com/USNavalResearchLaboratory/GFITSIO)


### Installing
Clone this repo using ``` git clone https://github.com/DBernardes/SPARC4_ACS.git ```

## Running the tests
1. Step one...
2. Step two...
3. Another step


## Authors and Contact

* **Denis Bernardes**: 

email: denis.bernardes099@gmail.com 

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details





