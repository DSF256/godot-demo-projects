# Generate the .md files from reference.json(need python installed)
1. Download and unzip to Desktop
2. Download .json file to desktop
3. In the Command Prompt, navigate to ~\Desktop\gdDocMaker_v1.2.1
4. Execute the command "python -m gdscript_docs_maker ..\reference.json"
5. The .md files generated will be saved in gdDocmaker_v1.2.1\dist

1. Generate the reference.json file
  a. Open godot project
  b. Copy Collector.gs and ReferenceCollecter.gd into Godot project workspace, main folder.
  c. In the Script view open referenceCollector.gd. Select File -> Run
  d. This produces a file called reference.json
 
