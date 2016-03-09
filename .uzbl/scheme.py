#!/usr/bin/env python

import os, subprocess, sys, urllib.parse

def detach_open(cmd):
    # Thanks to the vast knowledge of Laurence Withers (lwithers) and this message:
    # http://mail.python.org/pipermail/python-list/2006-November/587523.html
    if not os.fork():
        null = os.open(os.devnull,os.O_WRONLY)
        for i in range(3): os.dup2(null,i)
        os.close(null)
        subprocess.Popen(cmd)

if __name__ == '__main__':
    uri = sys.argv[1]
    u = urllib.parse.urlparse(uri)
    if u.scheme == 'mailto':
        detach_open(['xterm', '-e', 'mail', u.path])
    elif u.scheme == 'git':
        detach_open(['git', 'clone', '--', uri], cwd=os.path.expanduser('~/Downloads'))
    elif u.scheme == 'magnet':
        detach_open(['transmission-remote', '-a', uri])
