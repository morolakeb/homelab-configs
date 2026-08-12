#!/bin/bash

# Ensure the script is run with administrative privileges
if [[ "${EUID}" -ne 0 ]]; then
  echo "Error: This script must be run as root or with sudo."
  exit 1
fi

# Ensure a CSV file was actually provided as an argument
if [[ -z "$1" ]]; then
  echo "Usage: $0 <path_to_csv_file>"
  exit 1
fi

INPUT_FILE=$1

echo "Starting bulk IAM provisioning process..."
echo "========================================="

# Loop through the CSV file line by line
while IFS=',' read -r username user_group temp_password; do
  
  # Clean up hidden carriage returns (useful if the CSV was made in Windows)
  username=$(echo "$username" | tr -d '\r')
  user_group=$(echo "$user_group" | tr -d '\r')
  temp_password=$(echo "$temp_password" | tr -d '\r')

  # Skip the header row
  if [[ "$username" == "username" ]]; then
    continue
  fi

  # 1. Validation: Check if the user already exists
  if id "$username" &>/dev/null; then
    echo "[-] User '$username' already exists. Skipping..."
    continue
  fi

  # 2. Group Assignment: Ensure the group exists; if not, create it
  if ! getent group "$user_group" &>/dev/null; then
    echo "[*] Group '$user_group' does not exist. Creating it..."
    groupadd "$user_group"
  fi

  # 3. Creation: Create the user, their home directory (-m), assign the group (-g), and set the default shell (-s)
  echo "[+] Creating user: $username..."
  useradd -m -g "$user_group" -s /bin/bash "$username"

  # 4. Credential Management: Securely set the temporary password
  echo "$username:$temp_password" | chpasswd

  # 5. Security Baseline: Expire the password instantly so they must change it on first login
  chage -d 0 "$username"
  
  echo "[+] Successfully provisioned '$username' and enforced password reset."
  echo "-----------------------------------------"

done < "$INPUT_FILE"

echo "Provisioning complete!"
