# COLLECTION-Model4916

This repo is intended to be built on Linux (Ubuntu 18 or later). The build script might work with Ubuntu for Windows, but has not been tested.

## To build:

1. Clone this repository:

    ```bash
    git clone --recurse-submodules <ssh-url>
    ```

2. If building with a project secure key, get a copy of that key and put it someplace handy; please make sure it's password protected, at least.

3. Build with the following commands:

    - to build with the test-signing key:

      ```bash
      ./build-with-cli --test --verbose
      ```

    - to build with a project-specific key:

      ```bash
      ./build-with-cli --key={path-to-file}.pem
      ```

    - to build for 16 MHz clock, for Europe, with the test-signing key:

      ```bash
      ./build-with-cli.sh --clock=16 --region=eu868 --test --verbose
      ```

    - to build for multiple regions and multiple networks:

      ```bash
      ./build-with-cli.sh --test --verbose && ./build-with-cli.sh --test --verbose --region=au915 --network=ttn && ./build-with-cli.sh --test --verbose --region=eu868 --network=ttn
      ```

4. The build files shows up in `COLLECTION-Model4916/build/ide`.

NOTE: By default, the application is build for Mobile Mode. To build for Fixed Mode follow the below steps:

1. Open the `build-with-cli.sh` script in text editor.

2. Change the `OPTARDUINO_SOURCE_DEFAULT` field to: `sketch/Fixed-mode/Model4916-MultiGas-Sensor/Model4916-MultiGas-Sensor.ino` and follow the 3rd step from `To build`.
