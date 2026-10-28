# powershell-null-operator-scopes
A VS Code extension that adds TextMate scopes for PowerShell 7's null operators.

# Table of Contents
<!-- TOC -->
* [Null Operators](#null-operators)
* [The Default Look](#the-default-look)
* [Usage Instructions](#usage-instructions)
    * [Installation](#installation)
    * [The Scopes](#the-scopes)
    * [Where to put your highlighting rules](#where-to-put-your-highlighting-rules)
    * [Highlight All the Same Color](#highlight-all-the-same-color)
    * [Highlight Each Individually](#highlight-each-individually)
<!-- TOC -->

# Null Operators
PowerShell 7 has [two null-coalescing operators](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.6#null-coalescing-operator-) and [two null-conditional operators](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.6#null-conditional-operators--and-):

* Null-coalescing operator - `??`
* Null-coalescing assignment operator - `??=`
* Null-conditional member operator - `?.`
* Null-conditional index operator - `?[]`

[Back to top](#powershell-null-operator-scopes)

# The Default Look
By default, VS Code's PowerShell extension's syntax highlighting does not enable direct styling of these operators. Here's how they look on the current default themes, *Light 2026* and *Dark 2026*, and the *PowerShell ISE* theme that comes with Microsoft's PowerShell extension where these operators arguably look the worst:

<img width="1227" height="278" alt="defaults_and_ise" src="https://github.com/user-attachments/assets/ca5bed18-092a-4dfa-89c4-193944ac5429" />

[Back to top](#powershell-null-operator-scopes)

# Usage Instructions
This extension enables you to customize the colors of each operator on top of any existing color scheme. By creating entries in `settings.json` , it will override whatever scheme you're using and it will persist through scheme changes as well.

[Back to top](#powershell-null-operator-scopes)

## Installation
This extension is [available in the VS Code Extension Marketplace](https://marketplace.visualstudio.com/items?itemName=BryanCuneo.powershell-null-operator-scopes). You can also [download the latest version](https://github.com/BryanCuneo/powershell-null-operator-scopes/releases/latest) and install it manually. Either graphically with `Ctrl + Shift + P` -> **Developer: Install Extension from Location...** or through the command line with:

```PowerShell
code --install-extension /path/to/extension-version.vsix
```

[Back to top](#powershell-null-operator-scopes)

## The Scopes
| Operator | Scope                                                    |
|----------|----------------------------------------------------------|
| `??`     | `keyword.operator.null-coalescing.powershell`            |
| `??=`    | `keyword.operator.null-coalescing-assignment.powershell` |
| `?.`     | `keyword.operator.null-conditional-member.powershell`    |
| `?[]`    | `keyword.operator.null-conditional-index.powershell`     |

[Back to top](#powershell-null-operator-scopes)


## Where to Put Your Highlighting Rules
In your `settings.json` file (`Ctrl + Shift + P` -> **Preferences: Open User Settings (JSON)**), add the following entry:

```json
{
    // <your existing settings here...>

    "editor.tokenColorCustomizations": {
        "textMateRules": [
            // <your TextMate rules here>
        ]
    }
}
```

If you already have some `editor.tokenColorCustomizations.textMateRules` entries in your `settings.json` file, simply add new ones to the existing list.

[Back to top](#powershell-null-operator-scopes)

## Highlight All the Same Color
If you want to highlight all of the null operators the same, simply combine all the scopes into one TextMate rule:

```json
{
    "scope": "keyword.operator.null-coalescing-assignment.powershell, keyword.operator.null-coalescing.powershell, keyword.operator.null-conditional-member.powershell, keyword.operator.null-conditional-index.powershell",
    "settings": {
        "foreground": "#ff0000"
    }
}
```

That will highlight all of the null operators red:
<img width="818" height="278" alt="all_red" src="https://github.com/user-attachments/assets/8a08c053-1e19-4e45-83ac-fd35090b07d8" />

*Note that you can combine them in any way you like. All 4 together, 2 and 2, highlight 3 but not a fourth, etc.*

[Back to top](#powershell-null-operator-scopes)

## Highlight Each Individually
If instead you wish to style them all separately, you can do that with these TextMate rules:

```json
{ // ??
    "scope": "keyword.operator.null-coalescing.powershell",
    "settings": {
        "foreground": "#ff0000"
    }
},
{ // ??=
    "scope": "keyword.operator.null-coalescing-assignment.powershell",
    "settings": {
        "foreground": "#2fac4e"
    }
},
{ // ?.
    "scope": "keyword.operator.null-conditional-member.powershell",
    "settings": {
        "foreground": "#ff6600"
    }
},
{ // ?[]
    "scope": "keyword.operator.null-conditional-index.powershell",
    "settings": {
        "foreground": "#f760b5"
    }
}
```

This will highlight `??` red, `??=` green, `?.` orange, and `?[]` pink:

<img width="818" height="279" alt="individual_colors" src="https://github.com/user-attachments/assets/20de4164-bd06-484b-bbda-1540ce6d3667" />

[Back to top](#powershell-null-operator-scopes)
