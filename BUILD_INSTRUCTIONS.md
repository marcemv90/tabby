# Building Tabby with Windows Terminal Conhost Support

This Dockerfile and instructions allow you to build Tabby with support for Windows Terminal's conhost.exe.

## Changes Made

1. Modified `app/lib/pty.ts` to detect Windows Terminal installation and use its conhost.exe for local sessions.
2. The node-pty library needs to be patched to support `conhostPath` option in spawn options. The patch should modify `src/index.ts` to accept `conhostPath` in options, and `src/win/conpty.cc` to use the provided path if available.

## Building

1. Ensure you have Docker installed.
2. Run `docker build -t tabby-build .`
3. Run `docker run -v $(pwd)/dist:/app/dist tabby-build yarn run build:windows`

## Notes

- On Windows builds, if Windows Terminal is installed, Tabby will use its conhost.exe for better compatibility.
- The node-pty patch is required for this to work.