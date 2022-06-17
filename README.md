# Stack-Length-Finder
Super simple macro to find the number of frames in a bunch of tiffs.
________________________________________________________________________________________________________________________________
Things to do before using are the same as here:
https://github.com/cawarwick/ThorStackSplitter
________________________________________________________________________________________________________________________________
User provided information for running the macro is located at the top of the macro when opened in FIJI. 
These are the folllowing variables you will need to change to run the macro:

Input=”C:/path/to/where/the tiffs are/” (note the forward slashes, if you copy from Windows Explorer they are back slashes)

Zstacks= number of z-stacks in the source file

Channels= number of channels in the source file

________________________________________________________________________________________________________________________________
All this does is open each file, determine how many frames are in each file, 
i.e. more specifically, in the sense of 3D image data, how many time points there are in each file.

It will save the name and the number of time points in each file to a table which can be copied into Excel.
![image](https://user-images.githubusercontent.com/81972652/174404583-580cdf77-fed4-4f9c-b71b-f53fd0c82710.png)

I do this step because of the occasional blank frames created by ThorImageLS that are removed by the StackSplitter. 
I have stimulus events timed relative to the recording and so I need to know the exact recording length.
