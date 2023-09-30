#cd /home/$USER/meshtastic/firmware/firmware-2.1.23.04bbdc6/firmware-2.1.23.04bbdc6
#check device
#/home/$USER/.local/bin/esptool.py chip_id


#!/bin/bash

# Function to download and extract firmware
download_and_extract() {
    local firmware_URL="$1"
    local firmware_dir="$2"
    
    filename=$(basename "$firmware_URL")
    echo "Downloading $filename to $firmware_dir"
    
    if ! wget -q "$firmware_URL" -P "$firmware_dir"; then
        echo "Error: Failed to download the firmware."
        exit 1
    fi

    if [[ $filename == *.zip ]]; then
        foldername="${filename%.zip}"
        unzip -q "$firmware_dir/$filename" -d "$firmware_dir/$foldername"
    elif [[ $filename == *.tar.gz || $filename == *.tar.bz2 ]]; then
        foldername="${filename%.tar.gz}"
        foldername="${foldername%.tar.bz2}"
        mkdir -p "$firmware_dir/$foldername"
        tar -xzf "$firmware_dir/$filename" -C "$firmware_dir/$foldername"
    fi
}

while true; do
    read -p 'Firmware URL (or press Enter to skip download): ' firmware_URL

    if [ -z "$firmware_URL" ]; then
        echo "No firmware URL provided"
        
        read -p 'Firmware Directory: ' firmware_dir

        if [ ! -d "$firmware_dir" ]; then
            echo "Error: The specified directory does not exist."
            continue
        fi

        echo "Available directories in $firmware_dir:"
        for dir in "$firmware_dir"/*; do
            if [ -d "$dir" ]; then
                echo "$(basename "$dir")"
            fi
        done

        read -p 'Select a firmware version: ' selected_dir
        if [ ! -d "$firmware_dir/$selected_dir" ]; then
            echo "Error: The specified directory does not exist."
            continue
        fi
        foldername="$selected_dir"
        
    else
        read -p 'Firmware Directory:' firmware_dir
        download_and_extract "$firmware_URL" "$firmware_dir"
    fi

    read -p 'Enter the device type:' device_type

    # Search for a file in $foldername that matches $device_type (ignoring ".bin" suffix)
    matched_file=""
    for file in "$firmware_dir/$foldername"/*; do
        if [[ "${file%.bin}" == *"$device_type"* ]]; then
            matched_file="$file"
            break
        fi
    done

    if [ -n "$matched_file" ]; then
        echo "Found a matching file: $matched_file"
        # Add your logic for using the matched file here

        read -p 'Enter the action type (install [i] or update [u]): ' action_type

        case $action_type in
        "i"|"I" )
            echo "Available firmware for your device:"
            for file in "$firmware_dir/$foldername"/*; do
                filename=$(basename "$file")
                if [[ "${filename%.bin}" == *"$device_type"* && "$filename" != *"update"* ]]; then
                    echo "$filename"
                fi
            done
            read -p 'Please select a firmware from the list above: ' firmware
            cd $folder
            echo "Run the following command to flash your device: cd $firmware_dir/$foldername | ./device-install.sh -f \"$firmware\""
            exit
            ;;
        "u"|"U" )
            echo "You chose to update firmware."
            echo "Available firmware updates for your device:"
            for file in "$firmware_dir/$foldername"/*; do
                filename=$(basename "$file")
                if [[ "${filename%.bin}" == *"$device_type"* && "$filename" == *"update"* ]]; then
                    echo "$filename"
                fi
            done
            read -p 'Please select a firmware update from the list above: ' update_firmware
            cd $folder
            echo "Run the following command to update your device: cd $firmware_dir/$foldername | ./device-update.sh -f \"$update_firmware\""
            exit
            ;;
        * )
            echo "Invalid action type. Please choose 'i' for install or 'u' for update."
            continue
            ;;
        esac
    else
        echo "No matching file found for device type: $device_type"
        continue
    fi
    
done
