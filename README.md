# PM3-Dump-Sim
Proxmark3 Easy bash script for dumping and emulating a MIFARE Ultralight NFC tag.

This script automates the process of dumping and emulating a MIFARE Ultralight (MFU) card using a Proxmark3 Easy in an Android Termux environment. It guides the user through scanning the card, automatically loads the latest dump file into the emulator, displays its contents for verification, and starts emulation. This script assumes `proxmark3` will launch the correct client and that you are using a TCP connection as [demonstrated in this section of the Termux Notes MD](https://github.com/RfidResearchGroup/proxmark3/blob/master/doc/termux_notes.md#usb-uart-bridge-application-for-tcp-to-usb-bridging). Temporary dump files are cleaned up after loading.

Proxmark3 and the Iceman Fork: https://github.com/RfidResearchGroup/proxmark3
More info on running Proxmark3 on Android can be found here: https://github.com/RfidResearchGroup/proxmark3/blob/master/doc/termux_notes.md

![Example Images](https://github.com/jwidess/PM3-Dump-Sim/blob/main/example.jpg?raw=true)

## If `eview` is empty:
If you are using a Proxmark3 Easy and attempt to use this script and `hf mfu eview` shows all blank blocks, theres a good chance your flashed firmware does not have the `PLATFORM_EXTRAS=FLASH` parameter set which results in `hf mfu eload` failing silently. To verify this check, the section below. If this is the case, you will need to clone the PM3 repo on a PC (or rooted android phone) and then change the `Makefile.platform` file to include `PLATFORM_EXTRAS=FLASH`. Then you will need to compile and upload this version of the firmware to your Proxmark3 Easy for `hf mfu eload` and thus `eview` to work. 

### Check for external flash:
If your Proxmark3 has external flash enabled, you will see the following line under `[ Model ]`. If you do not see this line, you need to recompile and flash as described above.
```
 [ Model ]
  Firmware.................. PM3 GENERIC
  External flash............ present
```

<details>

<summary>Example Full `hw version` Dump:</summary>

```
 [ Proxmark3 ]

 [ Client ]
  Iceman/master/v4.20469-152-ga1e9b4716-suspect 2025-07-30 20:35:15 ef5b2e843
  Compiler.................. Clang/LLVM Clang 20.1.8
  Platform.................. Android / aarch64
  Readline support.......... present
  QT GUI support............ absent
  Native BT support......... absent
  Python script support..... absent
  Python SWIG support....... absent
  Lua script support........ present ( 5.4.7 )
  Lua SWIG support.......... present

 [ Model ]
  Firmware.................. PM3 GENERIC
  External flash............ present

 [ ARM ]
  Bootrom.... Iceman/master/v4.20469-152-ga1e9b4716-suspect 2025-07-29 22:57:51 ef5b2e843
  OS......... Iceman/master/v4.20469-152-ga1e9b4716-suspect 2025-07-29 22:58:06 ef5b2e843
  Compiler... GCC 13.2.1 20231009

 [ FPGA ]
 fpga_pm3_hf.ncd image 2s30vq100 29-07-2025 22:31:31
 fpga_pm3_lf.ncd image 2s30vq100 29-07-2025 22:31:31
 fpga_pm3_felica.ncd image 2s30vq100 29-07-2025 22:31:31
 fpga_pm3_hf_15.ncd image 2s30vq100 29-07-2025 22:31:31

 [ Hardware ]
  --= uC: AT91SAM7S512 Rev A
  --= Embedded Processor: ARM7TDMI
  --= Internal SRAM size: 64K bytes
  --= Architecture identifier: AT91SAM7Sxx Series
  --= Embedded flash memory 512K bytes ( 74% used )
```

</details>

