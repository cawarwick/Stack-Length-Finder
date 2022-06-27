//Before using make sure to copy the Garbage.ijm macro into the macro folder in order to remove the memory leaks
//Also before using, go to Bio-Foramts Plugin Configuration, go to Formats tab, find TIFF (tagged image file format) and uncheck enable
//save location. Need to change this depending on the computer and intention
input="E:/Itch Project/#469 2-15-22 (Nalf 4880)/Final FOV/Split Files/" //where the files to process are located
saveinsamefolder=0 //set to 1 to save within the same folder, otherwise it'll use the output
output="E:/Itch Project/#469 2-15-22 (Nalf 4880)/Final FOV/" //where you want it to save the CSV
zstacks=5; //user input required 
channels=2; //user input required




list=getFileList(input);
print(list.length);
Y="0"; //initialization variables. Don't change.
Sl=0;
ii=0
PriorFileNameCut=0;

for (i=0; i<list.length; i++) {
	print(list[i]);
	print(i);
	file=list[i];
	check=input+file;
	if (File.isFile(check)) {
		npath=input+file;
		print(npath);
		Vpath="open=["+input+file+"]";
		print(Vpath);
		run("TIFF Virtual Stack...", Vpath);
		if (Y!="0") {
			print("y is not zero, do this");
			PriorFileName=Y;
			lengthofPrior=lengthOf(PriorFileName);
			endofcut=lengthofPrior-12;
			PriorFileNameCut=substring(Y, 0,endofcut);
			print(PriorFileNameCut);
			PriorSl=Sl;
			}
		Y=getInfo("window.title");
		print(Y);
		eos=lengthOf(Y);
		sos=eos-4;
		Z=substring(Y, 0,sos);
		parentcut=eos-12;
		ParentFileName=substring(Y, 0,parentcut);
		print("VarZ/filename",Z);
		print("parent filename:",ParentFileName);
		OG_filename=File.name;
		if (ParentFileName==PriorFileNameCut) {
			//add it to the prior 	
			print("file names are the same, add to the slices");
			Stack.getDimensions(Wd,Ht,Ch,Sl,F);
			print("Sl",Sl);
			print("F",F);
			Sl=Sl*F*Ch;
			print(Sl);
			Sl=Sl/zstacks/channels;
			Sl=Sl+PriorSl;
			print("Sl+PriorSl",Sl);
		} else {
		//overrite the prior varaible
		print("new recording, overrite old variable");
		print("this is a new recording, append Sl to table",Sl);
		if (i!=0) {
			Table.set("ParentFile",ii,PriorFileNameCut);
			Table.set("LengthOfFile", ii,Sl);
			ii++;
		}
		Stack.getDimensions(Wd,Ht,Ch,Sl,F);
		print("Sl",Sl);
		print("F",F);
		Sl=Sl*F*Ch;
		print(Sl);
		Sl=Sl/zstacks/channels;		
		}
		close("*");
		}
}
Table.set("ParentFile",ii,ParentFileName);
Table.set("LengthOfFile", ii,Sl);
if(saveinsamefolder==1) {
saveAs("Results", input+"LengthOfRecordings.csv");
} else {
saveAs("Results", output+"LengthOfRecordings.csv");
}
print("Run Finished");


