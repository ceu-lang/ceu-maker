# Céu-Maker

Céu-Maker is a programming environment that integrates `Céu-Arduino` and `Pico-Céu` in a single package for Windows and Ubuntu.

## Installation

- Download the latest release from GitHub:
    - https://github.com/ceu-lang/ceu-maker/releases
- If you are on Windows:
    - Execute the downloaded file and choose the appropriate destination
    - After the installation, two windows will appear:
        - The folder `bin/`.
        - The folder `examples/`.
    - Céu-Arduino needs the .Net Framework 4. You can download it from [here](https://www.microsoft.com/pt-br/download/details.aspx?id=17851). To check if the download and installation are necessary, simply try to run a Céu-Arduino application and check if it produces a ```.Net Framework initialization error```.
- If you are on Ubuntu:
    - Extract the `tar.gz` downloaded file in a any destination
    - Run `sudo make`

### Testing

- pico-Céu
    - Open the folder `examples/pico-ceu/`.
    - Drag & Drop the file `all.ceu` into the icon `pico-Céu` (`bin/` folder).
    - Observe the application behavior.
- Céu-Arduino
    - Plug the Arduino board you want to test.
    - Open the folder `examples/ceu-arduino/`.
    - Drag & Drop the file `blink-01.ceu` into the icon `Céu-Arduino` (`bin/` folder).
    - Choose in which board and port the application should be deployed
    - Observe the application behavior.
- Both
    - Open the folder `examples/both/`.
    - Drag & Drop the same file `serial.ceu` into the icon `pico-Céu` (`bin/` folder) and then into the icon `Céu-Arduino` (`bin/` folder).
    - Observe the application behavior.

-------------------------------------------------------------------------------

## Package Generation (for developers only)

### Céu-Maker Windows version (windows only)
Open *Git Bash*, clone this repository, and run `make`:

```
$ git clone https://github.com/ceu-lang/ceu-maker/
$ cd ceu-maker/
$ ceu-maker/ceu-maker-windows/mingw/bin/make.exe windows
```

This will download all dependencies and generate a self-extracting package
`releases/ceu-maker.exe` with the Céu-Maker.

### Céu-Maker Ubuntu version (ubuntu only)
Open a terminal, clone this repository, and run `make`:

```
$ git clone https://github.com/ceu-lang/ceu-maker/
$ cd ceu-maker/
$ make ubuntu
```

This will download all dependencies and generate a .tar.gz package
`releases/ceu-maker.tar.gz` with the Céu-Maker.

### Release a new version

To release a new version, add the release to *GitHub*:
- https://github.com/ceu-lang/ceu-maker/releases/new

### More options
- Choose the branch used to create the releases (the default is master)

    ```
    make <windows/ubuntu> BRANCH=<branch>
    ```

- Clean files and folders created in `ceu-maker-windows` or `ceu-maker-ubuntu` directory
    ```
    make clean TARGETOS=<windows/ubuntu> 
    ```
    The folders `releases` and `ceu-maker\resources\both\repos` are also created by `make <windows/ubuntu>` but can only be deleted manually.