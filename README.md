# System Resource Monitor

This is a Bash script that monitors various system resources, including CPU usage, disk I/O, network bandwidth, and memory usage.

## Usage

Run the script with one of the following options:

```bash
./script.sh [option]
```

### Options:
- `1` - Monitor CPU usage
- `2` - Monitor Disk I/O statistics
- `3` - Monitor Network Bandwidth
- `4` - Monitor Memory usage

## Features
- **CPU Usage Monitoring**: Displays the top 10 processes consuming the most CPU.
- **Disk I/O Statistics**: Shows disk read/write statistics similar to `iostat`.
- **Network Bandwidth Monitoring**: Reports received and transmitted bytes per network interface.
- **Memory Usage Monitoring**: Displays the top 10 processes consuming the most memory.

## Prerequisites
Ensure that the following commands are available on your system:
- `ps`
- `awk`
- `lsblk`
- `cat`
- `grep`
- `ip`

## Example Usage
```bash
./script.sh 1  # Monitor CPU Usage
./script.sh 2  # Monitor Disk I/O
./script.sh 3  # Monitor Network Bandwidth
./script.sh 4  # Monitor Memory Usage
```
