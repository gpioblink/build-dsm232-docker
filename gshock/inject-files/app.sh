#!/bin/sh

env set bootm_image 'nand read ${RAM} 2400000 18e0000; bootm ${RAM}'
env set bootcmd 'dcache on;run ledon; run show_logo; run bootm_image; boots'
# env set bootargs 'console=/dev/fb0,115200'
echo gc_warning "cameohax was successfully launched!\n\nWhen the message \"Firmware Upgrade Success\" appears,\nplease turn off the power and restart." > /cavium/remotectl_pipe