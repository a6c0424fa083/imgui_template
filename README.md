# Template

Write some info about the project and it's build process here...

## How to install the necessary tools for building the Project

### Mac

- The compiler ```clang++``` can be installed
  by installing the command line tools via ```xcode-select --install```
  and finish the installation in the GUI System Settings -> Software Updates
- Install ```brew``` (installation guide can be found here: https://brew.sh)
- Install ```cmake``` and ```make``` using ```brew install cmake make```

### Linux

- Use your packet manager e.g. ```apt``` or ```packman``` to install ```cmake``` and ```make```
- Apt example: ```apt install cmake make gcc g++ gdb``` (gcc etc. are the compilers)

### Windows

- Install the cygwin packet manager following this guide https://cygwin.com/install.html<br>
- Install ```cmake```, ```make``` via cygwin
- Install and compile with Visual Studio CE >=2022

**NOTE:** You may need to install some extra libraries. Follow the error coded created by cmake or make...
