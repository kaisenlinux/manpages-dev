IMG2PDF(1)                                                                             User Commands                                                                            IMG2PDF(1)

NAME
       img2pdf - lossless conversion of raster images to pdf

DESCRIPTION
       usage: img2pdf [-h] [-v] [-V] [--gui] [-o out] [-C colorspace] [-D]

              [--engine  engine]  [--first-frame-only]  [--pillow-limit-break]  [--pdfa  [PDFA]]  [-S  LxL] [-s LxL] [-b L[:L]] [-f FIT] [-a] [--crop-border L[:L]] [--bleed-border L[:L]]
              [--trim-border L[:L]] [--art-border L[:L]] [--title title] [--author author] [--creator creator] [--producer producer]  [--creationdate  creationdate]  [--moddate  moddate]
              [--subject   subject]   [--keywords   kw   [kw  ...]]   [--viewer-panes  PANES]  [--viewer-initial-page  NUM]  [--viewer-magnification  MAG]  [--viewer-page-layout  LAYOUT]
              [--viewer-fit-window] [--viewer-center-window] [--viewer-fullscreen] [infile [infile ...]]

       Losslessly convert raster images to PDF without re-encoding PNG, JPEG, and JPEG2000 images. This leads to a lossless conversion of PNG, JPEG and  JPEG2000  images  with  the  only
       added file size coming from the PDF container itself.  Other raster graphics formats are losslessly stored using the same encoding that PNG uses. Since PDF does not support images
       with transparency and since img2pdf aims to never be lossy, input images with an alpha channel are not supported.

       The output is sent to standard output so that it can be redirected into a file or to another program as part of a shell pipe. To directly write the output into a file, use the  -o
       or --output option.

