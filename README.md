# An EMI Signal Generator

Make sure you have `cmake`, `make` and `gcc` (or `clang`) installed on your machine. To generate all the of EMI signals used by our thesis, simply run

```bash
bash ./gen.sh
```

Genetated data are saved in the file `data.txt`.

## Available Configs

You can change the length of the signals by changing the variable `SAMPLE_LENGTH`. By default, a single generated signal sample contains 1000 data points.