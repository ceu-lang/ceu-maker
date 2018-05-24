# CÃ©u-Maker

CÃ©u-Maker is a programming environment that integrates `ceu-arduino` and
`pico-ceu` in a single package for Windows.

## Installation

- Download the latest release from GitHub:
    - https://github.com/fsantanna/ceu-maker/releases
- Execute the downloaded file and choose the appropriate destination.
- After the installation, two windows will appear:
    - The folder `bin/`.
    - The folder `samples/`.

### Testing

- pico-CÃ©u
    - Open the folder `samples/pico-ceu/`.
    - Drag & Drop the file `all.ceu` into the icon `pico-CÃ©u` (`bin/` folder).
    - Observe the application behavior.
- CÃ©u-Arduino
    - Plug the Arduino board you want to test.
    - Execute `ceu-maker/arduino-1.8.3/arduino.exe` and configure `Tools->Board` and `Tools->Port`.
    - Open the folder `samples/ceu-arduino/`.
    - Drag & Drop the file `blink-01.ceu` into the icon `CÃ©u-Arduino` (`bin/` folder).
    - Observe the application behavior.
- Both
    - Open the folder `samples/both/`.
    - Drag & Drop the same file `serial.ceu` into the icon `pico-CÃ©u` (`bin/` folder) and then into the icon `CÃ©u-Arduino` (`bin/` folder).
    - Observe the application behavior.

-------------------------------------------------------------------------------

## Package Generation (for developers only)

CÃ©u-Maker depends on
    [CÃ©u](https://github.com/fsantanna/ceu),
    [CÃ©u-Arduino](https://github.com/fsantanna/ceu-arduino),
    [CÃ©u-SDL](https://github.com/fsantanna/ceu-sdl), and
    [pico-CÃ©u](https://github.com/fsantanna/pico-ceu).

To generate a new version of CÃ©u-Maker, use the instructions as follows or use the GUI package generator

### Collect all relevant files to CÃ©u-Maker

#### Prepare the source repositories

First, clone the source repositories:

```
$ git clone https://github.com/fsantanna/ceu
$ git clone https://github.com/fsantanna/ceu-arduino
$ git clone https://github.com/fsantanna/ceu-sdl
$ git clone https://github.com/fsantanna/pico-ceu
```

Checkout the target version for each of the source repositories, except the Céu one (use the HEAD commit), e.g.:

```
$ cd ceu/
$ git checkout v0.30
$ cd ../ceu-arduino
$ git checkout v0.30
$ ... # same for the other repositories
```

(This step can be skipped if you want to use the `master` branches.)

#### Copy to Céu-Maker

Edit `Makefile.conf` to point to the source repositories and to the WinRAR installation folder:

```
$ vi Makefile.conf
```

Note that we use [WinRAR](https://www.win-rar.com) to generate a self-extracting executable.
This repository already contains a 64-bit version of WinRAR.
If the machine used is 32-bit, download the corresponding WinRAR version and modify the *Makefile.conf*.

Run `make` using Git Bash to copy the files from the source repositories to `ceu-maker/`:

```
$ ceu-maker/mingw/bin/make.exe
```

If the command `make` does not exist, follow the instructions in the link below:

https://gist.github.com/evanwill/0207876c3243bbb6863e65ec5dc3f058

### Testing

Follow the `Installation->Testing` instructions above.

### Add release to GitHub
- Move `releases/ceu-maker.exe` to `releases/ceu-maker-vX.XX-XXX.exe`
- Add release to GitHub:
    - https://github.com/fsantanna/ceu-maker/releases/new
