## renom -- renames files using an array of user supplied perl regexes

#### Install

```bash
  cd /some/path
  git clone https://github.com/joe-opensrc/renom
  export PATH="/some/path/to/renom/bin:${PATH}"
```

#### Usage

tldr; e.g.,

```bash
  cd /to/your/folder
  renom -R /path/to/a/regexfile.rxs *.jpg
```

Regex files contain a list of prelre search-replace regex statements,\
eg., 's///' strings, one per line.\
These are applied sequentially. Comments starting with '#' are also allowed.

Check the included example folder, well, for an example... ;)

```bash
> cd example
> ls -1
IMG_0001.JPG
IMG_0002.JPG
IMG_0003.JPG
mycam.rxs
```

```bash
> cat mycam.rxs
s/^IMG_/photo-/
s/0//
s/\.JPG/-coolpic.jpg/
```

```bash
> renom -R mycam.rxs IMG_000*
renamed 'IMG_0001.JPG' -> 'photo-001-coolpic.jpg'
renamed 'IMG_0002.JPG' -> 'photo-002-coolpic.jpg'
renamed 'IMG_0003.JPG' -> 'photo-003-coolpic.jpg'

> ls -1
mycam.rxs
photo-001-coolpic.jpg
photo-002-coolpic.jpg
photo-003-coolpic.jpg
```

```bash
> renom -n -R mycam.rxs IMG_000*
mv -i -v IMG_0001.JPG photo-001-coolpic.jpg
mv -i -v IMG_0002.JPG photo-002-coolpic.jpg
mv -i -v IMG_0003.JPG photo-003-coolpic.jpg

> renom -n -v -R mycam.rxs IMG_000*
photo-0001.JPG
photo-001.JPG
photo-001-coolpic.jpg
mv -i -v IMG_0001.JPG photo-001-coolpic.jpg
photo-0002.JPG
photo-002.JPG
photo-002-coolpic.jpg
mv -i -v IMG_0002.JPG photo-002-coolpic.jpg
photo-0003.JPG
photo-003.JPG
photo-003-coolpic.jpg
mv -i -v IMG_0003.JPG photo-003-coolpic.jpg
```

#### Limitations
  
  It currently only works on "immediate" files,\
ie., only on the paths within the current directory.

e.g., this /won't/ work: 

```bash
  renom -R /path/to/regexfile /some/full/path/*.jpg
```

this would:

```bash
  cd /some/full/path
  renom -R /path/to/regexfile *.jpg
```
