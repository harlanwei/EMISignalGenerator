# ESG: an EMI Signal Generator

## Usage

Make sure you have `bash`, `make` and `gcc` installed on your machine (on a Windows machine, use WSL). To generate all of the EMI signals used by our thesis, simply run

```bash
bash ./gen.sh 1000 1000 1000 1000 1000 # one for each kind of signal, assigns how many data points you want for that kind
```

... or just:

```bash
bash ./gen.sh 1000 # same amount of data for each kind
```

To see what each parameter means, run

```bash
bash ./gen.sh
```

Genetated data are saved in the file `data.txt`.

## Available Configs

You can change the length of the signals by changing the variable `SAMPLE_LENGTH`. By default, a single generated signal sample contains 1000 data points.

## Acknowledgement

This project utilizes code from *Exstrom Laboratories LLC*; see source code for details. Minor changes has been made to the original code to accommodate our study.
