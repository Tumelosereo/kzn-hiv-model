# kzn-hiv-model

## Getting started: How to run

## How to run
### Windows 10
This repo is managed with a `makefile` found in the root directory. The makefile is run in the terminal using the command `make` followed by the target. See the [make manual](https://www.gnu.org/software/make/manual/) for more details. 

Windows users needs to install/enable the Windows Subsystem for Linux. See [WSL](https://learn.microsoft.com/en-us/windows/wsl/install) for more information on how to install `WSL`. Mac OS users, ensure Xcode Command Line Tools are installed. In the terminal window, run the command `xcode-select --install` and follow the instructions.

Note that, all the packages listed above and R software needs to be installed in  `WSL`. 

### Files you should add

- Running the make commands requires the creation of `local.makefile`, which should define the following variables
    - `SHARED_DATA_FOLDER`, which specifies where the external data files are to be found on your local machine.
    
- If you are using the repository for an `R` project, you should add an `.Rproj` file that is appropriately named for your repo/project.

**Once you have GNU Make running on your machine and have set up `local.makefile` as described above, you can run `make setup` at the command line to set up the repository's directory structure.** 