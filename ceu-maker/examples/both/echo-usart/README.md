## Echo app example

[Video](https://youtu.be/u72g1txgyMo)

A simple echo application to exemplify the communication using serial port between Céu-Arduino and pico-Céu. Its operation is as follows:
- An Arduino running the application is connected to a computer running its pico-Céu version. At that moment, Arduino is waiting for a button click and pico-Céu, for receiving a string via serial port;
- The user clicks on the Arduino button, and the Arduino sends the "send" string via serial. After that, Arduino starts waiting for a string;
- The pico-Céu application receives the string and sends back a string "echo". After, it starts waiting for a string again;
- The Arduino receives the string "echo" and starts waiting for a button click again.

It's composed by only one file, the ```echo.ceu```, that can be compiled by [Céu-Arduino.exe](https://github.com/ceu-lang/ceu-maker/tree/develop/ceu-maker/bin) and [pico-Céu.exe](https://github.com/ceu-lang/ceu-maker/tree/develop/ceu-maker/bin) to create, respectively, the arduino and the pico-céu versions.

The differentiation between the code for Arduino and the one for pico-Céu is done using ```CEUMAKER_ARDUINO``` and ```CEUMAKER_PICO```:
```cpp
#ifdef CEUMAKER_ARDUINO
  // Céu-arduino code
#elif defined CEUMAKER_PICO
  // pico-Céu code
#endif
```

### Arduino Circuit
![](https://uploaddeimagens.com.br/images/001/476/114/full/ceu-maker-echo-2.png?1529594202)

### Céu-Arduino Code
```cpp
#include "wclock.ceu"
#include "usart.ceu"
#include "string.ceu"
#include "gpio.ceu"
```
The code starts including Céu-Arduino libraries. ```usart.ceu``` and ```string.ceu``` wraps, respectively, the functionalities for serial communication and string manipulation. The ```gpio.ceu``` is needed for manipulating Arduino input/output pins.

```cpp
#define IN  2

spawn Usart(9600);

var int i;
loop i do
    var[5] byte str;
    call String_Append_STR(&str, "send");

    var high/low v = await Pin(IN);
    if (v==high) then
        await Usart_TX(&str);
        await Usart_RX(&str,_);
    end
end
```
Firstly, we defined an IN pin that will be used, in line 10, to monitor if the button is clicked or not. When a button is clicked, the code notices two changes: from non-clicked to clicked (firstly) and vice-versa. Since we want to send only ONE string via serial port, we check, on the next line, if the value of pin 2 is ```high```.

In line 3, we start using Usart library, defining the bps to 9600, similarly of what is done using ```Serial.begin(speed)``` — [read more](https://www.arduino.cc/en/serial/begin).

After checking that ```v==high``` the Arduino sends via serial port the string defined in the beginning of the loop. After that, as said in the beginning of this document, the application starts waiting for receiving a string. This is done via ```Usart_RX``` function, that writes the received value on the string passed as parameter.

### pico-Céu Code
```
#include "usart.ceu"
#include "string.ceu"

spawn Usart(3);
```

It starts by including ```usart.ceu``` and ```string.ceu``` that, just like in Arduino code, wraps the functionalities for serial communication and string manipulation. The ```spawn Usart(3)``` set up the serial communication for port 3. To check which port your Arduino is connected, check Windows Device Manager.

```
loop do
    var[5] byte buffer;

    await Usart_RX(&buffer, 5);

    _printf("\n> Received the string: ");
    call String_Print(&buffer);  


    await 1s;


    call String_Append_STR(&buffer, "echo");

    await Usart_TX(&buffer);

    _printf("\n> Sended the string: ");
    call String_Print(&buffer);      
end
```

The loop content can be devided in two groups: one before ```await 1s``` and other after. The first one waits to receive a string from size 5 (including ```\0```) and prints out the received string, while the second writes on serial port the string "echo" and prints, for debug, the sent string.

### Compiling
As said in the beginning of this document, a unique file contains the code for Céu-Arduino and pico-Céu and can be drag and dropped to Céu-Arduino.exe and pico-Céu.exe. But, in this case, the order this programs execute do matter.

When the pico-Céu application set up the serial port (using ```Usart(3)```, for example), the port (COM3 in this case) cannot be used by other app, i.e., the port become busy. Since the Céu-Arduino.exe needs a free port to load the sketch for Arduino board, make sure to not compile the Céu-Arduino application while the pico-Céu one is open. This same behavior can be observed when we try to load a sketch with "Monitor serial" Window opened in Arduino IDE.
