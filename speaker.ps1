Function Speak-Text($Text) { Add-Type -AssemblyName System.speech; $TTS = New-Object System.Speech.Synthesis.SpeechSynthesizer; $TTS.Speak($Text) }
Speak-Text "WARNING: Your files have been encrypted!
All your important documents, photos, and data are now inaccessible. A ransomware attack has taken place, and your files are locked with strong encryption. To regain access, you must pay a ransom of $500 in cryptocurrency within the next 72 hours. Failure to comply will result in permanent deletion of your files.
Do NOT attempt to recover your files without our assistance. Any attempts to restore or alter the system may result in irreversible loss."
Exit
