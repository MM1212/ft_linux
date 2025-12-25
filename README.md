# Custom LINUX Distribution

Based on https://www.linuxfromscratch.org/ and Debian 13.

## Prerequisites

- A working Linux system (Debian-based recommended)
- Sufficient disk space (at least 20GB free)
- Basic knowledge of Linux command line and system administration

### Before You Start

Run the version check script to ensure your system meets the requirements:

```bash
bash scripts/check_version.sh
```

This script will verify that you have the necessary tools and versions installed to proceed with building the custom Linux distribution.

## Setup Instructions

### Pre-setup

Run the pre-setup script to prepare your environment:

```bash
source scripts/pre-setup.sh
```

### File System, Partitions, Mounting, Packages & User Setup

```bash
bash scripts/run-root.sh
```

### User Environment Setup

You have to run the user environment setup script as the newly created user:

```bash
su <your-username>
# now inside the user shell
source scripts/pre-setup.sh
bash scripts/run-user.sh
```