#!/usr/bin/env bash

set -e

hardware_conf_file=$PWD/modules/os/nix/hardware-configuration.nix

# check hardware-configuration.nix exists
if [ ! -f "$hardware_conf_file" ]; then
	echo "hardware-configuration.nix not found"
	echo "It will tried to copy from /etc/nixos/hardware-configuration.nix"

	if [ ! -f "/etc/nixos/hardware-configuration.nix" ]; then
		echo "hardware-configuration.nix not found in /etc/nixos/hardware-configuration.nix"
		exit 1
	else
		cp "/etc/nixos/hardware-configuration.nix" "$hardware_conf_file"
	fi
else
	echo "hardware-configuration.nix found"
fi

# back up the original configuration.
backup_dir="$PWD/backup/etc/"
new_backup_conf_dir="$backup_dir/nixos_$(date +%Y%m%d%H%M%S)"
mkdir -p "$backup_dir"

# check if /etc/nixos is symlink and linked to the nixos configuration
if [ -L "/etc/nixos" ]; then
	echo "/etc/nixos is symlink"
	echo "It will be removed and re-linked to the current configuration"

	rm /etc/nixos
	ln -s "$PWD" /etc/nixos
else
	echo "/etc/nixos is not symlink"
	echo "It will be backed up and re-linked to the current configuration"

	if [ -d "/etc/nixos" ]; then
		mv /etc/nixos "$new_backup_conf_dir"
	else
		echo "/etc/nixos is not found"
	fi

	ln -s "$PWD" /etc/nixos
fi
