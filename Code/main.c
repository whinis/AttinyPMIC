#pragma chip attiny10
#pragma lfuse 0x62          // default value
#pragma hfuse 0xDF          // default value
#pragma efuse 0xFF          // default value


#define F_CPU 256000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/sleep.h>
#include <util/delay.h>

void goToSleep ();

uint8_t button = 0;

#define BUTTON PB1			// Pin used as button to trigger LDO_EN
#define INT_OUT PB2			// Pin used as interrupt to inform other things button was pressed
#define LDO_EN PB2			// Pin used to enable LDO
#define HOLD_TIME 300		// counter button is held for before disabling LDO_EN


int main () {
	CCP = 0xD8;			    // Unprotect CLKPSR reg
  	CLKPSR = 5;             // Set clock to 64khz
	OSCCAL=0x59;
	ADCSRA &= ~_BV(ADEN);	// Disable ADC, we never need it
	PCICR = 1;				// Enable Pin Change Interrupt
	PCMSK  |= _BV(PCINT1)   // Enables Pin Change on PCINT1
			| _BV(PCINT0);  // Enables Pin Change on PCINT0

	PUEB |=_BV(BUTTON);		//Set PB2 to have a pullup
	DDRB |=_BV(INT_OUT);		//Set PB1 to be an output
	uint16_t counter = 0;
	char debounce = 0;
  	while (true) {
		if(button == 1){
			if(debounce >0)
				debounce -= 1;		//disable denounce counter
			if(counter > HOLD_TIME){ // shuts off at roughly 6 seconds
				PUEB &= ~_BV(LDO_EN);  //Disable PB0(LDO_EN) pullup to turn off
    			PORTB &= ~_BV(LDO_EN);  //Set PB0(LDO_EN) as Low
    			DDRB |= (1 << LDO_EN);	//set PB0 as output temperorarily to force off
    			debounce = 0;
			}else{
				counter+=1; //prevent counter from overflowing
			}
		}else if(counter > 0){
			debounce +=1;
			if(debounce > 15){
				counter = 0;
				debounce = 0;
			}
		}
		if(counter == 0 && debounce == 0){ //go to sleep if the power switch has not recently been pressed
			DDRB &= ~_BV(PB0);	//set PB0 as input again
			goToSleep();		// we are setup, go to sleep
		}
		_delay_ms(10);
  	}
}

void goToSleep ()
{    
	set_sleep_mode(SLEEP_MODE_PWR_DOWN);
	sleep_enable();
	sei();					// turn on interrupts
	sleep_cpu();
	sleep_disable();
}

ISR(PCINT0_vect)
{
	cli();
	//button is pressed or not pressed.
	if((PINB &_BV(BUTTON))== 0){
		PUEB |=_BV(LDO_EN);	//Set PB0(EN) to have a pullup to fake it being an output
		PORTB |= _BV(INT_OUT);	//set Interrupt to MCU
		button = 1;
	}else{
		PORTB &= ~_BV(INT_OUT); //clear Interrupt to MCU
		button = 0;
	}

	//the MCU forced off the power
	if((PINB &_BV(LDO_EN))== 0){
		PUEB &= ~_BV(LDO_EN);  //Disable PB0(EN) pullup to turn off
	}
}