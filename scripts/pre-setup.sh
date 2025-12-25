source scripts/vars/host-environment.sh

#  Set strict permissions on scripts and resources
if [ "$(id -u)" -eq 0 ]; then
  echo "Setting strict permissions on scripts and resources ..."
  chmod 777 -R .
else
  echo "Warning: Not running as root. Skipping permission adjustments."
fi