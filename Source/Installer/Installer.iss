 #define BaseDir ExtractFilePath(ExtractFilePath(ExtractFilePath(SourcePath)))
#define AppVersion GetFileVersion(BaseDir + "\Bin\" + Platform + "\" + Configuration + "\Project64.exe")

[Setup]
AppId={{7029AE65-B63A-4B8D-B80A-1573572B7C7A}
AppName=Project64 Custom
AppVersion={#AppVersion}
DefaultDirName={pf32}\Project64 Custom
VersionInfoVersion={#AppVersion}
OutputDir={#BaseDir}\Bin\{#Platform}\{#Configuration}
OutputBaseFilename=Setup Project64 Custom
VersionInfoDescription=Installation Setup of Project64 Custom
Compression=lzma2/ultra64
WizardImageFile=Installer-Sidebar.bmp
WizardSmallImageFile=Pj64LogoSmallImage.bmp
DisableProgramGroupPage=yes
DisableReadyPage=yes
Uninstallable=not IsTaskSelected('portablemode')
UninstallDisplayIcon={uninstallexe}
SetupIconFile={#BaseDir}\Source\Project64\UserInterface\Icons\pj64.ico

[Run]
Filename: "{app}\Project64.exe"; Description: "{cm:LaunchProgram,{#StringChange('Project64', '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[Files]
Source: "{#BaseDir}\Bin\{#Platform}\{#Configuration}\Project64.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "{#BaseDir}\Config\Video.rdb"; DestDir: "{app}\Config"
Source: "{#BaseDir}\Config\Audio.rdb"; DestDir: "{app}\Config"
Source: "{#BaseDir}\Config\Cheats\*.cht"; DestDir: "{app}\Config\Cheats"
Source: "{#BaseDir}\Config\Enhancements\*.enh"; DestDir: "{app}\Config\Enhancements"
Source: "{#BaseDir}\Config\Project64.rdb"; DestDir: "{app}\Config"
Source: "{#BaseDir}\Config\Project64.rdx"; DestDir: "{app}\Config"
Source: "{#BaseDir}\Lang\*.pj.Lang"; DestDir: "{app}\Lang"
Source: "{#BaseDir}\Plugin\{#Platform}\Audio\Jabo_Dsound.dll"; DestDir: "{app}\Plugin\Audio"
Source: "{#BaseDir}\Plugin\{#Platform}\Audio\Project64-Audio.dll"; DestDir: "{app}\Plugin\Audio"
Source: "{#BaseDir}\Plugin\{#Platform}\GFX\Jabo_Direct3D8.dll"; DestDir: "{app}\Plugin\GFX"
Source: "{#BaseDir}\Plugin\{#Platform}\GFX\Project64-Video.dll"; DestDir: "{app}\Plugin\GFX"
Source: "{#BaseDir}\Plugin\{#Platform}\GFX\GLideN64\*"; DestDir: "{app}\Plugin\GFX\GLideN64"; Flags: recursesubdirs
Source: "{#BaseDir}\Plugin\{#Platform}\Input\PJ64_NRage.dll"; DestDir: "{app}\Plugin\Input"
Source: "{#BaseDir}\Plugin\{#Platform}\Input\Project64-Input.dll"; DestDir: "{app}\Plugin\Input"
Source: "{#BaseDir}\Plugin\{#Platform}\RSP\Project64-RSP.dll"; DestDir: "{app}\Plugin\RSP"
Source: "{#BaseDir}\Scripts\example.js"; DestDir: "{app}\Scripts"
Source: "{#BaseDir}\Scripts\api_documentation.js"; DestDir: "{app}\Scripts"
Source: "{#BaseDir}\JS-API-Documentation.html"; DestDir: "{app}"
Source: "{#BaseDir}\Profiles\*.cfg"; DestDir: "{app}\Profiles"
Source: "{#BaseDir}\Profiles\ThinkPad-T14-Gen2-AMD.cfg"; DestDir: "{app}\Config"; DestName: "Project64.cfg"; Tasks: laptopprofile; Flags: onlyifdoesntexist

[Dirs]
Name: "{app}\Config"; Permissions: everyone-full
Name: "{app}\Config\Cheats-User"; Permissions: everyone-full
Name: "{app}\Logs"; Permissions: everyone-full
Name: "{app}\Save"; Permissions: everyone-full
Name: "{app}\Screenshots"; Permissions: everyone-full
Name: "{app}\Textures"; Permissions: everyone-full
Name: "{app}\Plugin\GFX\GLideN64"; Permissions: everyone-full

[Icons]
Name: "{commondesktop}\Project64"; Filename: "{app}\Project64.exe"; Tasks: desktopicon
Name: "{commonprograms}\Project64"; Filename: "{app}\Project64.exe"

[Tasks]
Name: desktopicon; Description: "Create a &desktop icon"
Name: portablemode; Description: "&Portable Mode"; Flags: unchecked
Name: laptopprofile; Description: "Apply the &ThinkPad T14 Gen 2 AMD settings profile (only if no settings exist yet)"
