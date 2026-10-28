# powershell-null-operator-scopes
A VS Code extension that adds TextMate scopes for PowerShell 7's null operators.

# Null operators
PowerShell 7 has [two null-coalescing operators](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.6#null-coalescing-operator-) and [two null-conditional operators](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_operators?view=powershell-7.6#null-conditional-operators--and-):

* Null-coalescing operator - `??`
* Null-coalescing assignment operator - `??=`
* Null-conditional member operator - `?.`
* Null-conditional index operator - `?[]`

# The default look
By default, VS Code's PowerShell extension's syntax highlighting does not enable direct styling of these operators. Here's how they look on the current default themes, *Light 2026* and *Dark 2026*, and the *PowerShell ISE* theme that comes with Microsoft's PowerShell extension where these operators arguably look the worst:

<img width="1227" height="278" alt="defaults_and_ise" src="https://github.com/user-attachments/assets/ca5bed18-092a-4dfa-89c4-193944ac5429" />

This extension enables you to customize the colors of each operator on top of any existing color scheme. By creating entries in `settings.json` , it will override whatever scheme you're using and it will persist through scheme changes as well.

# Installation
_coming soon_

# Usage instructions
## The scopes
| Operator | Scope                                                    |
|----------|----------------------------------------------------------|
| `??`     | `keyword.operator.null-coalescing.powershell`            |
| `??=`    | `keyword.operator.null-coalescing-assignment.powershell` |
| `?.`     | `keyword.operator.null-conditional-member.powershell`    |
| `?[]`    | `keyword.operator.null-conditional-index.powershell`     |


## Where to put your highlighting options
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

## All the same color
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

## Individually
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
