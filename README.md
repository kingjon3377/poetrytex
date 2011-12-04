# PoetryTeX
PoetryTeX is a TeX package designed to be used with XeLaTeX documents for creating anthologies of poetry.
It sets several styles, makes the use of various ligatures easier, and contains lots of macros that you might need if you were creating a book or collection of poetry.

PoetryTeX provides the package "poetrytex" which can be imported into any TeX environment that supports native UTF8 and OpenType fonts (XeLaTeX).

# Using PoetryTeX
Using PoetryTeX is as easy as installing it, and then loading it into a document using one of the following commands:

    \usepackage{poetrytex}
    \RequirePackage{poetrytex}
    
after it's loaded, several new commands and environments will be available to you:

## Poetry
There are two main environments defined in PoetryTex; `poem`, and `annotation`.

The `poem` environment takes in a title and a subtitle (or authors name, or date), and will automatically list the poem in the Table of Contents,
and the List of Poems.

The `annotation` environment takes in a title, and is for providing extra (prose) text.
Anything defined as an annotation will show up in the Table of Contents, but not in the List of Poems.

Both environments clear the page afterwards, and use the `\poetryheadings` command to set the headings
to:

	\markboth{ | \MakeUppercase{\thetitle}\hfill }{\hfill\MakeUppercase{\thegroup}\ | }
	
To create your own headings, redefine `\poetryheadings` to something like the following:

	\pagestyle{myheadings}
	\markboth{ | First heading\hfill }{\hfill Other heading\ | }

## Groups

If you want to group your poems (by year, for example), you can use the `\poemgroup{group}` command to create a title page
for the group specified, and add an entry to the table of contents and the list of poems.

If you want to change the current group (for the purpose of headings, titles, etc.) but don't want to create a title page,
simply renew the command `\thegroup` like so:

	\renewcommand{\thegroup}{Poems from 2008}

## Numbering

PoetryTeX can also number your poems for you. To have your poems automatically numbered, use the following command:

	\numberpoems

This will insert a number over the title of each poem starting with one. If you would like to reset the number counter automatically when the group is changed, simply call:

	\resetnumongroup

You can also reset, or set the value of the poem number by modifying the `poemnum` counter.

## Fonts
`\fontface` — PoetryTeX defaults the fontface to [Calluna](http://www.exljbris.com/calluna.html) a nice font face by the [exljbris Font Foundry](http://www.exljbris.com/) which is easy to read on screen, or in print.
However, by redefining the fontface command you can change it to use any standard OpenType font installed on your system.
To do this, simply write:

	\renewcommand{\fontface}{MyFontFamily}

`\altern{char}` — The altern command outputs the stylistic alternative for any character passed in using `\fontface:+salt`

There are also several special font families defined based on the current `\fontface`. These include:

`\useligatures` — Includes current Common and Rare ligatures.  
`\usediscretionary` — Includes Common, Rare, and Discretionary ligatures.  
`\useordinals` — Sets the vertical position of some characters to Ordinal.  