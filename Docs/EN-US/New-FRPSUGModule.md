---
external help file: FRPSUGModule-help.xml
Module Name: FRPSUGModule
online version: https://github.com/LaurentLienhard/FRPSUGModule/blob/master/Docs/EN-US/New-FRPSUGModule.md
schema: 2.0.0
---

# New-FRPSUGModule

## SYNOPSIS
Creating a new module structure

## SYNTAX

```
New-FRPSUGModule [[-DestinationPath] <String>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
This function allows, using a Plaster model, to generate a new module structure
Information for the creation of the module (name, version ...) will be requested by the template Plaster
This function requires having the Plaster module installed

## EXAMPLES

### EXAMPLE 1
```
New-FRPSUGModule -DestinationPath $env:TEMP
```

This command will create a new module in the Temp directory of the user

## PARAMETERS

### -DestinationPath
The directory path in which the new module will be created

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
General notes

## RELATED LINKS

[https://github.com/LaurentLienhard/FRPSUGModule/blob/master/Docs/EN-US/New-FRPSUGModule.md](https://github.com/LaurentLienhard/FRPSUGModule/blob/master/Docs/EN-US/New-FRPSUGModule.md)

