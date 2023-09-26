# Azure Monitor Queries

// Data volume

Usage 
| where TimeGenerated > ago(32d)
| where StartTime >= startofday(ago(31d)) and EndTime < startofday(now())
| where IsBillable == true
| summarize BillableDataGB = sum(Quantity) / 1000. by bin(StartTime, 1d), Solution 
| render columnchart

// Billable data volume by type over the past month

Usage 
| where TimeGenerated > ago(32d)
| where StartTime >= startofday(ago(31d)) and EndTime < startofday(now())
| where IsBillable == true
| summarize BillableDataGB = sum(Quantity) / 1000. by bin(StartTime, 1d), DataType 
| render columnchart

// Billable data volume by solution and type over the past month

Usage 
| where TimeGenerated > ago(32d)
| where StartTime >= startofday(ago(31d)) and EndTime < startofday(now())
| where IsBillable == true
| summarize BillableDataGB = sum(Quantity) / 1000 by Solution, DataType
| sort by Solution asc, DataType asc

// Billable data volume for specific events

Event
| where TimeGenerated > startofday(ago(31d)) and TimeGenerated < startofday(now()) 
| where EventID == 5145 or EventID == 5156
| where _IsBillable == true
| summarize count(), Bytes=sum(_BilledSize) by EventID, bin(TimeGenerated, 1d)

// App service requests
requests
| where success == false and toint(resultCode) >= 500 and toint(resultCode) <= 599
| union (exceptions
    | extend message = strcat_delim("\n", outerType, outerMessage, innermostType, innermostMessage, details)
    )
| union (traces
    | where severityLevel in (3))
| where outerMessage <> "ResizeObserver loop limit exceeded"    
// Fixed by 629e8e4aa9f4748a4a8a9c0091347fbf0befb245:
| where message !contains 'clientHeight'
| where problemId <> "i is undefined at r"
// Errors contained inside Facebook Pixel tracker
| where assembly !contains "facebook"
// Unknown issue, happens on iOS,  probably comes from GTM injected scripts.
| where problemId <> "undefined is not an object (evaluating \'a.j\') at <no_method>"
| where type <> "Ordino: grecaptcha script doesn\'t seem to be loaded at the start of a public purchase"