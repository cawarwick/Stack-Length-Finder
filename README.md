# Stack-Length-Finder
Super simple macro to find the number of frames in a bunch of tiffs created by the stack splitter I made. i.e. it assumes there are parent files with splits because of the macro, e.g. Recording_000_000, Recording_000_001, Recording_000_003, Recording_001_000, Recording_001_001, etc. This assumes the _000 was added by the ThorLabs macro splitter and adds up the number of frames in the parent file, e.g. Recording_000 or Recording_001.
________________________________________________________________________________________________________________________________
Things to do before using are the same as here:
https://github.com/cawarwick/ThorStackSplitter
________________________________________________________________________________________________________________________________
User provided information for running the macro is located at the top of the macro when opened in FIJI. 
These are the folllowing variables you will need to change to run the macro:

Input=”C:/path/to/where/the tiffs are/” (note the forward slashes, if you copy from Windows Explorer they are back slashes)

saveinsamefolder=0 //set to 1 to save within the same folder, otherwise it'll use the output folder

output="E:/Itch Project/#469 2-15-22 (Nalf 4880)/Final FOV/" //where you want it to save the CSV

Zstacks= number of z-stacks in the source file

Channels= number of channels in the source file

________________________________________________________________________________________________________________________________
All this does is open each file, determine how many frames are in each file, 
i.e. more specifically, in the sense of 3D image data, how many time points there are in each file.

![image](https://user-images.githubusercontent.com/81972652/176014882-965b56ae-ee4f-4f8a-ac3d-c5472d7e394e.png)

It will save the name and the number of time points in each file to a table which is then saved into a csv.

I do this step because of the occasional blank frames created by ThorImageLS that are removed by the StackSplitter. 
I have stimulus events timed relative to the recording and so I need to know the exact recording length.
