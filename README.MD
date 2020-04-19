### Project

I was working on a project where I wanted a soft On/Off button such that whenever you pressed a button the power turned on but whenever you held the button the power turned off, low power as it was a battery powered application, and could work even if the main microprocessor locked up or had another error. I was shocked to learn there was few parts for this application and the ones that did exists were expensive relative to everything else. I started looking into different ways of doing this and they all either involved a ton of board space and drew a fairly significant amount(1ma+) of power or cost upwards more than $1 per IC which in hobby price is outrageous.  So I tried another route.

This implementation takes an Attiny4,5,6 or 10 and implements an interrupt on one pin that should be connected to a standard push button. One pin is used as a general interrupt to inform the button has been pressed. Another pin is used as an output to either a transistor, ideal diode, or regulator, this pin is pulled high as an input once the button is pressed. Once the button is held down for ~ 5 seconds the output pin is pulled low as an output before becoming an input again. The attiny is asleep outside of these events. The reset pin is left unchanged so that you can easily reprogram

### Features
- Low cost ($0.27 per attiny)
- Low Power (<0.1µa)
- Allows Microprocessor to control output as well 
Since the output in is just an input with a pullup its easy to overpower with a true output or in testing. The software will monitor or external force forcing the pin low and disable its output as well.
- Small form factor (Sot23-6 or UDFN-8)
- Configurable
	With this being a micro rather than fixed silicon you can change which pins do which if your designs change without issue

### In this Repository
In the code directory is the main.c that contains the code. It was made in [https://github.com/wholder/ATTiny10IDE](https://github.com/wholder/ATTiny10IDE "https://github.com/wholder/ATTiny10IDE") which is a wonderful simple IDE for Attiny10 family of microprocessors. You can program to the Attiny using a standard arduino.

In the Hardware directory is some breakout board files in Kicad I used on my breadboards and can be used as example circuits. Both boards use a LDO on the board to control the output level of the attiny 10, if you are not using the interrupt you can likely connect directly to your battery. PMIC v2 uses a LDO that makes the entire circuit < 1µa which should be less than most batteries self-discharge rate.

Images contains images of the breakout board.
