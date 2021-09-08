# 🔮 Contributing to Beyond Repaired 🔮
The repo only has one branch for development and that is MasterDev.

## Table of Contents

- [Setting Up locally](#setting-up-locally)
- [Editing locally](#editing-the-project)
- [Submitting a Pull Request](#submitting-a-pull-request)


## Setting Up locally

**This project requires world of warcraft 3.3.5A to run properly.**

1.  [Fork](https://help.github.com/articles/fork-a-repo/) the project, clone
    your fork:
    
    ```sh
    # Clone your fork
    git clone https://github.com/nizonrox/Beyond-Repair.git

    # Navigate to the newly cloned directory
    cd Beyond-Repair
    ```
2. Locate your interface folder:
    
    ```sh
    # Retail
    C:\World of Warcraft\_retail_\Interface\AddOns
    # Classic
    C:\World of Warcraft\_classic_\Interface\AddOns
    # Private Servers
    \Interface\AddOns
    ```
    
    Setup a "beyond" folder & copy over the files from the git clone
    
3. Make sure that your folder looks somewhat like this
    
    ```
    # This is inside the addons folder
    └── 📁beyond
        ├── 📁lib
        │   ├── 📄AceConsol.lua
        │   └── 📄AceConfig.lua
        ├── 📄beyond.toc
        ├── 📄beyond_lib.lua
        ├── 📑beyond_lib.xml
        ├── 🎨white16x16.tga
        └── 🎨objectIcons.tga
    ```
4. Run World of Warcraft
    After you have logged in be sure to enable the addon via the menu bottom left.
    
    <img src="https://www.almarsguides.com/Almar's%20Stuff/WoW/Addons/HowTo/Addons%20Button.jpg" alt="Addon button">

## Editing the project

Here are some tools that are recommended for troubleshooting/editing wow addons

Code documentation:
* [Official Lua Documentation](https://www.lua.org/pil/contents.html) // Lua is the base UI/Addon language.
* [WoW Lua API Documentation](https://wowwiki-archive.fandom.com/wiki/World_of_Warcraft_API)
* [WoW FrameXML Townlong](https://www.townlong-yak.com/framexml/builds)
* [WoW API Townlong](https://www.townlong-yak.com/framexml/live/Blizzard_APIDocumentation)

IDE/Editing program:
* [Notepad++](https://notepad-plus-plus.org/downloads/) // Free editor


WoW Addon Liberary/Tools
* [WowAce3 Lib](https://www.wowace.com/projects/ace3) // Addon lib made to make stuff easier.
* [BugGrabber](https://www.wowace.com/projects/bug-grabber)/[BugSack](https://www.curseforge.com/wow/addons/bugsack) // For troubleshooting.
* [WoWUnit](https://www.curseforge.com/wow/addons/wow-unit) // For testing UI based stuff
* [WoWLua](https://www.curseforge.com/wow/addons/wowlua) // In-game editor

```sh
# How to run functions from the chat window:
/run FunctionName()
```

## Submitting a Pull Request
Be sure to use a formatter for what file types you are creating/editing.<br/>
[.Xml](https://www.webtoolkitonline.com/xml-formatter.html)<br/>
[.Lua](https://goonlinetools.com/lua-beautifier/)

