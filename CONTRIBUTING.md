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
    
    # From here just copy the "beyond" folder from the newly cloned directory
    ```
    
3. Make sure you got something that looks like the tree structure below:
    
    ```
    📁AddOns
    └── 📁Beyond
        ├── 📁lib
        │   ├── 📁AceAddon-3.0
        │   ├── 📁AceConsole-3.0
        │   ├── 📁CallbackHandler-1.0
        │   ├── 📁LibStub
        │   └── 📄LibDataBroker-1.1.lua
        ├── 📄Beyond.toc
        ├── 📄beyond_frame.lua
        ├── 📄beyond_frame.xml
        ├── 📑embeds.xml
        ├── 🎨objectIcons.tga
        └── 🎨white16x16.tga
    ```
4. Run World of Warcraft
    After you have logged in be sure to enable the addon via the menu bottom left.
    
    <img src="https://www.almarsguides.com/Almar's%20Stuff/WoW/Addons/HowTo/Addons%20Button.jpg" alt="Addon button">

## Editing the project

Here are some tools that are recommended for troubleshooting/editing wow addons

Code documentation:
* [Official Lua Documentation](https://www.lua.org/pil/contents.html) // Lua is a common user interface language.
* [WoW Lua API Documentation](https://wowwiki-archive.fandom.com/wiki/World_of_Warcraft_API)  // Wowwiki API documentation
* [WoW API Townlong](https://www.townlong-yak.com/framexml/live/Blizzard_APIDocumentation) // 3rd party API documentation
* [WoW FrameXML Townlong](https://www.townlong-yak.com/framexml/builds) // 3rd party FrameXML documentation

IDE/Editing program:
* [Visual Studio](https://code.visualstudio.com/)+[Lua extention](https://marketplace.visualstudio.com/items?itemName=trixnz.vscode-lua) // Commonly used IDE; Lua extention
* [Notepad++](https://notepad-plus-plus.org/downloads/) // Free editor
* [Lua Demo](https://www.lua.org/cgi-bin/demo) // Lua demo environment for testing

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
[.Xml](https://goonlinetools.com/xml-formatter/)<br/>
[.Lua](https://goonlinetools.com/lua-beautifier/)

