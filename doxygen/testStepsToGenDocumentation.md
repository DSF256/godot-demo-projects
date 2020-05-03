##### Generate the .md files from reference.json(need python installed)
1. Download [gdDocMaker_v1.2.1](https://github.com/DSF256/godot-demo-projects/blob/master/doxygen/gdDocMaker_v1.2.1.zip) and unzip to Desktop
2. Download [reference.json](https://github.com/DSF256/godot-demo-projects/blob/master/doxygen/reference.json) file to desktop
3. In the Command Prompt, navigate to ~\Desktop\gdDocMaker_v1.2.1
4. Execute the command "python -m gdscript_docs_maker ..\reference.json"
5. The md files generated will be saved in gdDocmaker_v1.2.1\dist



##### Generate the reference.json file (Need to have Godot Installed)
1. Download gdDocMaker_v1.2.1 and unzip to Desktop
1. Clone this repo and open in Godot
2. Copy and paste gdDocMaker_v1.2.1\godot-scripts\Collector.gd and gdDocMaker_v1.2.1\godot-scripts\ReferenceCollecter.gd into Godot project workspace, main folder. Ex: res://src/Main/
3. In the Script view open referenceCollector.gd (or double click in the Godot File System view). Select File -> Run
4. This produces a file called reference.json in ~PathToGodotWorkspace\godot-demo-projects\2d\platformer\reference.json
5. To generate the md files, see about and update the path to reference.json in step 4
