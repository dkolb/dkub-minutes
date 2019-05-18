IF EXIST obj\ RMDIR /S /Q obj
MKDIR obj
SETLOCAL EnableExtensions DisableDelayedExpansion
SET "LOCAL_TEXMF=%UserProfile%\OneDrive\Documents\texmf"

IF NOT EXIST "%LOCAL_TEXMF%\doc\latex\dkub-minutes\" MKDIR "%LOCAL_TEXMF%\doc\latex\dkub-minutes"
IF NOT EXIST "%LOCAL_TEXMF%\source\latex\dkub-minutes\" MKDIR "%LOCAL_TEXMF%\source\latex\dkub-minutes"
IF NOT EXIST "%LOCAL_TEXMF%\tex\latex\dkub-minutes\" MKDIR "%LOCAL_TEXMF%\tex\latex\dkub-minutes"

SET "TEXSTUDIO_ROAMING=%APPDATA%\texstudio\completion\user"

IF NOT EXIST "%TEXSTUDIO_ROAMING%\" MKDIR "%TEXSTUDIO_ROAMING%"



latexmk -pdf dkub-minutes.dtx
latexmk -pdf obj/dkub-minutes-example.tex

COPY obj\dkub-minutes.sty "%LOCAL_TEXMF%\tex\latex\dkub-minutes\"
COPY latexmkrc + install.bat + obj\dkub-minutes.ins + dkub-minutes.dtx + obj/dkub-minutes-example.tex "%LOCAL_TEXMF%\source\latex\dkub-minutes\"
COPY obj\dkub-minutes.pdf + obj\dkub-minutes-example.pdf "%LOCAL_TEXMF%\doc\latex\dkub-minutes\"
COPY dkub-minutes.cwl "%TEXSTUDIO_ROAMING%\"