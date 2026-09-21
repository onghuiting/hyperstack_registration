


// This macro registers hyperstack with same transformation.
// The transformation matrices is found using a single z-slice time series of channel 1.
// This macro uses the plugins, MultiStackReg1.45_.jar and TurboReg_.jar.
//
// To start,
// (1) Input the z-slice for finding transformation matrices in section below.
// (2) Open the hyperstack in Fiji.
// (3) Run this macro.
// (4) The results folder can be found inside the folder of input hyperstack.
//
// Written by hui ting, 26 July 2019.


//////////////   User input : z-slice for finding transformation matrices //////////////////////////

mdd_slc = 27; 

////////////////////////////////////////////////////////////////////////////////////////////////////


run("Options...", "iterations=1 count=1 black pad");

name = getTitle;
Stack.getDimensions(width, height, channels, slices, frames);

mdd_fr = round(frames/2);

dir_img = getDirectory("image"); 
dir_out1 = dir_img+"Registered_images";
File.makeDirectory(dir_out1);

selectWindow(name);
run("Duplicate...", "title=c1_mdd_slc duplicate channels=1 slices="+mdd_slc);
run("Z Project...", "projection=[Min Intensity]");

// user select ROI
waitForUser("Select a ROI");

selectWindow("c1_mdd_slc");
run("Restore Selection");
run("Duplicate...", "title=c1_mdd_slc_crop duplicate");
Stack.setFrame(mdd_fr);

run("MultiStackReg", "stack_1=c1_mdd_slc_crop action_1=Align file_1=["+dir_out1+name+"_transform_matrix.txt] stack_2=None action_2=Ignore file_2=[] transformation=[Rigid Body] save");

selectWindow("c1_mdd_slc_crop");
close();
selectWindow("MIN_c1_mdd_slc");
close();
selectWindow("c1_mdd_slc");
close();

setBatchMode(true);
for (ch=1;ch<=2;ch++){
	for (z=1;z<=slices;z++){

		selectWindow(name);
		run("Duplicate...", "title=temp duplicate channels="+ch+" slices="+z);
		Stack.setFrame(mdd_fr);
		run("MultiStackReg", "stack_1=temp action_1=[Load Transformation File] file_1=["+dir_out1+name+"_transform_matrix.txt] stack_2=None action_2=Ignore file_2=[] transformation=[Rigid Body]");

saveAs("Tiff", dir_out1+File.separator+name+"_c"+ch+"_z"+z+".tif");
close();

	}
}


run("Close All");






