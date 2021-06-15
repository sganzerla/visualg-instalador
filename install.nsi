Unicode true

!include "MUI2.nsh"

!define PRODUCT_NAME "Visualg"
!define PRODUCT_PUBLISHER "Visualg"
 
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "${NSISDIR}\Contrib\Graphics\Icons\modern-install.ico"
!define MUI_UNICON "${NSISDIR}\Contrib\Graphics\Icons\modern-uninstall.ico"
!define PUBLISHER_WEB_SITE "https://visualg3.com.br"
!define PRODUCT_WEB_SITE "https://visualg3.com.br"

; Installer pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

; Uninstaller pages
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

; Language files
!insertmacro MUI_LANGUAGE "PortugueseBR"

; MUI end ------

Name "${PRODUCT_NAME}"
OutFile "dist\instalador.exe"
ShowInstDetails show
ShowUnInstDetails show
SetCompress auto
InstallDir "$DESKTOP\Visualg\3.0.7"
RequestExecutionLevel user

Function .onInit
FunctionEnd

Section "Principal" SEC01
  SetOutPath "$INSTDIR"
  AllowSkipFiles off
  File /r "files\visualg3.0.7\*"
SectionEnd

Section -Post
  WriteUninstaller "$INSTDIR\uninst.exe"
SectionEnd

Section Uninstall
  # remove todos os arquivos da pasta de instalacao
  RMDir /r "$INSTDIR"

SectionEnd
 
Section "Desktop Shortcut" SectionX

  SetShellVarContext current

  CreateShortCut "$Desktop\visualg.lnk" "$INSTDIR\visualg30.exe"

SectionEnd
