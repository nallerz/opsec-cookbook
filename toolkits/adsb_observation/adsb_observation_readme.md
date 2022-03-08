# ADSB Observation Kit
## Summary
This kit is intended to provide users with a full stack solution and instructions for analyzing aircraft ADSB transponders.
## Solution Variants
### level 1a: free online data
**Description:** monitoring free online data
**Capabilities:**
- [x] monitor live global ADSB traffic
- [ ] monitor local ADSB traffic directly
- [ ] canned historical data analysis (most sites)
- [ ] custom historical data analysis
- [ ] unfiltered/military aircraft (most sites)

**Dependencies/Requires Assets:**
- [X] Internet access for operation
- [ ] Third party account creation/use
- [ ] Potentially violating site terms of service
- [ ] Data Storage
- [ ] Rtl-sdr receiver
- [ ] Rtl-sdr antenna
- [ ] Raspberry pi
- [ ] Software installation/configuration

**Instructions:**
1. Access one of the sites in [public_adsb_sites.txt](./public_adsb_sites.txt)
2. How to interpret ADSB data and use adsbexchange.com): https://youtu.be/upS46L09bXM

### level 1b: enhanced/subscription data
**Description:** monitoring enhanced subscription-based data, which usually includes enhanced history, coverage, or details compared to the free data.
**Capabilities:**
- [x] monitor live global ADSB traffic
- [ ] monitor local ADSB traffic directly
- [x] canned historical data analysis (most sites)
- [ ] custom historical data analysis
- [ ] unfiltered/military aircraft (most sites)

**Dependencies/Requires Assets:**
- [X] Internet access for operation
- [X] Third party account creation/use
- [ ] Potentially violating site terms of service
- [ ] Data Storage
- [ ] Rtl-sdr receiver
- [ ] Rtl-sdr antenna
- [ ] Raspberry pi
- [ ] Software installation/configuration

**Instructions:**
1. (See 1a instructions...)
2. Sign up for paid account
3. (Optional) avoid paying by implementing [solution 2a](https://github.com/nallerz/opsec-cookbook/edit/main/toolkits/adsb_observation/adsb_observation_readme.md#level-2a-collectingmonitoring-live-adsb-transmissions) and then feeding data to sites (most will then give you enhanced access for free)

### level 1c: web-data persistence
**Description:** web-scraping/persisting free online data for analysis of comprehensive history
**Capabilities:**
- [x] monitor live global ADSB traffic
- [ ] monitor local ADSB traffic directly
- [ ] canned historical data analysis (most sites)
- [x] custom historical data analysis
- [ ] unfiltered/military aircraft (most sites)

**Dependencies/Requires Assets:**
- [X] Internet access for operation
- [X] Third party account creation/use
- [X] Potentially violating site terms of service
- [X] Data Storage
- [ ] Rtl-sdr receiver
- [ ] Rtl-sdr antenna
- [ ] Raspberry pi
- [ ] Software installation/configuration

**Instructions:**
*Out of scope at the time of writing, but if you know how to do this and would like to contribute, please do or reach out!*

### level 2a: collecting/monitoring live ADSB transmissions
**Description:** using hardware (sdr receiver + raspberry pi) to monitor live radio transmissions from extended line of sight aircraft.
**Capabilities:**
- [ ] monitor live global ADSB traffic
- [x] monitor local ADSB traffic directly
- [ ] canned historical data analysis (most sites)
- [ ] custom historical data analysis
- [x] unfiltered/military aircraft (most sites)

**Dependencies/Requires Assets:**
- [ ] Internet access for operation
- [ ] Third party account creation/use
- [ ] Potentially violating site terms of service
- [ ] Data Storage
- [X] Rtl-sdr receiver
- [X] Rtl-sdr antenna
- [X] Raspberry pi
- [X] Software installation/configuration

**Instructions:**
1. Install rpi operating system (or skip to step 2a)
   - https://www.raspberrypi.com/software/

2. Install ADSB software
   - **Option a:** use pre-baked rpi image (easiest overal)
     1. Pick image from [adsb_rpi_img_list.txt](./adsb_rpi_img_list.txt)
     2. Write image to SD card (https://www.raspberrypi.com/documentation/computers/getting-started.html)
     3. Follow configuration instructions provided by the image provider
        - e.g.adsbexchange.com: https://www.adsbexchange.com/how-to-feed/adsbx-custom-pi-image/
        - e.g.flightradar24.com: https://www.flightradar24.com/build-your-own
   - **Option b:** install readsb using easy script: https://github.com/wiedehopf/adsb-scripts/wiki/Automatic-installation-for-readsb#installation
   - **Option c:** install ADSB monitoring software from alternative project of choice. See [adsb_alternative_software_list.txt](./adsb_alternative_software_list.txt)
   - **Option d:** dockerized install (cleanest if familiar with docker). See [adsb_alternative_software_list.txt](./adsb_alternative_software_list.txt)

### level 2b: collecting & persisting long term ADSB data for analysis
**Description:** using hardware (sdr receiver + raspberry pi) to monitor live radio transmissions from extended line of sight aircraft.
**Capabilities:**
- [ ] monitor live global ADSB traffic
- [x] monitor local ADSB traffic directly
- [ ] canned historical data analysis (most sites)
- [x] custom historical data analysis
- [x] unfiltered/military aircraft (most sites)

**Dependencies/Requires Assets:**
- [ ] Internet access for operation
- [ ] Third party account creation/use
- [ ] Potentially violating site terms of service
- [X] Data storage
- [X] Rtl-sdr receiver
- [X] Rtl-sdr antenna
- [X] Raspberry pi
- [X] Software installation/configuration
** Instructions: **
1. Complete instructions for level 2a (using data persistence option in [adsb_alternative_software_list.txt](./adsb_alternative_software_list.txt)
2. Ensure the influxdb docker container is running
3. Analyze data from influxdb (out of scope at time of this writing)

## Contents
- [adsb_alternative_software_list.txt](./adsb_alternative_software_list.txt) - list of software packages for collecting, storing, and visualizing ADSB data
- [adsb_rpi_img_list.txt](./adsb_rpi_img_list.txt) - list of rpi images with ADSB software pre-installed
- [adsb_recommended_hardware_list.txt](./adsb_recommended_hardware_list.txt) - list of hardware components for this kit

## Library References & Related Contents
- [volume_2_threats_and_countermeasures/chapter_7_aerial_observation](https://github.com/nallerz/opsec-cookbook/blob/main/library/volume_2_threats_and_countermeasures/chapter_7_aerial_observation.md)
- really good diy ADSB wiki: https://github.com/wiedehopf/adsb-wiki/wiki
