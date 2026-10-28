# Quick examples of the four null-conditional
# operators to test your color scheme against
# '??', '??=', '?.', '?[]'
$maybeNull = $null
$result = $maybeNull ?? "fallback"
$maybeNull ??= "assigned"
${maybeNull}?.Length
${maybeNull}?[0]

# '?' is a valid character in variable names,
# so these examples are not operators
$questionMarkInName? = $null
$questionMarkInName?.Length
$questionMarkInName?[0]

$result
