#!/bin/bash
set -e

# Clean up extra files left over from running tests
rm -rf /tmp/{*,.*} 2>/dev/null || true

# Remove libtool archive files
find /usr/lib /usr/libexec -name \*.la -delete

# Remove the cross-compiler from Chapter 6 and 7
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf

# Remove the temporary 'tester' user account
userdel -r tester 2>/dev/null || true
