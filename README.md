# The *Cash-Tracker*

It's an application for tracking personal finances: incomes, expenditures, savings & many more. It also allows users to analyze their financial data with the use of numerical as well graphical analysis tools. The application is available for users mainly through the mobile interface (more exactly the PWA, progressive web application) but it's also accessible through web browser on the other, non-mobile devices. This user interface  connects with the server-side of the application where all the data is safely stored and preprocessed for the client side. Furthermore, the client-side of an application remains mostly functional even if there is no connection to the server.

- [The *Cash-Tracker*](#the-cash-tracker)
  - [Changelog](#changelog)
  - [Users' profiles](#users-profiles)
    - [Superuser](#superuser)
    - [Common user](#common-user)
    - [Guest](#guest)
  - [Functional requirements](#functional-requirements)
  - [Use cases](#use-cases)
  - [Database](#database)

## Changelog

Click [here](/docs/versions.md) to access list of changes & tasks implemented for each version.

## Users' profiles

### Superuser

The main administrator of the whole system. It could manage other users' accounts. Super user is not also considered as a common user.

### Common user

Logged-in users of the system that can access main functionalities of the system. The common user can only access their personal data & manage only theirs personal account.

### Guest

Non-logged-in user that can't neither access or store any data in the system nor use system's core functionalities until obtaining personal account.

## Functional requirements

1. **Storing incomes/expenditures:** All common users can enter any type of income/expenditure to the system. Such income/expenditure has its name, value & timestamp and target. Apart from that it must be assigned to some category available in the system. This way the incomes history that's then accessible in a form of a list is created.

2. **Visualizing incomes/expenditures history:** Common users can visualize their incomes in a form of linear graph where each series represent a singular target of income/expenditure. The *Y* value of this graph is income's/expenditure's value & the *X* values represent timestamps. It's possible to set time range that would be taken into consideration in such summary.

3. **Visualizing incomes/expenditures categories ratio:** Common users can visualize how much they gain/spend from each category with the use of pie chart. It's possible to set time range that would be taken into consideration in such summary.

4. **Removing incomes/expenditures:** User can permanently remove selected incomes/expenditures from the history.

5. **Modifying incomes/expenditures:** Common user can modify attributes of selected incomes/expenditures: name, value, target and category.

6. **User accounts:** System allows all users to register as many personal accounts as they want. To have an account an email, name, surname and password are needed.

7. **Data safety:** System allows common users to access/modify only data assigned to their currently used account. Access and modification to other accounts' data is blocked.

## Use cases

Click [here](/docs/use_cases.md) to access use cases documentation.

## Database 

Click [here](/docs/database.md) to access database documentation.
