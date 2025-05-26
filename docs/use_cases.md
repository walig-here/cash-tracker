# Use-cases

![use case diagram](/gfx/ucd.drawio.png)

- [Use-cases](#use-cases)
  - [Register](#register)
    - [Scenario](#scenario)
  - [Login](#login)
    - [Scenario](#scenario-1)
  - [Visualize expenditures categories](#visualize-expenditures-categories)
    - [Preconditions](#preconditions)
    - [Scenario](#scenario-2)
  - [Visualize expenditures history](#visualize-expenditures-history)
    - [Preconditions](#preconditions-1)
    - [Scenario](#scenario-3)
  - [Modify expenditure](#modify-expenditure)
    - [Preconditions](#preconditions-2)
    - [Scenario](#scenario-4)
  - [Remove expenditure](#remove-expenditure)
    - [Preconditions](#preconditions-3)
    - [Scenario](#scenario-5)
  - [Browse expenditures](#browse-expenditures)
    - [Preconditions](#preconditions-4)
    - [Scenario](#scenario-6)
  - [Add expenditure](#add-expenditure)
    - [Preconditions](#preconditions-5)
    - [Scenario](#scenario-7)
  - [Add income](#add-income)
    - [Preconditions](#preconditions-6)
    - [Scenario](#scenario-8)
  - [Browse incomes](#browse-incomes)
    - [Preconditions](#preconditions-7)
    - [Scenario](#scenario-9)
  - [Remove income](#remove-income)
    - [Preconditions](#preconditions-8)
    - [Scenario](#scenario-10)


## Register

### Scenario

1. *Guest* enters email. This can't be empty.
2. *Guest* enters first name. This can't be empty.
3. *Guest* enters surname. This can't be empty.
4. *Guest* enters password two times for confirmation.
5. **if** entered email is already used by another account then *system* informs user about an error and **GOTO** 1.
6. **if** entered passwords don't match then *system* informs user about an error and **GOTO** 1.
7. *System* registers a new account for *guest*.
8. **START UC** *Login*

## Login

### Scenario

1. *Common user* enters email.
2. *Common user* enters password.
3. **if** there's no such email registered in the *system* then *system* informs *common user* about that and **GOTO** 1.
4. **if** password is invalid then *system* informs *common user* about that and **GOTO** 1.
5. **if** *common user* is already logged into another account then log out.
6. Log into the account with entered credentials.

## Visualize expenditures categories

### Preconditions

- *Common user* is logged into an account;

### Scenario

1. **if** *common user* has no expenditures then *system* report an error and **STOP**
2. *Common user* inserts time range that he want to include in the visualization. Selected dates must be within boundaries of *common user*'s oldest and newest expenditure's timestamps.
3. *System* plots a pie chart that shows ratio of expenditures values from each category.
4. *System* presents an additional, optionally visible list of ratios with the same data as used for the chart.

## Visualize expenditures history

### Preconditions

- *Common user* is logged into an account;

### Scenario

1. **if** *common user* has no expenditures then *system* report an error and **STOP**
2. *Common user* inserts time range that he want to include in the visualization. Selected dates must be within boundaries of *common user*'s oldest and newest expenditure's timestamps.
3. *System* plots a linear graph were each series represents a single target of expenditure. The *X* values on the graph are days from the selected range and *Y* values are aggregated expenditure values for each day.
4. *System* presents an additional, optionally visible list of expenditures values per day with the same data as used for the chart.

## Modify expenditure

### Preconditions

- *Common user* is logged into an account;
- *Common user* selected one of theirs expenditures to modify.

### Scenario

1. *Common user* optionally changes the *name* of the expenditure. Name can't be empty.
2. *Common user* optionally changes the *value* of the expenditure. This value must be a positive real number with 2 decimal places.
3. *Common user* optionally changes the *target* of the expenditure. This can't be empty.
4. *Common user* optionally re-selects one of the available categories for the expenditure.
5. **if** *Common user* cancels entered data, then **STOP**
6. *Common user* approves entered data.
7. *System* validates entered data.
8. **if** data isn't valid then inform about found mistakes and **GOTO** 1.
9. *System* stores income data in *common users*'s account.
10. *System* informs *common user* that modifying income success.

## Remove expenditure

### Preconditions

- *Common user* is logged into an account;
- *Commons user* selected one of theirs expenditures to remove from the system.

### Scenario

1. *System* ensures whether *common user* still wants to remove expenditure.
2. **if** *common user* decides not to remove expenditure then **STOP**
3. **if** expenditure not exits then *system* inform *common user* about the error and then **STOP**
4. *System* removes expenditure from *common user*'s data.

## Browse expenditures

### Preconditions

- *Common user* is logged into an account;

### Scenario

1. *System* presents a list of all expenditures that are assigned to *common user*'s account. For each expenditure its possible to see its data: name, value, timestamp, target and category. This list is sorted chronologically from newest to oldest.
2. *Common user* may select one expenditure that they would remove and **START UC** *Remove expenditure*.
3. *Common user* may select one expenditure that they would modify and **START UC** *Modify expenditure*.
4. *Common user* may want to visualize history of expenditures and **START UC** *Visualize expenditures history*.
5. *Common user* may want to visualize ratio of expenditures from different categories and **START UC** *Visualize expenditures categories*.
6. **if** *common user* still wants to browse expenditures then **GOTO** 1.

## Add expenditure

### Preconditions

- *Common user* is logged into an account.

### Scenario

1. *Common user* types in the *name* of the expenditure. Name can't be empty.
2. *Common user* types in the *value* of the expenditure. This value must be a positive real number with 2 decimal places.
3. *Common user* types in the *target* of the expenditure. This can't be empty.
4. *Common user* optionally selects one of the available categories for the expenditure (category is *None* by default).
5. **if** *Common user* cancels entered data, then **STOP**
6. *Common user* approves entered data.
7. *System* validates entered data.
8. **if** data isn't valid then inform about found mistakes and **GOTO** 1.
9. *System* generates a timestamp for expenditure based on current time.
10. *System* stores expenditure data in *common users*'s account.
11. *System* informs *common user* that adding new expenditure succeeded.
12. **START UC** *Browse expenditures*

## Add income

### Preconditions

- *Common user* is logged into an account.

### Scenario

1. *Common user* types in the *name* of the income. Name can't be empty.
2. *Common user* types in the *value* of the income. This value must be a positive real number with 2 decimal places.
3. *Common user* types in the *target* of the income. This can't be empty.
4. *Common user* optionally selects one of the available categories for the income (category is *None* by default).
5. **if** *Common user* cancels entered data, then **STOP**
6. *Common user* approves entered data.
7. *System* validates entered data.
8. **if** data isn't valid then inform about found mistakes and **GOTO** 1.
9. *System* generates a timestamp for income based on current time.
10. *System* stores income data in *common users*'s account.
11. *System* informs *common user* that adding new income succeeded.
12. **START UC** *Browse incomes*

## Browse incomes

### Preconditions

- *Common user* is logged into an account;

### Scenario

1. *System* presents a list of all incomes that are assigned to *common user*'s account. For each income its possible to see its data: name, value, timestamp, target and category. This list is sorted chronologically from newest to oldest.
2. *Common user* may select one income that they would remove and **START UC** *Remove income*.
3. *Common user* may select one income that they would modify and **START UC** *Modify income*.
4. *Common user* may want to visualize history of income and **START UC** *Visualize incomes history*.
5. *Common user* may want to visualize ratio of incomes from different categories and **START UC** *Visualize incomes categories*.
6. **if** *common user* still wants to browse incomes then **GOTO** 1.

## Remove income

### Preconditions

- *Common user* is logged into an account;
- *Commons user* selected one of theirs incomes to remove from the system.

### Scenario

1. *System* ensures whether *common user* still wants to remove income.
2. **if** *common user* decides not to remove income then **STOP**
3. **if** expenditure not exits then *system* inform *common user* about the error and then **STOP**
4. *System* removes income from *common user*'s data.
