# PM3-Dump-Sim
Proxmark3 bash script for dumping and emulating a MIFARE Ultralight NFC tag.

This script automates the process of dumping and emulating a MIFARE Ultralight (MFU) card using a Proxmark3 Easy in an Android Termux environment. It guides the user through scanning the card, automatically loads the latest dump file into the emulator, displays its contents for verification, and starts emulation. This script assumes `proxmark3` will launch the correct client and that you are using a TCP connection as [demonstrated in this section of the Termux Notes MD](https://github.com/RfidResearchGroup/proxmark3/blob/master/doc/termux_notes.md#usb-uart-bridge-application-for-tcp-to-usb-bridging). Temporary dump files are cleaned up after loading.

More info on running Proxmark3 on Android can be found here: https://github.com/RfidResearchGroup/proxmark3/blob/master/doc/termux_notes.md

![Example Images](https://github.com/jwidess/PM3-Dump-Sim/blob/main/example.jpg?raw=true)

## If `eview` is empty:
If you are using a Proxmark3 Easy amd attempt to use this script and `hf mfu eview` shows blank blocks, theres a good chance your flashed firmware does not have the `PLATFORM_EXTRAS=FLASH` parameter enabled. If this is the case you will need to clone and compile the firmware on a PC (or rooted android phone) and then change the `Makefile.platform` file to include `PLATFORM_EXTRAS=FLASH`. Then you will need to compile and upload this version of the firmware to your Proxmark3 Easy for `hf mfu eload` and thus `eview` to work. 