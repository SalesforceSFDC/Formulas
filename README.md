# Formulas

https://help.salesforce.com/articleView?id=tips_on_building_formulas.htm&siteLang=en_US&type=0

https://help.salesforce.com/articleView?id=customize_formulas.htm&type=0&language=en_US&release=208.13

https://help.salesforce.com/articleView?id=workflow_examples.htm&type=0

https://developer.salesforce.com/forums/?id=906F0000000BUSaIAO

## IF Statement

If (Field Name) = "Value", then do this, else do that
- comma is used in place of "then" and "else",
Right parenthesis is used in place of End if

#### SQL IF Statement
```SQL
If State = "CA" then Region = "West" Else
If State = "WA" then Region = "West Else
```

#### Salesforce Formula IF Statement

```SQL
If(State = "CA", "West",
If(State = "WA", "West",
If(State = "NY", "East",
If(State = "IL", "Mid-West", " "))))
```

## CASE Statement
```
CASE(Fieldname, Value1, Result1,
                Value2, Result2,
                Else_Result)
```

```SQL
CASE(State, 
    "CA", "West",
    "WA", "West",
    "NY", "East",
    "IL", "Mid-West",
    " ")
```

## AND Statement (Compare Values)

```sql
IF State = "CA" AND Country = "USA" then Region = "USA" END IF
```

```
AND(value 1, value 2, value 3,...)
```
=
```
(value 1 && value 2 && value 3 && ...)
```

```sql
IF(
AND(State="CA", Country="USA"), "West USA", " "), " ")
```
```sql
IF((State = "CA" && Country="USA"), "West-USA", " ")
```

## OR Statement
If Priority = "High" OR Type = "Problem" then
Notification Flag = "True" End if
```
OR (Value 1, value 2, value, ...)
```
=
```sql
(value 1 || value 2 || value 3)
```
```sql
IF(
OR(Priority = "High", Type = "Problem"), "True", "False"
)
```
```sql
IF(
(Priority = "High" || Type = "Problem"), "True", "False"
)
```

## AND & OR Combined
IF (Priority = "High" OR Type = "Problem") AND Status = "Open" then Notification Flag = "True" End If

```sql
IF(
AND(
OR(ISPICKVAL(Priority, "High") || ISPICKVAL(Type, "Problem"))

&& ISPICKVAL(Status, "Open"), "True", "False")
```
## Business Case: Completeness Score and Qualitative Lead Scoring

* Completeness Score - shows the lead rating based on the info in the lead.
* Qualitative Scoring - how good are the leads based on the qualification questions.

#### BANT - 'Budget, Authority, Need & Timeframe' Score
