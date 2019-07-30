## Echo app example

[Video](https://youtu.be/u72g1txgyMo)

A simple echo application to exemplify the communication using serial port between Céu-Arduino and pico-Céu. Its operation is as follows:
- An Arduino running the application is connected to a computer running its pico-Céu version. At that moment, Arduino is waiting for a button click and pico-Céu, for receiving a string via serial port;
- The user clicks on the Arduino button, and the Arduino sends the "send" string via serial. After that, Arduino starts waiting for a string;
- The pico-Céu application receives the string and sends back a string "echo". After, it starts waiting for a string again;
- The Arduino receives the string "echo" and starts waiting for a button click again.

It's composed by only one file, the ```main.ceu```, that can be compiled by [Céu-Arduino.exe](https://github.com/ceu-lang/ceu-maker/tree/develop/ceu-maker/bin) and [pico-Céu.exe](https://github.com/ceu-lang/ceu-maker/tree/develop/ceu-maker/bin) to create, respectively, the arduino and the pico-céu versions.

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
#include "int0.ceu"
```
The code starts including Céu-Arduino libraries. ```usart.ceu``` and ```string.ceu``` wraps, respectively, the functionalities for serial communication and string manipulation.

```cpp

spawn USART_Init(9600);

loop do
    var[5] byte str;
    call String_Append_STR(&str, "send");

    await INT0;
    var high/low v = call INT0_Get();
    if (v==high) then
        await USART_Tx(&str);
        
        var[5] byte strRx;
        await USART_Rx(&strRx,_);
    end
end
```
We start using Usart library, defining the bps to 9600, similarly of what is done using ```Serial.begin(speed)``` — [read more](https://www.arduino.cc/en/serial/begin).

Then, we create a loop that:
- **creates a string to send:** for this, we used String_Append_STR, from ```string.ceu```
- **waits for a button click in int0 pin:** We await when interruption 0 acurrs. In Arduino UNO, INT0 is associated with pin 2. When a button is clicked, the code notices two changes: from non-clicked to clicked (firstly) and vice-versa. Since we want to send only ONE string via serial port, we check, on the next two lines, if the value carried by INT0 is ```high```.
- **transmit a string:** if the button was clicked, we use ```USART_Tx``` to transmit the string ```str```
- **waits for a 'echo' string:** after transmit, the Arduino code waits for a echo string. The second parameter informs the minimum number of bytes to receive. If no number is provided, the USART_Rx uses the dafault behavior (default: as soon as something is received).

### pico-Céu Code
```
#include "usart.ceu"
#include "string.ceu"

spawn USART_Init("/dev/ttyACM0", 9600);
```

It starts by including ```usart.ceu``` and ```string.ceu``` that, just like in Arduino code, wraps the functionalities for serial communication and string manipulation. The ```spawn USART_Init("/dev/ttyACM0", 9600);``` set up the serial communication for port "/dev/ttyACM0" with 9600 bps. To check which port your Arduino is connected, check Windows Device Manager or Arduino IDE.

```
loop do
    var[5] byte buffer;

    await USART_Rx(&buffer, 5);

    _printf("\n> Received the string: ");
    call String_Print(&buffer);

    await 1s;

    var[5] byte strRx;
    call String_Append_STR(&strRx, "echo");

    await Usart_TX(&strRx);

    _printf("\n> Sended the string: ");
    call String_Print(&strRx);      
end
```

The loop content can be devided in two groups: one before ```await 1s``` and other after. The first one waits to receive a string from size 5 (including ```\0```) and prints out the received string, while the second writes on serial port the string "echo" and prints, for debug, the string sent.

### Compiling
As said in the beginning of this document, a unique file contains the code for Céu-Arduino and pico-Céu and can be drag and dropped to Céu-Arduino.exe and pico-Céu.exe. But, in this case, the order this programs execute do matter.

When the pico-Céu application set up the serial port (using ```Usart```, for example), the port cannot be used by other app, i.e., the port become busy. Since the Céu-Arduino.exe needs a free port to load the sketch for Arduino board, make sure to not compile the Céu-Arduino application while the pico-Céu one is open. This same behavior can be observed when we try to load a Céu-Arduino application with "Monitor serial" Window opened in Arduino IDE.