OPTIONS
   positional arguments:
       infile Specifies  the input file(s) in any format that can be read by the Python Imaging Library (PIL). If no input images are given, then a single image is read from standard in‐
              put. The special filename "-" can be used once to read an image from standard input. To read a file in the current directory with the filename "-", pass it  to  img2pdf  by
              explicitly stating its relative path like "./-".

   optional arguments:
       -h, --help
              show this help message and exit

       -v, --verbose
              Makes the program operate in verbose mode, printing messages on standard error.

       -V, --version
              Prints version information and exits.

       --gui  run experimental tkinter gui

   General output arguments:
              Arguments controlling the output format.

       -o out, --output out
              Makes the program output to a file instead of standard output.

       -C colorspace, --colorspace colorspace
              Forces the PIL colorspace. See the epilogue for a list of possible values. Usually the PDF colorspace would be derived from the color space of the input image.  This option
              overwrites the automatically detected colorspace from the input image and thus forces a certain colorspace in the output PDF /ColorSpace property. This is useful  for  JPEG
              2000 images with a different colorspace than RGB.

       -D, --nodate
              Suppresses timestamps in the output and thus makes the output deterministic between individual runs. You can also manually set a date using the --moddate and --creationdate
              options.

       --engine engine
              Choose PDF engine. Can be either internal, pikepdf or pdfrw. The internal engine does not have additional requirements and writes out a human readable PDF. The pikepdf  en‐
              gine  requires  the  pikepdf Python module and qpdf library, is most featureful, can linearize PDFs ("fast web view") and can compress more parts of it.The pdfrw engine re‐
              quires   the   pdfrw   Python   module   but   does   not   support   unicode   metadata   (See   https://github.com/pmaupin/pdfrw/issues/39)   or   palette    data    (See
              https://github.com/pmaupin/pdfrw/issues/128).

       --first-frame-only
              By  default,  img2pdf  will convert multi-frame images like multi-page TIFF or animated GIF images to one page per frame. This option will only let the first frame of every
              multi-frame input image be converted into a page in the resulting PDF.

       --pillow-limit-break
              img2pdf uses the Python Imaging Library Pillow to read input images. Pillow limits the maximum input image size to 89478485 pixels to prevent decompression bomb  denial  of
              service attacks. If your input image contains more pixels than that, use this option to disable this safety measure during this run of img2pdf

       --pdfa [PDFA]
              Output a PDF/A-1b complient document. By default, this will embed /usr/share/color/icc/sRGB.icc as the color profile.

   Image and page size and layout arguments:
              Every input image will be placed on its own page. The image size is controlled by the dpi value of the input image or, if unset or missing, the default dpi of 96.00. By de‐
              fault, each page will have the same size as the image it shows.  Thus, there will be no visible border between the image and the page border by default. If image  size  and
              page size are made different from each other by the options in this section, the image will always be centered in both dimensions.

              The  image  size  and  page size can be explicitly set using the --imgsize and --pagesize options, respectively.  If either dimension of the image size is specified but the
              same dimension of the page size is not, then the latter will be derived from the former using an optional minimal distance between the image and the page border  (given  by
              the  --border  option)  and/or a certain fitting strategy (given by the --fit option). The converse happens if a dimension of the page size is set but the same dimension of
              the image size is not.

              Any length value in below options is represented by the meta variable L which is a floating point value with an optional unit appended (without a space between  them).  The
              default unit is pt (1/72 inch, the PDF unit) and other allowed units are cm (centimeter), mm (millimeter), and in (inch).

              Any  size  argument  of the format LxL in the options below specifies the width and height of a rectangle where the first L represents the width and the second L represents
              the height with an optional unit following each value as described above.  Either width or height may be omitted. If the height is omitted, the separating x can be  omitted
              as  well.  Omitting  the width requires to prefix the height with the separating x. The missing dimension will be chosen so to not change the image aspect ratio. Instead of
              giving the width and height explicitly, you may also specify some (case-insensitive) common page sizes such as letter and A4.  See the epilogue at the bottom for a complete
              list of the valid sizes.

              The  --fit option scales to fit the image into a rectangle that is either derived from the --imgsize option or otherwise from the --pagesize option.  If the --border option
              is given in addition to the --imgsize option while the --pagesize option is not given, then the page size will be calculated from the image size, respecting the border set‐
              ting.  If  the  --border  option is given in addition to the --pagesize option while the --imgsize option is not given, then the image size will be calculated from the page
              size, respecting the border setting. If the --border option is given while both the --pagesize and --imgsize options are passed, then the --border option will be ignored.

              The --pagesize option or the --imgsize option with the --border option will determine the MediaBox size of the resulting PDF document.

       -S LxL, --pagesize LxL
              Sets the size of the PDF pages. The short-option is the upper case S because it is an mnemonic for being bigger than the image size.

       -s LxL, --imgsize LxL
              Sets the size of the images on the PDF pages. In addition, the unit dpi is allowed which will set the image size as a value of dots per inch. Instead of a unit,  width  and
              height  values may also have a percentage sign appended, indicating a resize of the image by that percentage. The short-option is the lower case s because it is an mnemonic
              for being smaller than the page size.

       -b L[:L], --border L[:L]
              Specifies the minimal distance between the image border and the PDF page border. This value Is overwritten by explicit values set by --pagesize or --imgsize. The value will
              be  used when calculating page dimensions from the image dimensions or the other way round. One, or two length values can be given as an argument, separated by a colon. One
              value specifies the minimal border on all four sides. Two values specify the minimal border on the top/bottom and left/right, respectively. It is not  possible  to  specify
              asymmetric borders because images will always be centered on the page.

       -f FIT, --fit FIT
              If  --imgsize is given, fits the image using these dimensions. Otherwise, fit the image into the dimensions given by --pagesize. FIT is one of into, fill, exact, shrink and
              enlarge. The default value is "into". See the epilogue at the bottom for a description of the FIT options.

       -a, --auto-orient
              If both dimensions of the page are given via --pagesize, conditionally swaps these dimensions such that the page orientation is the same as the orientation of the input im‐
              age. If the orientation of a page gets flipped, then so do the values set via the --border option.

       --crop-border L[:L]
              Specifies  the  border  between the CropBox and the MediaBox. One, or two length values can be given as an argument, separated by a colon. One value specifies the border on
              all four sides. Two values specify the border on the top/bottom and left/right, respectively.  It is not possible to specify asymmetric borders.

       --bleed-border L[:L]
              Specifies the border between the BleedBox and the MediaBox. One, or two length values can be given as an argument, separated by a colon. One value specifies the  border  on
              all four sides. Two values specify the border on the top/bottom and left/right, respectively.  It is not possible to specify asymmetric borders.

       --trim-border L[:L]
              Specifies  the  border  between the TrimBox and the MediaBox. One, or two length values can be given as an argument, separated by a colon. One value specifies the border on
              all four sides. Two values specify the border on the top/bottom and left/right, respectively.  It is not possible to specify asymmetric borders.

       --art-border L[:L]
              Specifies the border between the ArtBox and the MediaBox. One, or two length values can be given as an argument, separated by a colon. One value specifies the border on all
              four sides. Two values specify the border on the top/bottom and left/right, respectively.  It is not possible to specify asymmetric borders.

   Arguments setting metadata:
              Options handling embedded timestamps, title and author information.

       --title title
              Sets the title metadata value

       --author author
              Sets the author metadata value

       --creator creator
              Sets the creator metadata value

       --producer producer
              Sets the producer metadata value (default is: img2pdf 0.4.0)

       --creationdate creationdate
              Sets  the  UTC  creation date metadata value in YYYY-MMDD or YYYY-MM-DDTHH:MM or YYYY-MM-DDTHH:MM:SS format or any format understood by python dateutil module or any format
              understood by `date --date`

       --moddate moddate
              Sets the UTC modification date metadata value in YYYYMM-DD or YYYY-MM-DDTHH:MM or YYYY-MM-DDTHH:MM:SS format or any format understood by python dateutil module or any  for‐
              mat understood by `date --date`

       --subject subject
              Sets the subject metadata value

       --keywords kw [kw ...]
              Sets the keywords metadata value (can be given multiple times)

   PDF viewer arguments:
              PDF files can specify how they are meant to be presented to the user by a PDF viewer

       --viewer-panes PANES
              Instruct the PDF viewer which side panes to show.  Valid values are "outlines" and "thumbs". It is not possible to specify both at the same time.

       --viewer-initial-page NUM
              Instead of showing the first page, instruct the PDF viewer to show the given page instead. Page numbers start with 1.

       --viewer-magnification MAG
              Instruct  the  PDF  viewer  to open the PDF with a certain zoom level. Valid values are either a floating point number giving the exact zoom level, "fit" (zoom to fit whole
              page), "fith" (zoom to fit page width) and "fitbh" (zoom to fit visible page width).

       --viewer-page-layout LAYOUT
              Instruct the PDF viewer how to arrange the pages on the screen. Valid values are "single" (display single pages), "onecolumn" (one continuous column), "twocolumnright" (two
              continuous columns with odd number pages on the right) and "twocolumnleft" (two continuous columns with odd numbered pages on the left)

       --viewer-fit-window
              Instruct the PDF viewer to resize the window to fit the page size

       --viewer-center-window
              Instruct the PDF viewer to center the PDF viewer window

       --viewer-fullscreen
              Instruct the PDF viewer to open the PDF in fullscreen mode

   Colorspace:
              Currently,  the  colorspace  must be forced for JPEG 2000 images that are not in the RGB colorspace.  Available colorspace options are based on Python Imaging Library (PIL)
              short handles.

       RGB    RGB color

       L      Grayscale

       1      Black and white (internally converted to grayscale)

       CMYK   CMYK color

       CMYK;I CMYK color with inversion (for CMYK JPEG files from Adobe)

   Paper sizes:
              You can specify the short hand paper size names shown in the first column in the table below as arguments to the --pagesize and --imgsize options.   The  width  and  height
              they  are mapping to is shown in the second column.  Giving the value in the second column has the same effect as giving the short hand in the first column. Appending ^T (a
              caret/circumflex followed by the letter T) turns the paper size from portrait into landscape. The postfix thus symbolizes the transpose. The values are case insensitive.

       A0     841mmx1189mm

       A1     594mmx841mm

       A2     420mmx594mm

       A3     297mmx420mm

       A4     210mmx297mm

       A5     148mmx210mm

       A6     105mmx148mm

       Legal  8.5inx14in

       Letter 8.5inx11in

       Tabloid
              11inx17in

   Fit options:
              The img2pdf options for the --fit argument are shown in the first column in the table below. The function of these options can be mapped to the geometry operators of image‐
              magick.  For  users  who are familiar with imagemagick, the corresponding operator is shown in the second column.  The third column shows whether or not the aspect ratio is
              preserved for that option (same as in imagemagick). Just like imagemagick, img2pdf tries hard to preserve the aspect ratio, so if the --fit argument is not given, then  the
              default is "into" which corresponds to the absence of any operator in imagemagick.  The value of the --fit option is case insensitive.

       into   |   | Y | The default. Width and height values specify maximum |   |   | values.

       ---------+---+---+----------------------------------------------------------

       fill   | ^ | Y | Width and height values specify the minimum values.

       ---------+---+---+----------------------------------------------------------

       exact  | ! | N | Width and height emphatically given.

       ---------+---+---+----------------------------------------------------------

       shrink
              | > | Y | Shrinks an image with dimensions larger than the given |   |   | ones (and otherwise behaves like "into").

       ---------+---+---+----------------------------------------------------------

              enlarge | < | Y | Enlarges an image with dimensions smaller than the given

       |      |   | ones (and otherwise behaves like "into").

   Argument parsing:
              Argument long options can be abbreviated to a prefix if the abbreviation is unambiguous. That is, the prefix must match a unique option.

              Beware of your shell interpreting argument values as special characters (like the semicolon in the CMYK;I colorspace option). If in doubt, put the argument values in single
              quotes.

              If you want an argument value to start with one or more minus characters, you must use the long option name and join them with an equal sign like so:

              $ img2pdf --author=--test--

              If your input file name starts with one or more minus characters, either separate the input files from the other arguments by two minus signs:

              $ img2pdf -- --my-file-starts-with-two-minuses.jpg

              Or be more explicit about its relative path by prepending a ./:

              $ img2pdf ./--my-file-starts-with-two-minuses.jpg

              The order of non-positional arguments (all arguments other than the input images) does not matter.

EXAMPLES
              Lines starting with a dollar sign denote commands you can enter into your terminal. The dollar sign signifies your command prompt. It is not part of the command you type.

              Convert two scans in JPEG format to a PDF document.

              $ img2pdf --output out.pdf page1.jpg page2.jpg

              Convert a directory of JPEG images into a PDF with printable A4 pages in landscape mode. On each page, the photo takes the maximum amount of space while preserving its  as‐
              pect ratio and a print border of 2 cm on the top and bottom and 2.5 cm on the left and right hand side.

              $ img2pdf --output out.pdf --pagesize A4^T --border 2cm:2.5cm *.jpg

              On each A4 page, fit images into a 10 cm times 15 cm rectangle but keep the original image size if the image is smaller than that.

              $ img2pdf --output out.pdf -S A4 --imgsize 10cmx15cm --fit shrink *.jpg

              Prepare a directory of photos to be printed borderless on photo paper with a 3:2 aspect ratio and rotate each page so that its orientation is the same as the input image.

              $ img2pdf --output out.pdf --pagesize 15cmx10cm --auto-orient *.jpg

              Encode a grayscale JPEG2000 image. The colorspace has to be forced as img2pdf cannot read it from the JPEG2000 file automatically.

              $ img2pdf --output out.pdf --colorspace L input.jp2

AUTHOR
       Written by Johannes 'josch' Schauer <josch@mister-muffin.de>

REPORTING BUGS
       Report bugs at https://gitlab.mister-muffin.de/josch/img2pdf/issues

img2pdf 0.4.0                                                                           August 2020                                                                             IMG2PDF(1)
