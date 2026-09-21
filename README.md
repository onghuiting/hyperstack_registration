# registration_with_same_transformation3
A Fiji/ImageJ macro for hyperstack registration. The transformation matrices are found using a single z-slice time series of channel 1 and the same transformation matrices are applied on other z slices.

If you use the macro, please cite the paper: 

Mendieta-Serrano MA, Dhar S, Ng BH, Narayanan R, Lee JJ, Ong HT, Toh PJ, Röllin A, Roy S, Saunders TE. Slow muscles guide fast myocyte fusion to ensure robust myotome formation despite the high spatiotemporal stochasticity of fusion events. Developmental cell. 2022 Sep 12;57(17):2095-2110.

For enquiries, please contact: mbioht@nus.edu.sg

## Requirements

This macro requires [Fiji](https://fiji.sc/) and the following plugins:

* **MultiStackReg1.45_.jar**
* **TurboReg_.jar**

These plugins are not included in this repository and must be installed separately. Please refer to the official plugin documentation for the current installation instructions and licensing terms.



## To start

1. Open `registration_with_same_transformation3.ijm` in Fiji.
2. Input the z-slice for finding transformation matrices in the script.
3. Open the hyperstack.
4. Run the macro.
5. The results folder can be found inside the folder of input hyperstack.

 
## License

See [LICENSE](LICENSE) for details.










