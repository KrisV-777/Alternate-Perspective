import shutil
import sys
from os import listdir
from os.path import isfile, join

path = "Interface/Translations"
f_english = [f for f in listdir(path) if isfile(join(path, f)) and f.endswith("ENGLISH.txt")]

if len(f_english) < 1:
  print("Missing Translation_ENGLISH.txt in directory")
  sys.exit(1)

f_raw = f_english[0].replace("ENGLISH.txt", "")

languages = [
  "CHINESE",
  "CZECH",
  "DANISH",
  # "ENGLISH",
  "FINNISH",
  "FRENCH",
  "GERMAN",
  "GREEK",
  "ITALIAN",
  "JAPANESE",
  "NORWEGIAN",
  "POLISH",
  "RUSSIAN",
  "SPANISH",
  "SWEDISH",
  "TURKISH"
]

en_path = join(path, f_english[0])
en_contents = open(en_path, "rb").read()

for l in languages:
  new_path = join(path, f_raw + l + ".txt")
  if isfile(new_path) and open(new_path, "rb").read() == en_contents:
    print(f"{new_path} is already up to date")
    continue
  shutil.copyfile(en_path, new_path)

print("Done")

