#!/usr/bin/env python
from __future__ import print_function
import time
import socket
import argparse
import sys

def wait_for_port(port, host='localhost', timeout=5.0, quiet=False):
    """Wait until a port starts accepting TCP connections.
    Args:
        port (int): Port number.
        host (str): Host address on which the port should exist.
        timeout (float): In seconds. How long to wait before raising errors.
    Raises:
        TimeoutError: The port isn't accepting connection after time specified in `timeout`.
    """
    stimeout = timeout
    if stimeout < 0:
        stimeout = 60
    start_time = time.perf_counter()
    while True:
        try:
            with socket.create_connection((host, port), timeout=stimeout):
                break
        except OSError as ex:
            time.sleep(1.0)
            if not quiet:
                print(" .", end='', flush=True)
            if timeout > 0 and time.perf_counter() - start_time >= timeout:
                print("{}".format(time.perf_counter() - start_time))
                raise TimeoutError('Waited too long for the port {} on host {} to start accepting '\
                                   'connections.'.format(port, host))

if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('host', help="dns name or ip adress")
    parser.add_argument('port', type=int, help="Port number")
    parser.add_argument('--timeout','-t', type=int, default="-1", help="Timeout waiting for port [<0 means wait for ever.]")
    parser.add_argument('--quiet', "-q", action="store_true", default=False, help="Be quiet")

    args = parser.parse_args()

    if not args.quiet:
        print("Waiting for {}:{}".format(args.host,args.port), end='', flush=True)
    try:
        wait_for_port(args.port, args.host, args.timeout, args.quiet)
    except TimeoutError as e:
        if not args.quiet:
            print(" failure.", flush=True)
        print("Error: {}".format(e), file=sys.stderr)
        sys.exit(1)
    if not args.quiet:
        print(" done.")
    sys.exit(0)
